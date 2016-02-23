//
//  TSDKObjectsRequest.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 12/9/14.
//  Copyright (c) 2014 TeamSnap. All rights reserved.
//

#import "TSDKObjectsRequest.h"
#import "NSMutableDictionary+integerKey.h"
#import "NSMutableDictionary+refreshCollectionData.h"
#import "NSString+TSDKConveniences.h"
#import <objc/runtime.h>
#import "TSDKDataRequest.h"
#import "TSDKTeam.h"
#import "TSDKUser.h"
#import "TSDKMember.h"
#import "TSDKMemberEmailAddress.h"
#import "TSDKMemberPhoneNumber.h"
#import "TSDKContact.h"
#import "TSDKContactEmailAddress.h"
#import "TSDKContactPhoneNumber.h"
#import "TSDKEvent.h"
#import "TSDKTrackedItem.h"
#import "TSDKAssignment.h"
#import "NSDate+TSDKConveniences.h"
#import "TSDKProfileTimer.h"
#import "TSDKBroadcastEmail.h"
#import "TSDKBroadcastSms.h"
#import "TSDKCustomField.h"
#import "TSDKCustomDatum.h"
#import "TSDKForumTopic.h"
#import "TSDKForumPost.h"
#import "TSDKLocation.h"
#import "TSDKOpponent.h"
#import "TSDKTeamFee.h"
#import "TSDKTrackedItemStatus.h"
#import "TSDKStatistic.h"
#import "TSDKStatisticDatum.h"
#import "TSDKStatisticGroup.h"
#import "TSDKTeamStatistic.h"
#import "TSDKSport.h"
#import "TSDKMemberStatistic.h"
#import "TSDKTeamPreferences.h"
#import "TSDKPlan.h"
#import "TSDKTeamSnap.h"
#import "TSDKTeamResults.h"
#import "TSDKinvitationFinder.h"
#import "TSDKTeamMediaGroup.h"
#import "TSDKMemberPreferences.h"
#import "TSDKForumSubscription.h"
#import "TSDKTeamMedium.h"

static NSMutableArray *supportedSDKObjects;
static NSArray *knownCompletionTypes;

@implementation TSDKObjectsRequest

+ (NSArray *)supportedSDKObjects {
    if (!supportedSDKObjects) {
        NSMutableArray *supportedbjects = [[NSMutableArray alloc] init];
        
        int numClasses;
        Class *classes = NULL;
        numClasses = objc_getClassList(NULL, 0);
        
        if (numClasses > 0 ) {
            classes = (__unsafe_unretained Class *)malloc(sizeof(Class) * numClasses);
            numClasses = objc_getClassList(classes, numClasses);
            for (int i = 0; i < numClasses; i++) {
                NSString *className = [NSString stringWithUTF8String:class_getName(classes[i])];
                if([className hasPrefix:@"TSDK"]) {
                    Class class = NSClassFromString(className);
                    if(class && [class isSubclassOfClass:[TSDKCollectionObject class]]) {
                        [supportedbjects addObject:class];
                    }
                }
            }
            free(classes);
        }
        supportedSDKObjects = supportedbjects;
    }
    return  supportedSDKObjects;
}

+ (void)listTeams:(NSArray *)teamIds WithCompletion:(TSDKArrayCompletionBlock)completion {
    NSString *searchString = [NSString stringWithFormat:@"teams/search?team_id=%@", [teamIds componentsJoinedByString:@","]];
    
    NSURL *path = [NSURL URLWithString:searchString relativeToURL:[TSDKDataRequest baseURL]];

    [TSDKDataRequest requestObjectsForPath:path withCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
        NSArray *teams;
        if (success) {
            teams = [self SDKObjectsFromCollection:objects collectionType:[TSDKTeam SDKType]];
        }
        if (completion) {
            completion(success, complete, teams, error);
        }
    }];
}

