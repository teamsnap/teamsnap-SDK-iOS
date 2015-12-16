//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKEvent : TSDKCollectionObject

@property (nonatomic, weak) NSString *uniform; //Example: **NULL**
@property (nonatomic, assign) NSInteger teamId; //Example: 153832
@property (nonatomic, weak) NSString *iconColor; //Example: purple
@property (nonatomic, weak) NSDate *createdAt; //Example: 2015-08-03T12:29:38Z
@property (nonatomic, weak) NSString *opponentId; //Example: **NULL**
@property (nonatomic, assign) BOOL isGame; //Example: 0
@property (nonatomic, weak) NSString *label; //Example: Fielding
@property (nonatomic, weak) NSString *gameType; //Example: Not Specified
@property (nonatomic, weak) NSString *shootoutPointsForTeam; //Example: **NULL**
@property (nonatomic, weak) NSString *shootoutPointsForOpponent; //Example: **NULL**
@property (nonatomic, weak) NSString *timeZoneDescription; //Example: Eastern Time (US & Canada)
@property (nonatomic, assign) NSInteger tracksAvailability; //Example: 1
@property (nonatomic, assign) BOOL isCanceled; //Example: 0
@property (nonatomic, weak) NSString *sourceTimeZoneIanaName; //Example: America/New_York
@property (nonatomic, weak) NSString *divisionLocationId; //Example: **NULL**
@property (nonatomic, weak) NSString *additionalLocationDetails; //Example: **NULL**
@property (nonatomic, weak) NSDate *endDate; //Example: 2015-08-06T00:30:00Z
@property (nonatomic, assign) BOOL isTbd; //Example: 0
@property (nonatomic, weak) NSString *resultsUrl; //Example: **NULL**
@property (nonatomic, assign) BOOL isLeagueControlled; //Example: 0
@property (nonatomic, weak) NSString *name; //Example: Fielding Practice
@property (nonatomic, weak) NSString *repeatingType; //Example: Weekly
@property (nonatomic, assign) BOOL isShootout; //Example: 0
@property (nonatomic, weak) NSString *pointsForTeam; //Example: **NULL**
@property (nonatomic, assign) NSInteger locationId; //Example: 1240117
@property (nonatomic, assign) NSInteger minutesToArriveEarly; //Example: 15
@property (nonatomic, weak) NSString *formattedResults; //Example: **NULL**
@property (nonatomic, assign) NSInteger repeatingTypeCode; //Example: 2
@property (nonatomic, weak) NSDate *startDate; //Example: 2015-08-05T22:30:00Z
@property (nonatomic, assign) NSInteger doesntCountTowardsRecord; //Example: 0
@property (nonatomic, weak) NSString *timeZone; //Example: Eastern Time (US & Canada)
@property (nonatomic, weak) NSString *pointsForOpponent; //Example: **NULL**
@property (nonatomic, assign) NSInteger gameTypeCode; //Example: 0
@property (nonatomic, weak) NSString *timeZoneOffset; //Example: -05:00
@property (nonatomic, weak) NSDate *arrivalDate; //Example: 2015-08-05T22:15:00Z
@property (nonatomic, weak) NSDate *updatedAt; //Example: 2015-09-02T00:20:20Z
@property (nonatomic, assign) BOOL isOvertime; //Example: 0
@property (nonatomic, weak) NSString *repeatingUuid; //Example: e2269c89-0d5a-4cc9-94c8-8e1c8c453abb
@property (nonatomic, weak) NSString *results; //Example: **NULL**
@property (nonatomic, weak) NSString *notes; //Example: Field 3
@property (nonatomic, weak) NSString *timeZoneIanaName; //Example: America/New_York
@property (nonatomic, assign) NSInteger durationInMinutes; //Example: 120
@property (nonatomic, weak) NSURL *linkAssignments;
@property (nonatomic, weak) NSURL *linkAvailabilities;
@property (nonatomic, weak) NSURL *linkTeam;
@property (nonatomic, weak) NSURL *linkDivisionLocation;
@property (nonatomic, weak) NSURL *linkLocation;
@property (nonatomic, weak) NSURL *linkStatisticData;

-(void)getAssignmentsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getAvailabilitiesWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getTeamWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getDivisionLocationWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getLocationWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getStatisticDataWithCompletion:(TSDKArrayCompletionBlock)completion;

@property (nonatomic, strong) NSMutableDictionary *availabilitiesByRoster;

- (void)availabilitiesWithCompletion:(TSDKArrayCompletionBlock)completion;

@end