//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKEvent : TSDKCollectionObject

@property (nonatomic, weak) NSString *uniform; //Example:
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, weak) NSString *iconColor; //Example: yellow
@property (nonatomic, weak) NSDate *createdAt; //Example: 2012-04-18T02:05:58Z
@property (nonatomic, assign) NSInteger opponentId; //Example: 2208702
@property (nonatomic, assign) BOOL isGame; //Example: 1
@property (nonatomic, weak) NSString *label; //Example:
@property (nonatomic, weak) NSString *gameType; //Example: Home
@property (nonatomic, assign) NSInteger shootoutPointsForTeam; //Example: **NULL**
@property (nonatomic, assign) NSInteger shootoutPointsForOpponent; //Example: **NULL**
@property (nonatomic, weak) NSString *timeZoneDescription; //Example: Eastern Time (US & Canada)
@property (nonatomic, assign) BOOL tracksAvailability; //Example: 1
@property (nonatomic, assign) BOOL isCanceled; //Example: 0
@property (nonatomic, weak) NSString *sourceTimeZoneIanaName; //Example: America/New_York
@property (nonatomic, assign) NSInteger divisionLocationId; //Example: **NULL**
@property (nonatomic, weak) NSString *additionalLocationDetails; //Example: **NULL**
@property (nonatomic, weak) NSDate *endDate; //Example: 2012-05-19T06:00:00Z
@property (nonatomic, assign) BOOL isTbd; //Example: 0
@property (nonatomic, weak) NSString *resultsUrl; //Example: **NULL**
@property (nonatomic, assign) BOOL isLeagueControlled; //Example: 0
@property (nonatomic, weak) NSString *name; //Example:
@property (nonatomic, weak) NSString *repeatingType; //Example: **NULL**
@property (nonatomic, assign) BOOL isShootout; //Example: 0
@property (nonatomic, assign) NSInteger pointsForTeam; //Example: **NULL**
@property (nonatomic, assign) NSInteger locationId; //Example: 714660
@property (nonatomic, assign) NSInteger minutesToArriveEarly; //Example: 0
@property (nonatomic, weak) NSString *formattedResults; //Example: **NULL**
@property (nonatomic, weak) NSString *repeatingTypeCode; //Example: **NULL**
@property (nonatomic, weak) NSDate *startDate; //Example: 2012-05-19T04:00:00Z
@property (nonatomic, assign) BOOL doesntCountTowardsRecord; //Example: 1
@property (nonatomic, weak) NSString *timeZone; //Example: Eastern Time (US & Canada)
@property (nonatomic, assign) NSInteger pointsForOpponent; //Example: **NULL**
@property (nonatomic, assign) NSInteger gameTypeCode; //Example: 1
@property (nonatomic, weak) NSString *timeZoneOffset; //Example: -05:00
@property (nonatomic, weak) NSDate *arrivalDate; //Example: 2012-05-19T04:00:00Z
@property (nonatomic, weak) NSDate *updatedAt; //Example: 2016-02-23T14:28:23Z
@property (nonatomic, assign) BOOL isOvertime; //Example: 0
@property (nonatomic, weak) NSString *repeatingUuid; //Example: **NULL**
@property (nonatomic, weak) NSString *results; //Example: **NULL**
@property (nonatomic, weak) NSString *notes; //Example:
@property (nonatomic, weak) NSString *timeZoneIanaName; //Example: America/New_York
@property (nonatomic, assign) NSInteger durationInMinutes; //Example: 120
@property (nonatomic, weak) NSURL *linkAvailabilities;
@property (nonatomic, weak) NSURL *linkLocation;
@property (nonatomic, weak) NSURL *linkEventStatistics;
@property (nonatomic, weak) NSURL *linkDivisionLocation;
@property (nonatomic, weak) NSURL *linkAssignments;
@property (nonatomic, weak) NSURL *linkMemberAssignments;
@property (nonatomic, weak) NSURL *linkOpponent;
@property (nonatomic, weak) NSURL *linkTeam;
@property (nonatomic, weak) NSURL *linkStatisticData;
@property (nonatomic, weak) NSURL *linkCalendarSingleEvent;

+(void)actionUpdateFinalScoreForEvent:(TSDKEvent *)event completion:(TSDKCompletionBlock)completion; //(null)
//+(void)actionBulkCreateWithCompletion:(TSDKCompletionBlock)completion; //(null)
//+(void)actionSendAvailabilityRemindersWithCompletion:(TSDKCompletionBlock)completion; //(null)

@property (nonatomic, strong) NSMutableDictionary *availabilitiesByRoster;

- (void)saveAndNotifyTeamAsRosterMember:(TSDKMember *)member completion:(TSDKSaveCompletionBlock)completion;
- (void)updateFinalScoreWithCompletion:(TSDKSimpleCompletionBlock)completion;
- (NSComparisonResult)compareStartDate:(TSDKEvent *)compareEvent;
- (NSString *)displayNameWithOpponent:(TSDKOpponent *)opponent preferShortLabel:(BOOL)preferShortLabel;
- (void)deleteAndShouldNotifyTeamAsRosterMember:(TSDKMember *)member completion:(TSDKSimpleCompletionBlock)completion;

@end

@interface TSDKEvent (ForwardedMethods)

-(void)getAvailabilitiesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKAvailabilityGroupCompletionBlock)completion;
-(void)getLocationWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKLocationArrayCompletionBlock)completion;
-(void)getEventStatisticsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getDivisionLocationWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getAssignmentsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKAssignmentArrayCompletionBlock)completion;
-(void)getMemberAssignmentsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberAssignmentArrayCompletionBlock)completion;
-(void)getOpponentWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKOpponentArrayCompletionBlock)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion;
-(void)getStatisticDataWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKStatisticDatumArrayCompletionBlock)completion;
-(void)getCalendarSingleEventWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;


@end