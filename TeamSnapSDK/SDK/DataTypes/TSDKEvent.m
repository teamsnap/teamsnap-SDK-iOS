//
// Created by Jason Rahaim on 1/30/15.
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKEvent.h"
#import "TSDKAvailabilityGroups.h"
#import "TSDKMember.h"


@implementation TSDKEvent {

}

@dynamic uniform, teamId, iconColor, createdAt, opponentId, isGame, label, gameType, shootoutPointsForTeam, shootoutPointsForOpponent, timeZoneDescription, tracksAvailability, isCanceled, sourceTimeZoneIanaName, divisionLocationId, additionalLocationDetails, endDate, isTbd, resultsUrl, isLeagueControlled, name, repeatingType, isShootout, pointsForTeam, locationId, minutesToArriveEarly, formattedResults, repeatingTypeCode, startDate, doesntCountTowardsRecord, timeZone, pointsForOpponent, gameTypeCode, timeZoneOffset, arrivalDate, updatedAt, isOvertime, repeatingUuid, results, notes, timeZoneIanaName, durationInMinutes, linkAvailabilities, linkLocation, linkEventStatistics, linkDivisionLocation, linkAssignments, linkOpponent, linkTeam, linkStatisticData, linkCalendarSingleEvent;

+ (NSString *)SDKType {
    return @"event";
}

- (id)init {
    self = [super init];
    if (self) {
        _availabilitiesByRoster = [[NSMutableDictionary alloc] init];
    }
    return self;
}


+(void)actionUpdateFinalScoreForEvent:(TSDKEvent *)event completion:(TSDKCompletionBlock)completion {
    if (event) {
        TSDKCollectionCommand *command = [self commandForKey:@"update_final_score"];
        
        for (NSString *key in command.data) {
            if ([event.collection.data objectForKey:key]) {
                [command.data setObject:[event.collection.data objectForKey:key] forKey:key];
            } else {
                [command.data setObject:[NSNull null] forKey:key];
            }
        }
        
        [command executeWithCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
            if (completion) {
                completion(success, complete, objects, error);
            }
        }];
    } else {
        completion(NO, NO, nil, nil);
    }

}

- (void)updateFinalScoreWithCompletion:(TSDKSimpleCompletionBlock)completion {
    [TSDKEvent actionUpdateFinalScoreForEvent:self completion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
        if (completion) {
            completion(success, error);
        }
    }];
}

- (void)saveAndNotifyTeamAsRosterMember:(TSDKMember *)member completion:(TSDKCompletionBlock)completionBlock {
    if (member) {
        [self setBool:YES forKey:@"notify_team"];
        [self setInteger:member.objectIdentifier forKey:@"notify_team_as_member_id"];
    } else {
        [self setBool:NO forKey:@"notify_team"];
    }
    [self saveWithCompletion:completionBlock];
}

-(void)getAvailabilitiesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKAvailabilityGroupCompletionBlock)completion {
    [self arrayFromLink:self.linkAvailabilities withConfiguration:configuration completion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
        TSDKAvailabilityGroups *availability = nil;
        if (success) {
            availability = [[TSDKAvailabilityGroups alloc] initWithAvailabilityArray:objects];
        }
        if (completion) {
            completion(success, complete, availability, error);
        }
    }];
}

@end