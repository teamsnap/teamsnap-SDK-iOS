//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

typedef NS_CLOSED_ENUM(NSInteger, TSDKRepeatingEventTypeCode) {
    TSDKEventDoesNotRepeat = 0,
    TSDKEventRepeatsDaily = 1,
    TSDKEventRepeatsWeekly = 2
};

typedef NS_CLOSED_ENUM(NSInteger, TSDKRepeatingEventIncludeEvents){
    TSDKExcludeOtherEvents = 0,
    TSDKIncludeAllEvents = 1,
    TSDKIncludeAllFutureEvents = 2
};

typedef NS_CLOSED_ENUM(NSInteger, TSDKGameTypeCode){
    TSDKGameTypeCodeUnknown = 0,
    TSDKGameTypeCodeIsHome = 1,
    TSDKGameTypeCodeIsAway = 2,
};

typedef NS_CLOSED_ENUM(NSUInteger, TSDKEventEditMode) {
    TSDKEventEditModeSingle,
    TSDKEventEditModeRepeatingFuture,
    TSDKEventEditModeRepeatingAll,
};


@interface TSDKEvent : TSDKCollectionObject

@property (nonatomic, strong, readonly) NSString *_Nullable locationName; //Example:
@property (nonatomic, strong, readonly) NSString *_Nullable opponentName; //Example:
@property (nonatomic, strong) NSString *_Nullable uniform; //Example:
@property (nonatomic, strong) NSString *_Nullable teamId; //Example: 71118
@property (nonatomic, strong) NSString *_Nullable iconColor; //Example: yellow
@property (nonatomic, strong) NSDate *_Nullable createdAt; //Example: 2012-04-18T02:05:58Z
@property (nonatomic, strong) NSString *_Nullable opponentId; //Example: 2208702
@property (nonatomic, assign) BOOL isGame; //Example: 1
@property (nonatomic, strong) NSString *_Nullable label; //Example:
@property (nonatomic, strong) NSString *_Nullable gameType; //Example: Home
@property (nonatomic, assign) NSInteger shootoutPointsForTeam; //Example: **NULL**
@property (nonatomic, assign) NSInteger shootoutPointsForOpponent; //Example: **NULL**
@property (nonatomic, strong) NSString *_Nullable timeZoneDescription; //Example: Eastern Time (US & Canada)
@property (nonatomic, assign) BOOL tracksAvailability; //Example: 1
@property (nonatomic, assign) BOOL isCanceled; //Example: 0
@property (nonatomic, strong) NSString *_Nullable sourceTimeZoneIanaName; //Example: America/New_York
@property (nonatomic, strong) NSString *_Nullable divisionLocationId; //Example: **NULL**
@property (nonatomic, strong) NSString *_Nullable additionalLocationDetails; //Example: **NULL**
@property (nonatomic, strong) NSDate *_Nullable endDate; //Example: 2012-05-19T06:00:00Z
@property (nonatomic, assign) BOOL isTbd; //Example: 0
@property (nonatomic, strong) NSString *_Nullable resultsUrl; //Example: **NULL**
@property (nonatomic, assign) BOOL isLeagueControlled; //Example: 0
@property (nonatomic, strong) NSString *_Nullable name; //Example:
@property (nonatomic, assign) BOOL isShootout; //Example: 0
@property (nonatomic, assign) NSInteger pointsForTeam; //Example: **NULL**
@property (nonatomic, strong) NSString *_Nullable locationId; //Example: 714660
@property (nonatomic, assign) NSInteger minutesToArriveEarly; //Example: 0
@property (nonatomic, strong) NSString *_Nullable formattedResults; //Example: **NULL**
@property (nonatomic, strong) NSDate *_Nullable startDate; //Example: 2012-05-19T04:00:00Z
@property (nonatomic, assign) BOOL doesntCountTowardsRecord; //Example: 1
@property (nonatomic, strong) NSString *_Nullable timeZone; //Example: Eastern Time (US & Canada)
@property (nonatomic, assign) NSInteger pointsForOpponent; //Example: **NULL**
@property (nonatomic, assign) TSDKGameTypeCode gameTypeCode; //Example: 1
@property (nonatomic, strong) NSString *_Nullable timeZoneOffset; //Example: -05:00
@property (nonatomic, strong) NSDate *_Nullable arrivalDate; //Example: 2012-05-19T04:00:00Z
@property (nonatomic, strong) NSDate *_Nullable updatedAt; //Example: 2016-02-23T14:28:23Z
@property (nonatomic, assign) BOOL isOvertime; //Example: 0
@property (nonatomic, strong) NSString *_Nullable repeatingUuid; //Example: **NULL**
@property (nonatomic, strong) NSString *_Nullable results; //Example: **NULL**
@property (nonatomic, strong) NSString *_Nullable notes; //Example:
@property (nonatomic, strong) NSString *_Nullable timeZoneIanaName; //Example: America/New_York
@property (nonatomic, assign) NSInteger durationInMinutes; //Example: 120
@property (nonatomic, strong) NSURL *_Nullable linkAvailabilities;
@property (nonatomic, strong, nullable) NSURL * linkSuggestedAssignments;
@property (nonatomic, strong) NSURL *_Nullable linkLocation;
@property (nonatomic, strong) NSURL *_Nullable linkEventStatistics;
@property (nonatomic, strong) NSURL *_Nullable linkDivisionLocation;
@property (nonatomic, strong) NSURL *_Nullable linkAssignments;
@property (nonatomic, strong) NSURL *_Nullable linkMemberAssignments;
@property (nonatomic, strong) NSURL *_Nullable linkOpponent;
@property (nonatomic, strong) NSURL *_Nullable linkTeam;
@property (nonatomic, strong) NSURL *_Nullable linkStatisticData;
@property (nonatomic, strong) NSURL *_Nullable linkCalendarSingleEvent;
@property (nonatomic, strong, nullable) NSURL * linkAssignmentsTeam;