+ (void)bulkLoadTeamData:(TSDKTeam *)team types:(NSArray *)objectDataTypes completion:(TSDKArrayCompletionBlock)completion {
    if (!objectDataTypes) {
        objectDataTypes = @[[TSDKEvent class], [TSDKMember class]];
    }
    
    NSArray *stringDataTypes = [self objectTypeStringsFromClasses:objectDataTypes];
    
    NSURL *bulkTeamURL = [TSDKDataRequest appendPathToBaseURL:[NSString stringWithFormat:@"bulk_load?team_id=%ld&types=%@", (long)team.objectIdentifier, [stringDataTypes componentsJoinedByString:@","]]];
    
    [TSDKDataRequest requestObjectsForPath:bulkTeamURL withCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
        NSArray *parsedObjects;
        if (success) {
            [[TSDKProfileTimer sharedInstance] startTimeWithId:@"BULK Parse"];
            parsedObjects = [self SDKObjectsFromCollection:objects];
            for (TSDKCollectionObject *sdkObject in parsedObjects) {
                [team processBulkLoadedObject:sdkObject];
            }
            [[TSDKProfileTimer sharedInstance] getElapsedTimeForId:@"BULK Parse" logResult:YES];
        }
        if (completion) {
            completion(success, complete, parsedObjects, error);
        }
    }];
}


+ (void)bulkLoadTeamDataForTeamIds:(NSArray *)teamIds types:(NSArray *)objectDataTypes completion:(TSDKArrayCompletionBlock)completion {
    if (!objectDataTypes) {
        objectDataTypes = @[[TSDKEvent class], [TSDKMember class]];
    }
    
    NSArray *stringDataTypes = [self objectTypeStringsFromClasses:objectDataTypes];
    
    NSURL *bulkTeamURL = [TSDKDataRequest appendPathToBaseURL:[NSString stringWithFormat:@"bulk_load?team_id=%@&types=%@", [teamIds componentsJoinedByString:@","], [stringDataTypes componentsJoinedByString:@","]]];
    
    [TSDKDataRequest requestObjectsForPath:bulkTeamURL withCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
        NSArray *parsedObjects;
        if (success) {
            [[TSDKProfileTimer sharedInstance] startTimeWithId:@"BULK Parse"];
            parsedObjects = [self SDKObjectsFromCollection:objects];
            for (TSDKCollectionObject *sdkObject in parsedObjects) {
                if ([sdkObject isKindOfClass:[TSDKTeam class]]) {
                    [[[TSDKTeamSnap sharedInstance] teamSnapUser] addTeam:(TSDKTeam *)sdkObject];
                } else if ([sdkObject isKindOfClass:[TSDKPlan class]]) {
                    [[TSDKTeamSnap sharedInstance] addPlan:(TSDKPlan *)sdkObject];
                } else {
                    if ([[sdkObject.collection data] objectForKey:@"team_id"]) {
                        TSDKTeam *team =[[[[TSDKTeamSnap sharedInstance] teamSnapUser] teams] objectForIntegerKey:[[[sdkObject.collection data] objectForKey:@"team_id"] integerValue]];
                        if (team) {
                            [team processBulkLoadedObject:sdkObject];
                        }
                    } else {
                        DLog(@"Unknown parent Object from bulk load: %@", [sdkObject class]);
                    }
                }
            }
            
            [[TSDKProfileTimer sharedInstance] getElapsedTimeForId:@"BULK Parse" logResult:YES];
        }
        if (completion) {
            completion(success, complete, parsedObjects, error);
        }
    }];
}

+ (NSArray *)objectTypeStringsFromClasses:(NSArray *)objectDataTypes {
    NSMutableArray *stringDataTypes = [[NSMutableArray alloc] init];
    
    for (Class class in objectDataTypes) {
        if ([class isSubclassOfClass:[TSDKCollectionObject class]]) {
            [stringDataTypes addObject:[class SDKType]];
        }
    }
    return [NSArray arrayWithArray:stringDataTypes];
}

+ (TSDKTeam *)teamWithId:(NSInteger)teamId inTeamsArray:(NSArray *)teams {
    NSUInteger teamIndex = [teams indexOfObjectPassingTest:^BOOL(TSDKTeam *team, NSUInteger idx, BOOL * _Nonnull stop) {
        return (team.objectIdentifier == teamId);
    }];
    if (teamIndex != NSNotFound) {
        return [teams objectAtIndex:teamIndex];
    } else {
        return nil;
    }
}

+ (void)listEventsForTeam:(TSDKTeam *)team completion:(TSDKArrayCompletionBlock)completion {
    if (team) {
        [TSDKDataRequest requestObjectsForPath:team.linkEvents withCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
            NSArray *teams;
            if (success) {
                teams = [self SDKObjectsFromCollection:objects collectionType:[TSDKEvent SDKType]];
            }
            if (completion) {
                completion(success, complete, teams, error);
            }
        }];
    }
    
}

