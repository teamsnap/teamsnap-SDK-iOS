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

@dynamic opponentName, locationName, uniform, teamId, iconColor, createdAt, opponentId, isGame, label, gameType, shootoutPointsForTeam, shootoutPointsForOpponent, timeZoneDescription, tracksAvailability, isCanceled, sourceTimeZoneIanaName, divisionLocationId, additionalLocationDetails, endDate, isTbd, resultsUrl, isLeagueControlled, name, isShootout, pointsForTeam, locationId, minutesToArriveEarly, formattedResults, startDate, doesntCountTowardsRecord, timeZone, pointsForOpponent, gameTypeCode, timeZoneOffset, arrivalDate, updatedAt, isOvertime, repeatingUuid, results, notes, timeZoneIanaName, durationInMinutes, linkAvailabilities, linkLocation, linkEventStatistics, linkDivisionLocation, linkAssignments, linkMemberAssignments, linkOpponent, linkTeam, linkStatisticData, linkCalendarSingleEvent;

+ (NSString *)SDKType {
    return @"event";
}

+(void)actionUpdateFinalScoreForEvent:(TSDKEvent *)event completion:(TSDKCompletionBlock)completion {
    if (event) {
        TSDKCollectionCommand *command = [self commandForKey:@"update_final_score"];
        
        TSDKCollectionCommand *commandToSend = [command copy];
        
        for (NSString *key in command.data) {
            if ([event.collection.data objectForKey:key]) {
                [commandToSend.data setObject:[event.collection.data objectForKey:key] forKey:key];
            } else {
                [commandToSend.data setObject:[NSNull null] forKey:key];
            }
        }
        
        [commandToSend executeWithCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
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
        if (success) {
            NSArray *events = [TSDKObjectsRequest SDKObjectsFromCollection:objects];
            if (events.count>0) {
                [self setCollection:[events.firstObject collection]];
            }
        }
        if (completion) {
            completion(success, error);
        }
    }];
}

- (void)setNotifyTeamAsMember:(TSDKMember *)member {
    if (member) {
        [self setBool:YES forKey:@"notify_team"];
        [self setString:member.objectIdentifier forKey:@"notify_team_as_member_id"];
    } else {
        [self.collection.data removeObjectForKey:@"notify_team_as_member_id"];
        [self setBool:NO forKey:@"notify_team"];
    }
}

- (void)saveWithCompletion:(TSDKSaveCompletionBlock)completion {
    // if they call save, don't notify team;
    [self saveAndNotifyTeamAsRosterMember:nil completion:completion];
}

- (void)saveAndNotifyTeamAsRosterMember:(TSDKMember *)member completion:(TSDKSaveCompletionBlock)completion {
    [self setNotifyTeamAsMember:member];
    
    // Until we have better support for Repeating events make sure repeating_include is set to "none"
    if (self.repeatingUuid && ([self getString:@"repeating_include"] == nil)) {
        [self.changedValues setObject:self.repeatingUuid forKey:@"repeating_uuid"];
        [self setString:@"none" forKey:@"repeating_include"];
    }
    [super saveWithCompletion:completion];
}

- (void)deleteWithCompletion:(TSDKSimpleCompletionBlock)completion {
    [self deleteAndShouldNotifyTeamAsRosterMember:nil completion:completion];
}

- (void)deleteAndShouldNotifyTeamAsRosterMember:(TSDKMember *)member completion:(TSDKSimpleCompletionBlock)completion {
    [self setNotifyTeamAsMember:member];
    if (self.repeatingUuid && ([self getString:@"repeating_include"] == nil)) {
        [self.changedValues setObject:self.repeatingUuid forKey:@"repeating_uuid"];
        [self setString:@"none" forKey:@"repeating_include"];
    }
    [super deleteWithCompletion:completion];
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

- (NSString *)displayNameWithOpponent:(TSDKOpponent *)opponent preferShortLabel:(BOOL)preferShortLabel {
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
        if(preferShortLabel && self.label.length) {
            return self.label;
        }
        
        if (!self.name || (self.name.length == 0)) {
            return NSLocalizedString(@"Event", nil);
        } else {
            return self.name;
        }
    }
}

- (TSDKRepeatingEventTypeCode)repeatingTypeCode {
    if ([[self.collection data] objectForKey:@"repeating_event_type_code"]) {
        return [self getInteger:@"repeating_event_type_code"];
    } else {
        return TSDKEventDoesNotRepeat;
    }
}

- (void)setRepeatingTypeCode:(TSDKRepeatingEventTypeCode)repeatingTypeCode {
    [self setInteger:repeatingTypeCode forKey:@"repeating_event_type_code"];
}

@end
