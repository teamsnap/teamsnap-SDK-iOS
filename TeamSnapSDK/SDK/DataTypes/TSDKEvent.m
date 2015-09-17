//
// Created by Jason Rahaim on 1/30/15.
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKEvent.h"


@implementation TSDKEvent {

}

 @dynamic uniform, teamId, iconColor, createdAt, opponentId, isGame, label, gameType, shootoutPointsForTeam, shootoutPointsForOpponent, tracksAvailability, isCanceled, isTbd, endDate, resultsUrl, name, repeatingType, isShootout, pointsForTeam, locationId, minutesToArriveEarly, formattedResults, repeatingTypeCode, startDate, doesntCountTowardsRecord, pointsForOpponent, gameTypeCode, updatedAt, arrivalDate, isOvertime, repeatingUuid, results, notes, durationInMinutes, linkAssignments, linkAvailabilities, linkTeam, linkLocation;

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

- (void)availabilitiesWithCompletion:(TSDKArrayCompletionBlock)completion {
    [TSDKObjectsRequest listAvailabilitesForEvent:self completion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
        NSLog(@"here");
    }];
    
}

@end