+ (void)listEventsForTeam:(TSDKTeam *)team startDate:(NSDate *)startDate endDate:(NSDate *)endDate completion:(TSDKArrayCompletionBlock)completion {
    if (team) {
        NSMutableString *eventByDateURLString = [NSMutableString stringWithString:[team.linkEvents absoluteString]];
        if (startDate) {
            [eventByDateURLString appendFormat:@"&started_after=%@", [startDate RCF3339DateTimeString]];
        }
        if (endDate) {
            [eventByDateURLString appendFormat:@"&started_before=%@", [endDate RCF3339DateTimeString]];
        }

        [TSDKDataRequest requestObjectsForPath:[NSURL URLWithString:eventByDateURLString] withCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
            NSArray *events;
            if (success) {
                events = [self SDKObjectsFromCollection:objects collectionType:[TSDKEvent SDKType]];
            }
            if (completion) {
                completion(success, complete, events, error);
            }
        }];
    }

}

+ (void)listAvailabilitesForTeam:(TSDKTeam *)team completion:(TSDKArrayCompletionBlock)completion {
    if (team) {
        NSMutableString *availabilityURLString = [NSMutableString stringWithString:[team.linkAvailabilities absoluteString]];
        
        [TSDKDataRequest requestObjectsForPath:[NSURL URLWithString:availabilityURLString] withCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
//            NSArray *availabilites;
//            if (success) {
//                events = [self SDKObjectsFromCollection:objects collectionType:TSDKDataTypeIdentifierEventObject];
//            }
//            if (completion) {
//                completion(success, complete, events, error);
//            }
        }];
    }
}

+ (void)listRosterForTeam:(TSDKTeam *)team completion:(TSDKArrayCompletionBlock)completion {
    if (team) {
        [TSDKDataRequest requestObjectsForPath:team.linkMembers withCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
            NSArray *rosters;
            if (success) {
                rosters = [self SDKObjectsFromCollection:objects collectionType:[TSDKMember SDKType]];
            }
            if (completion) {
                completion(success, complete, rosters, error);
            }
        }];
    }
}

+ (void)listTrackedItemsForTeam:(TSDKTeam *)team completion:(TSDKArrayCompletionBlock)completion {
    if (team) {
        [TSDKDataRequest requestObjectsForPath:team.linkTrackedItems withCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
            NSArray *trackedItems;
            if (success) {
                trackedItems = [self SDKObjectsFromCollection:objects collectionType:[TSDKTrackedItem SDKType]];
            }
            if (completion) {
                completion(success, complete, trackedItems, error);
            }
        }];
    }
}

+ (void)invitationStatusForEmailAddress:(NSString *)emailAddress withCompletion:(TSDKInviteStatusCompletionBlock)completionBlock {
    NSURL *invitationFinderPath = [TSDKDataRequest appendPathToBaseURL:[NSString stringWithFormat:@"invitation_finder?email_address=%@", [emailAddress stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet alphanumericCharacterSet]]]];
    
    [TSDKDataRequest requestObjectsForPath:invitationFinderPath withCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
        TSDKinvitationFinder *inviteStatus = nil;
        if (success) {
            if ([objects.collection count] > 0) {
                inviteStatus = [[TSDKinvitationFinder alloc] initWithCollection:[objects.collection objectAtIndex:0]];
            }
        }
        if (completionBlock) {
            completionBlock(success, YES, inviteStatus, error);
        }
    }];
}

+ (NSArray *)SDKObjectsFromCollection:(TSDKCollectionJSON *)containerCollection {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for (TSDKCollectionJSON *subCollection in containerCollection.collection) {
        TSDKCollectionObject *object = [self teamSnapObjectFromCollectionJSON:subCollection];
        if (object) {
            [result addObject:object];
        }
    }
    return [NSArray arrayWithArray:result];
}

+ (NSArray *)SDKObjectsFromCollection:(TSDKCollectionJSON *)containerCollection collectionType:(NSString *)collectionType {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for (TSDKCollectionJSON *subCollection in containerCollection.collection) {
        if ([subCollection.type isEqualToString:collectionType]) {
            TSDKCollectionObject *object = [self teamSnapObjectFromCollectionJSON:subCollection];
            if (object) {
                [result addObject:object];
            }
        }
    }
    return [NSArray arrayWithArray:result];
}

