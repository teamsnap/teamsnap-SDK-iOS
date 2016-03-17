//
// Created by Jason Rahaim on 1/30/15.
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKEvent.h"
#import "NSDate+TSDKConveniences.h"
#import "TSDKAvailabilityGroups.h"
#import "TSDKMember.h"
#import "TSDKOpponent.h"


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

- (void)saveAndNotifyTeamAsRosterMember:(TSDKMember *)member completion:(TSDKSaveCompletionBlock)completion {
    if (member) {
        [self setBool:YES forKey:@"notify_team"];
        [self setInteger:member.objectIdentifier forKey:@"notify_team_as_member_id"];
    } else {
        [self setBool:NO forKey:@"notify_team"];
    }
    [self saveWithCompletion:completion];
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

- (NSComparisonResult)compareStartDate:(TSDKEvent *)compareEvent {
    if (self.isTbd && compareEvent.isTbd) {
        return [self.startDate compare:compareEvent.startDate];
    } else if (self.isTbd && (compareEvent.isTbd == NO)) {
        if ([self.startDate isSameDayAs:compareEvent.startDate]) {
            return NSOrderedAscending;
        } else {
            return [self.startDate compare:compareEvent.startDate];
        }
    } else if ((self.isTbd == NO)  && compareEvent.isTbd) {
        if ([self.startDate isSameDayAs:compareEvent.startDate]) {
            return NSOrderedDescending;
        } else {
            return [self.startDate compare:compareEvent.startDate];
        }
    } else {
        return [self.startDate compare:compareEvent.startDate];
    }
}

- (NSString *)displayNameWithOpponent:(TSDKOpponent *)opponent {
    if (self.isGame && opponent) {
        if ([[self.gameType uppercaseString] isEqualToString:@"AWAY"]) {
            if ((self.label) && (![self.label isEqualToString:@""])) {
                return [NSString stringWithFormat:NSLocalizedString(@"EVENT-%1$@ at %2$@", @"Indicating there is an Event Named #1 at opponent #2"), self.label, opponent.name];
            } else {
                return [NSString stringWithFormat:NSLocalizedString(@"EVENT-at %@", @"Indicating there is an Event at OPPONENT"), opponent.name];
            }
        } else {
            if (self.label && (![self.label isEqualToString:@""])) {
                return [NSString stringWithFormat:NSLocalizedString(@"EVENT-%1$@ vs. %2$@", @"Indicating there is an Event Named #1 against opponent #2"), self.label, opponent.name];
            } else {
                return [NSString stringWithFormat:NSLocalizedString(@"EVENT-vs. %@", @"Indicating there is an Event against OPPONENT"), opponent.name];
            }
        }
    } else {
        if (!self.name || (self.name.length == 0)) {
            return NSLocalizedString(@"Event", nil);
        } else {
            return self.name;
        }
    }
}


@end