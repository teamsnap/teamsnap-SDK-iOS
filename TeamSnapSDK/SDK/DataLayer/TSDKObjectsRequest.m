//
//  TSDKObjectsRequest.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 12/9/14.
//  Copyright (c) 2014 TeamSnap. All rights reserved.
//

#import "TSDKObjectsRequest.h"
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
#import "TSDKBroadcastEmail.h"
#import "TSDKBroadcastAlert.h"
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
#import "TSDKPaymentNote.h"
#import "TSDKMemberPayment.h"
#import "TSDKMemberBalance.h"
#import "TSDKOpponentResults.h"
#import "TSDKEventStatistic.h"
#import "TSDKMessage.h"
#import "TSDKMessageDatum.h"
#import "TSDKDivisionLocation.h"
#import "TSDKCountry.h"
#import "TSDKTimeZone.h"
#import "TSDKLeagueCustomDatum.h"
#import "TSDKLeagueCustomField.h"
#import "TSDKMemberAssignment.h"
#import "TSDKApnDevice.h"
#import "TSDKSmsGateway.h"
#import "TSDKRootLinks.h"
#import "TSDKApplePaidFeature.h"
#import "TSDKAdvertisement.h"
#import "TSDKMessagingPermission.h"
#import "TSDKInvoice.h"
#import "TSDKInvoicesAggregate.h"
#import "TSDKSportPosition.h"
#import "TSDKEventLineup.h"
#import "TSDKEventLineupEntry.h"
#import "TSDKBatchInvoice.h"
#import "TSDKBatchInvoiceLineItem.h"
#import "TSDKInvoiceRecipient.h"
#import "TSDKBatchInvoicesAggregate.h"
#import "TSDKInvoiceMessage.h"

static NSArray *_supportedSDKObjects;
static NSArray *knownCompletionTypes;

@implementation TSDKObjectsRequest

+ (NSArray *)supportedSDKObjects {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _supportedSDKObjects = @[[TSDKTeamFee class],
                               [TSDKOpponentResults class],
                               [TSDKPaymentNote class],
                               [TSDKForumTopic class],
                               [TSDKAdvertisement class],
                               [TSDKRootLinks class],
                               [TSDKApplePaidFeature class],
                               [TSDKAvailability class],
                               [TSDKApnDevice class],
                               [TSDKInvoice class],
                               [TSDKStatistic class],
                               [TSDKTeamResults class],
                               [TSDKBroadcastEmail class],
                               [TSDKMemberBalance class],
                               [TSDKPlan class],
                               [TSDKForumSubscription class],
                               [TSDKTslPhotos class],
                               [TSDKOpponent class],
                               [TSDKTimeZone class],
                               [TSDKMemberEmailAddress class],
                               [TSDKDivision class],
                               [TSDKLeagueCustomField class],
                               [TSDKEvent class],
                               [TSDKContactPhoneNumber class],
                               [TSDKMemberPayment class],
                               [TSDKTrackedItem class],
                               [TSDKTslMetadatum class],
                               [TSDKSport class],
                               [TSDKContact class],
                               [TSDKEventLineupEntry class],
                               [TSDKMemberPhoto class],
                               [TSDKSportPosition class],
                               [TSDKMemberPreferences class],
                               [TSDKMessage class],
                               [TSDKInvoicesAggregate class],
                               [TSDKCustomDatum class],
                               [TSDKTrackedItemStatus class],
                               [TSDKForumPost class],
                               [TSDKAssignment class],
                               [TSDKEventLineup class],
                               [TSDKMember class],
                               [TSDKTeam class],
                               [TSDKContactEmailAddress class],
                               [TSDKinvitationFinder class],
                               [TSDKTeamStatistic class],
                               [TSDKTeamMediaGroup class],
                               [TSDKTeamMediumComment class],
                               [TSDKStatisticDatum class],
                               [TSDKUser class],
                               [TSDKTeamMedium class],
                               [TSDKMemberAssignment class],
                               [TSDKCustomField class],
                               [TSDKMessagingPermission class],
                               [TSDKStatisticGroup class],
                               [TSDKMemberStatistic class],
                               [TSDKTslScore class],
                               [TSDKMemberPhoneNumber class],
                               [TSDKSmsGateway class],
                               [TSDKDivisionPreferences class],
                               [TSDKLeagueCustomDatum class],
                               [TSDKCountry class],
                               [TSDKMessageDatum class],
                               [TSDKBroadcastAlert class],
                               [TSDKEventStatistic class],
                               [TSDKTslChat class],
                               [TSDKTeamPreferences class],
                               [TSDKLocation class],
                               [TSDKDivisionLocation class],
                               [TSDKBatchInvoiceLineItem class],
                               [TSDKInvoiceRecipient class],
                               [TSDKBatchInvoice class],
                               [TSDKBatchInvoicesAggregate class],
                               [TSDKInvoiceMessage class]];
    });
    return _supportedSDKObjects;
}

