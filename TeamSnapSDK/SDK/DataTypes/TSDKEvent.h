//
// Created by Jason Rahaim on 1/30/15.
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKEvent : TSDKCollectionObject

@property (nonatomic, weak) NSString *uniform; //Example: **NULL**
@property (nonatomic) NSInteger teamId; //Example: 153832
@property (nonatomic, weak) NSString *iconColor; //Example: blue
@property (nonatomic, weak) NSDate *createdAt; //Example: 2015-03-04T23:31:59Z
@property (nonatomic, weak) NSString *opponentId; //Example: **NULL**
@property (nonatomic) BOOL isGame; //Example: 0
@property (nonatomic, weak) NSString *label; //Example: Scrimmage
@property (nonatomic, weak) NSString *gameType; //Example: Not Specified
@property (nonatomic) NSInteger shootoutPointsForTeam; //Example: **NULL**
@property (nonatomic,) NSInteger shootoutPointsForOpponent; //Example: **NULL**
@property (nonatomic) NSInteger tracksAvailability; //Example: 1
@property (nonatomic) BOOL isCanceled; //Example: 0
@property (nonatomic) BOOL isTbd; //Example: 0
@property (nonatomic, weak) NSDate *endDate; //Example: 2015-03-07T21:00:00Z
@property (nonatomic, weak) NSString *resultsUrl; //Example: **NULL**
@property (nonatomic, weak) NSString *name; //Example: Scrimmage
@property (nonatomic, weak) NSString *repeatingType; //Example: **NULL**
@property (nonatomic) BOOL isShootout; //Example: 0
@property (nonatomic) NSInteger pointsForTeam; //Example: **NULL**
@property (nonatomic) NSInteger locationId; //Example: 1240117
@property (nonatomic) NSInteger minutesToArriveEarly; //Example: 20
@property (nonatomic, weak) NSString *formattedResults; //Example: **NULL**
@property (nonatomic, weak) NSString *repeatingTypeCode; //Example: **NULL**
@property (nonatomic, weak) NSDate *startDate; //Example: 2015-03-07T19:00:00Z
@property (nonatomic) BOOL doesntCountTowardsRecord; //Example: 0
@property (nonatomic) NSInteger pointsForOpponent; //Example: **NULL**
@property (nonatomic, weak) NSString *gameTypeCode; //Example: **NULL**
@property (nonatomic, weak) NSDate *updatedAt; //Example: 2015-03-08T17:50:31Z
@property (nonatomic, weak) NSDate *arrivalDate; //Example: 2015-03-07T18:40:00Z
@property (nonatomic) BOOL isOvertime; //Example: 0
@property (nonatomic, weak) NSString *repeatingUuid; //Example: **NULL**
@property (nonatomic, weak) NSString *results; //Example: **NULL**
@property (nonatomic, weak) NSString *notes; //Example: Scrimmaging a local select team. Ap 2
@property (nonatomic) NSInteger durationInMinutes; //Example: 120
@property (nonatomic, weak) NSURL *linkAssignments;
@property (nonatomic, weak) NSURL *linkAvailabilities;
@property (nonatomic, weak) NSURL *linkTeam;
@property (nonatomic, weak) NSURL *linkLocation;

@property (nonatomic, strong) NSMutableDictionary *availabilitiesByRoster;

- (void)availabilitiesWithCompletion:(TSDKArrayCompletionBlock)completion;

@end