+ (TSDKCollectionObject *)teamSnapObjectFromCollectionJSON:(TSDKCollectionJSON *)collectionJSON {
    TSDKCollectionObject *result = nil;
    static NSMutableDictionary *unknownTypes;
    static NSMutableDictionary *logHeadersForTypes;
    
    if (!unknownTypes) {
        unknownTypes = [[NSMutableDictionary alloc] init];
    }
    
    if (!logHeadersForTypes) {
        logHeadersForTypes = [[NSMutableDictionary alloc] init];
    }
    
    
    NSUInteger classIndex = [self.supportedSDKObjects indexOfObjectPassingTest:^BOOL(Class objClass, NSUInteger idx, BOOL *stop) {
        return [[objClass SDKType] isEqualToString:collectionJSON.type];
    }];
    
    if (classIndex!=NSNotFound) {
        result = [(TSDKCollectionObject *)[[self.supportedSDKObjects objectAtIndex:classIndex] alloc] initWithCollection:collectionJSON];
        if (result.logHeader && ![logHeadersForTypes objectForKey:collectionJSON.type]) {
            DLog(@"type: %@\n%@", collectionJSON.type, [collectionJSON getObjectiveCHeaderSkeleton]);
            [logHeadersForTypes setObject:@"Logged" forKey:collectionJSON.type];
        }
    } else {
        result = [[TSDKCollectionObject alloc] initWithCollection:collectionJSON];
        
        if (![unknownTypes objectForKey:collectionJSON.type]) {
            DLog(@"Unknown type: %@\n%@", collectionJSON.type, [collectionJSON getObjectiveCHeaderSkeleton]);
            [unknownTypes setValue:[collectionJSON getObjectiveCHeaderSkeleton] forKey:collectionJSON.type];
        }
    }

    return result;
}

+ (TSDKUser *)processLoginCollectionJSON:(TSDKCollectionJSON *)containerCollection {
    TSDKUser *user = nil;
    for (TSDKCollectionJSON *subCollection in containerCollection.collection) {
        if ([subCollection.type isEqualToString:[TSDKUser SDKType]]) {
            user = [[TSDKUser alloc] initWithCollection:subCollection];
            return user;
        }
    }
    return nil;
}

+ (NSArray *)knownCompletionTypes {
    if (!knownCompletionTypes) {
        NSMutableArray *completionTypes = [[NSMutableArray alloc] init];
        for (Class class in supportedSDKObjects) {
            [completionTypes addObject:[class completionBlockTypeName]];
        }
        knownCompletionTypes = [NSArray arrayWithArray:completionTypes];
    }
    return knownCompletionTypes;
}

+ (void)dumpCompletionTypes {
    NSMutableString *classCompletionBlockString = [[NSMutableString alloc] init];
    //        NSMutableString *includeHeadersString = [[NSMutableString alloc] init];
    for (Class class in supportedSDKObjects) {
        [classCompletionBlockString appendFormat:@"%@\n", [[class completionBlockArrayDescription]  underscoresToCamelCase]];
    }
    DLog(@"\n%@", [supportedSDKObjects componentsJoinedByString:@","]);
    DLog(@"\n%@",classCompletionBlockString);
}

+ (NSString *)typeForRel:(NSString *)rel {
    NSInteger typeIndex = [self.supportedSDKObjects indexOfObjectPassingTest:^BOOL(Class class, NSUInteger idx, BOOL * _Nonnull stop) {
        return [[class SDKREL] isEqualToString:rel];
    }];
    if (typeIndex != NSNotFound) {
        return [[[self supportedSDKObjects] objectAtIndex:typeIndex] SDKType];
    }
    return nil;
}

+ (NSString *)relForType:(NSString *)type {
    NSInteger typeIndex = [self.supportedSDKObjects indexOfObjectPassingTest:^BOOL(Class class, NSUInteger idx, BOOL * _Nonnull stop) {
        return [[class SDKType] isEqualToString:type];
    }];
    if (typeIndex != NSNotFound) {
        return [[[self supportedSDKObjects] objectAtIndex:typeIndex] SDKREL];
    }
    return nil;
}

@end
