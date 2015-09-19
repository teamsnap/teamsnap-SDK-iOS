//
//  TSDKObjectsRequest.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 12/9/14.
//  Copyright (c) 2014 TeamSnap. All rights reserved.
//

#import "TSDKObjectsRequest.h"
#import "TSDKTeam.h"
#import "TSDKUser.h"
#import "TSDKMember.h"
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

static NSArray *supportedSDKObjects;

@implementation TSDKObjectsRequest

+ (NSArray *)supportedSDKObjects {
    if (!supportedSDKObjects) {
        supportedSDKObjects = @[
                                [TSDKTeam class],
                                [TSDKUser class],
                                [TSDKMember class],
                                [TSDKEvent class],
                                [TSDKTrackedItem class],
                                [TSDKAssignment class],
                                [TSDKBroadcastEmail class],
                                [TSDKBroadcastSms class],
                                [TSDKCustomField class],
                                [TSDKCustomDatum class],
                                [TSDKForumTopic class],
                                [TSDKForumPost class],
                                [TSDKLocation class],
                                [TSDKOpponent class],
                                [TSDKTeamFee class],
                                [TSDKTrackedItemStatus class],
                                [TSDKStatistic class],
                                [TSDKStatisticDatum class],
                                [TSDKStatisticGroup class],
                                [TSDKTeamStatistic class],
                                [TSDKSport class],
                                [TSDKMemberStatistic class],
                                [TSDKPlan class],
                                [TSDKTeamPreferences class],
                                ];
    }
    return supportedSDKObjects;
}

+ (void)listTeamsForUser:(TSDKUser *)user WithCompletion:(TSDKArrayCompletionBlock)completion {
    if (user) {
        [TSDKDataRequest requestObjectsForPath:user.linkTeams withCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
            NSArray *teams;
            if (success) {
                teams = [self SDKObjectsFromCollection:objects collectionType:[TSDKTeam SDKType]];
            }
            if (completion) {
                completion(success, complete, teams, error);
            }
        }];
    }
}

+(void)listTeams:(NSArray *)teamIds WithCompletion:(TSDKArrayCompletionBlock)completion {
    NSString * path = [NSString stringWithFormat:@"https://apiv3.teamsnap.com/teams/search?team_id=%@", [teamIds componentsJoinedByString:@","]];

    [TSDKDataRequest requestObjectsForPath:[NSURL URLWithString:path] withCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
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
        objectDataTypes = @[@"event", @"member"];
    }
    NSURL *bulkTeamURL = [TSDKDataRequest appendPathToBaseURL:[NSString stringWithFormat:@"bulk_load?team_id=%ld&types=%@", (long)team.objectIdentifier, [objectDataTypes componentsJoinedByString:@","]]];
    
    [TSDKDataRequest requestObjectsForPath:bulkTeamURL withCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
        NSArray *parsedObjects;
        if (success) {
            [[TSDKProfileTimer sharedInstance] startTimeWithId:@"BULK Parse"];
            parsedObjects = [self SDKObjectsFromCollection:objects];
            for (TSDKCollectionObject *sdkObject in parsedObjects) {
                if ([sdkObject isKindOfClass:[TSDKEvent class]]) {
                    [team addEvent:(TSDKEvent *)sdkObject];
                } else if ([sdkObject isKindOfClass:[TSDKMember class]]) {
                    [team addMember:(TSDKMember *)sdkObject];
                }
            }
            team.membersUpdated = [NSDate date];
            team.eventsUpdated = [NSDate date];
            [[TSDKProfileTimer sharedInstance] getElapsedTimeForId:@"BULK Parse" logResult:YES];
        }
        NSLog(@"Done %ld",parsedObjects.count);
    }];
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

+ (void)listAvailabilitesForEvent:(TSDKEvent *)event completion:(TSDKArrayCompletionBlock)completion {
    if (event) {
        NSMutableString *availabilityURLString = [NSMutableString stringWithString:[event.linkAvailabilities absoluteString]];
        
        [TSDKDataRequest requestObjectsForPath:[NSURL URLWithString:availabilityURLString] withCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
            //            NSArray *availabilites;
            if ([[objects collection] isKindOfClass:[NSArray class]]) {
                TSDKCollectionJSON *collection = [(NSArray *)[objects collection] objectAtIndex:0];
            }
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
    if (!unknownTypes) {
        unknownTypes = [[NSMutableDictionary alloc] init];
    }
    
    NSUInteger classIndex = [self.supportedSDKObjects indexOfObjectPassingTest:^BOOL(Class objClass, NSUInteger idx, BOOL *stop) {
        return [[objClass SDKType] isEqualToString:collectionJSON.type];
    }];
    
    if (classIndex!=NSNotFound) {
        result = [(TSDKCollectionObject *)[[self.supportedSDKObjects objectAtIndex:classIndex] alloc] initWithCollection:collectionJSON];
    } else {
        result = [[TSDKCollectionObject alloc] initWithCollection:collectionJSON];
        
        if (![unknownTypes objectForKey:collectionJSON.type]) {
            NSLog(@"Unknown type: %@\n%@", collectionJSON.type, [collectionJSON getObjectiveCHeaderSkeleton]);
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
@end