+(void)actionUpdateFinalScoreForEvent:(TSDKEvent *_Nonnull)event completion:(TSDKCompletionBlock _Nullable)completion;
+ (void)getEventWithId:(NSString * _Nonnull)eventId teamId:(NSString * _Nonnull)teamId completion:(TSDKEventCompletionBlock _Nonnull)completion;

@property (nonatomic, assign) TSDKRepeatingEventTypeCode repeatingTypeCode;

+ (void)saveEvent:(TSDKEvent * _Nonnull)event notifyTeamAsMember:(TSDKMember * _Nullable)member completion:(TSDKEventArrayCompletionBlock _Nullable)completion;
- (void)updateFinalScoreWithCompletion:(TSDKSimpleCompletionBlock _Nullable)completion;
- (NSComparisonResult)compareStartDate:(TSDKEvent *_Nonnull)compareEvent;
- (NSString *_Nullable)displayNameWithShortLabelPreference:(BOOL)preferShortLabel;
- (void)deleteAndShouldNotifyTeamAsRosterMember:(TSDKMember *_Nullable)member completion:(TSDKSimpleCompletionBlock _Nullable)completion;
- (TSDKEventEditMode)editMode;
- (void)setEditMode:(TSDKEventEditMode)editMode;

@end

@interface TSDKEvent (ForwardedMethods)

-(void)getAvailabilitiesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKAvailabilityGroupCompletionBlock _Nullable)completion;
-(void)getLocationWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKLocationArrayCompletionBlock _Nullable)completion;
-(void)getSuggestedAssignmentsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKSuggestedAssignmentsArrayCompletionBlock _Nonnull)completion;
-(void)getEventStatisticsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getDivisionLocationWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getAssignmentsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKAssignmentArrayCompletionBlock _Nullable)completion;
-(void)getMemberAssignmentsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberAssignmentArrayCompletionBlock _Nullable)completion;
-(void)getOpponentWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKOpponentArrayCompletionBlock _Nullable)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;
-(void)getStatisticDataWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKStatisticDatumArrayCompletionBlock _Nullable)completion;
-(void)getCalendarSingleEventWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getEventLineupWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKEventLineupCompletionBlock _Nullable)completion;
-(void)getAssignmentsTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;

@end