+ (NSArray *)dynamicSupportedObjectsList {
    NSMutableArray *supportedObjects = [[NSMutableArray alloc] init];

    unsigned int classCount = 0;
    Class *classList = objc_copyClassList(&classCount);

    for (unsigned int i = 0; i < classCount; i++) {
        const char* potentialClassName = class_getName(classList[i]);
        if (potentialClassName != NULL &&
            strcmp(potentialClassName, "nil") != 0 &&
            strcmp(potentialClassName, "") != 0) {
            NSString *className = [NSString stringWithUTF8String:potentialClassName];
            if([className hasPrefix:@"TSDK"]) {
                Class class = NSClassFromString(className);
                
                if( [class isEqual:[TSDKCollectionObject class]] == false) {
                    if(class && [class isSubclassOfClass:[TSDKCollectionObject class]]) {
                        [supportedObjects addObject:class];
                    }
                }
            }
        }
    }
    
    if(classList != NULL) {
        free(classList);
    }
    return supportedObjects;
}

+ (void)listTeams:(NSArray *)teamIds WithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion {
    NSString *searchString = [NSString stringWithFormat:@"teams/search?team_id=%@", [teamIds componentsJoinedByString:@","]];
    
    NSURL *path = [NSURL URLWithString:searchString relativeToURL:[TSDKDataRequest baseURL]];

    [TSDKDataRequest requestObjectsForPath:path withConfiguration:configuration completion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
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
    
    NSURL *bulkTeamURL = [TSDKDataRequest appendPathToBaseURL:[NSString stringWithFormat:@"bulk_load?team_id=%@&types=%@", team.objectIdentifier, [stringDataTypes componentsJoinedByString:@","]]];
    
    [TSDKDataRequest requestObjectsForPath:bulkTeamURL withConfiguration:[TSDKRequestConfiguration requestConfigurationWithForceReload:YES] completion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
        NSArray *parsedObjects;
        if (success) {
            parsedObjects = [self SDKObjectsFromCollection:objects];
        }
        if (parsedObjects == nil) {
            parsedObjects = [[NSArray alloc] init];
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
    
    [TSDKDataRequest requestObjectsForPath:bulkTeamURL withConfiguration:[TSDKRequestConfiguration requestConfigurationWithForceReload:YES] completion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
        NSArray *parsedObjects;
        if (success) {
            parsedObjects = [self SDKObjectsFromCollection:objects];
        }
        
        if (parsedObjects == nil) {
            parsedObjects = [[NSArray alloc] init];
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

+ (TSDKTeam *)teamWithId:(NSString *)teamId inTeamsArray:(NSArray *)teams {
    NSUInteger teamIndex = [teams indexOfObjectPassingTest:^BOOL(TSDKTeam *team, NSUInteger idx, BOOL * _Nonnull stop) {
        return ([team.objectIdentifier isEqualToString:teamId]);
    }];
    if (teamIndex != NSNotFound) {
        return [teams objectAtIndex:teamIndex];
    } else {
        return nil;
    }
}

+ (void)listEventsForTeam:(TSDKTeam *)team startDate:(NSDate *)startDate endDate:(NSDate *)endDate completion:(TSDKArrayCompletionBlock)completion {
    if (team) {
        
        NSMutableDictionary *dateParamaters = [[NSMutableDictionary alloc] init];
        if (startDate) {
            [dateParamaters setValue:[startDate RCF3339DateTimeString] forKey:@"started_after"];
        }
        
        if (endDate) {
            [dateParamaters setValue:[endDate RCF3339DateTimeString] forKey:@"started_before"];
        }
        
        [TSDKDataRequest requestObjectsForPath:team.linkEvents searchParamaters:[dateParamaters copy] sendDataDictionary:nil method:nil withConfiguration:[TSDKRequestConfiguration new] completion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
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

+ (NSDictionary *)eventsParametersWithTeams:(NSArray *)teams pageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize startDate:(NSDate*)startDate endDate:(NSDate*)endDate {
    
    NSString *teamIds = [self teamIdsParameterForTeams:teams];
    NSMutableDictionary *paramaters = [[NSMutableDictionary alloc] init];
    [paramaters setValue:teamIds forKey:@"team_id"];
    [paramaters setValue:[@(pageNumber) stringValue] forKey:@"page_number"];
    [paramaters setValue:[@(pageSize) stringValue] forKey:@"page_size"];
    if (startDate) {
        [paramaters setValue:[startDate RCF3339DateTimeString] forKey:@"started_after"];
    }
    if (endDate) {
        [paramaters setValue:[endDate RCF3339DateTimeString] forKey:@"started_before"];
    }
    
    return [paramaters copy];
}

+ (NSString *)teamIdsParameterForTeams:(NSArray *)teams {
    
    NSMutableArray *teamIds = [NSMutableArray array];
    for (TSDKTeam *team in teams) {
        [teamIds addObject:team.objectIdentifier];
    }
    return [teamIds componentsJoinedByString:@","];
}

+ (void)listEventsForTeams:(NSArray *)teams pageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize startDate:(NSDate*)startDate endDate:(NSDate*)endDate rootLinks:(TSDKRootLinks *)rootLinks completion:(TSDKArrayCompletionBlock)completion {

    NSString *eventsBaseURL = rootLinks.linkEvents.absoluteString;
    NSURL *eventsURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/search", eventsBaseURL]];
    NSDictionary *parameters = [self eventsParametersWithTeams:teams pageNumber:pageNumber pageSize:pageSize startDate:startDate endDate:endDate];
    
    [TSDKDataRequest requestObjectsForPath:eventsURL searchParamaters:parameters sendDataDictionary:nil method:nil withConfiguration:[TSDKRequestConfiguration new] completion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
        NSArray *parsedObjects;
        if (success) {
            parsedObjects = [self SDKObjectsFromCollection:objects];
        }
        
        if (parsedObjects == nil) {
            parsedObjects = [[NSArray alloc] init];
        }
        
        if (completion) {
            completion(success, complete, parsedObjects, error);
        }
    }];
}

+ (void)listEventsForTeams:(NSArray<TSDKTeam*>*)teamIds pageNumber:(NSInteger)pageNumber pageSize:(NSInteger)pageSize startDate:(NSDate*)startDate endDate:(NSDate*)endDate completion:(TSDKEventArrayCompletionBlock)completion {
    
    // these values are checked before using but we should assert their expected value right away
    NSParameterAssert(startDate);
    
    [[TSDKTeamSnap sharedInstance] rootLinksWithConfiguration:nil completion:^(TSDKRootLinks *rootLinks, NSError * _Nullable error) {
        if (rootLinks) {
            [self listEventsForTeams:teamIds pageNumber:pageNumber pageSize:pageSize startDate:startDate endDate:endDate rootLinks:rootLinks completion:completion];
        } else if (completion) {
            completion(NO, NO, nil, nil);
        }
    }];
}

+ (void)invitationStatusForEmailAddress:(NSString *)emailAddress withCompletion:(TSDKInviteStatusCompletionBlock)completionBlock {
    NSURL *invitationFinderPath = [TSDKDataRequest appendPathToBaseURL:[NSString stringWithFormat:@"invitation_finder?email_address=%@", [emailAddress stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet alphanumericCharacterSet]]]];
    
    [TSDKDataRequest requestObjectsForPath:invitationFinderPath withConfiguration:[TSDKRequestConfiguration requestConfigurationWithForceReload:YES] completion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
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

    NSUInteger classIndex = [self.supportedSDKObjects indexOfObjectPassingTest:^BOOL(Class objClass, NSUInteger idx, BOOL *stop) {
        return [[objClass SDKType] isEqualToString:collectionJSON.type];
    }];
    
    if (classIndex!=NSNotFound) {
        result = [(TSDKCollectionObject *)[[self.supportedSDKObjects objectAtIndex:classIndex] alloc] initWithCollection:collectionJSON];
    } else {
        result = [[TSDKCollectionObject alloc] initWithCollection:collectionJSON];
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
        for (Class class in self.supportedSDKObjects) {
            [completionTypes addObject:[class completionBlockTypeName]];
        }
        knownCompletionTypes = [NSArray arrayWithArray:completionTypes];
    }
    return [knownCompletionTypes copy];
}

+ (void)dumpCompletionTypes {
    NSMutableString *classCompletionBlockString = [[NSMutableString alloc] init];
    for (Class class in self.supportedSDKObjects) {
        [classCompletionBlockString appendFormat:@"%@\n", [[class completionBlockArrayDescription]  underscoresToCamelCase]];
    }
    DLog(@"\n%@", [self.supportedSDKObjects componentsJoinedByString:@","]);
    DLog(@"\n%@",classCompletionBlockString);
}

+ (NSString *)typeForRel:(NSString *)rel {
    NSInteger typeIndex = [self.supportedSDKObjects indexOfObjectPassingTest:^BOOL(Class class, NSUInteger idx, BOOL * _Nonnull stop) {
        return [[class SDKREL] isEqualToString:rel];
    }];
    if (typeIndex != NSNotFound) {
        return [[self.supportedSDKObjects objectAtIndex:typeIndex] SDKType];
    }
    return nil;
}

+ (NSString *)relForType:(NSString *)type {
    NSInteger typeIndex = [self.supportedSDKObjects indexOfObjectPassingTest:^BOOL(Class class, NSUInteger idx, BOOL * _Nonnull stop) {
        return [[class SDKType] isEqualToString:type];
    }];
    if (typeIndex != NSNotFound) {
        return [[self.supportedSDKObjects objectAtIndex:typeIndex] SDKREL];
    }
    return nil;
}

@end
