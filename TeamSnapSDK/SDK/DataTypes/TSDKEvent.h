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

@property (nonatomic, strong, nullable) NSString * uniform; //Example: **NULL**
@property (nonatomic, strong, nullable) NSString * teamId; //Example: 29
@property (nonatomic, strong, nullable) NSString * iconColor; //Example: orange
@property (nonatomic, strong, nullable) NSString * formattedTitle; //Example: vs. Oshowa Otters
@property (nonatomic, strong, nullable) NSString * opponentId; //Example: 35
@property (nonatomic, strong, nullable) NSDate * createdAt; //Example: 2019-12-04T15:55:50Z
@property (nonatomic, assign) BOOL isGame; //Example: 1
@property (nonatomic, strong, nullable) NSString * label; //Example: **NULL**
@property (nonatomic, strong, nullable) NSString * gameType; //Example: Home
@property (nonatomic, strong, nullable) NSString * shootoutPointsForTeam; //Example: **NULL**
@property (nonatomic, strong, nullable) NSString * shootoutPointsForOpponent; //Example: **NULL**
@property (nonatomic, strong, nullable) NSString * timeZoneDescription; //Example: America/Detroit
@property (nonatomic, assign) NSInteger tracksAvailability; //Example: 1
@property (nonatomic, strong, nullable) NSString * locationName; //Example: Windsor
@property (nonatomic, assign) BOOL isCanceled; //Example: 0
@property (nonatomic, strong, nullable) NSString * sourceTimeZoneIanaName; //Example: America/Detroit
@property (nonatomic, strong, nullable) NSString * divisionLocationId; //Example: <null>
@property (nonatomic, strong, nullable) NSString * additionalLocationDetails; //Example:
@property (nonatomic, strong, nullable) NSDate * endDate; //Example: 2019-12-17T17:30:18Z
@property (nonatomic, assign) BOOL isTbd; //Example: 0
@property (nonatomic, strong, nullable) NSString * resultsUrl; //Example: **NULL**
@property (nonatomic, assign) BOOL isLeagueControlled; //Example: 0
@property (nonatomic, strong, nullable) NSString * name; //Example:
@property (nonatomic, strong, nullable) NSString * repeatingType; //Example: **NULL**
@property (nonatomic, assign) BOOL isShootout; //Example: 0
@property (nonatomic, strong, nullable) NSString * opponentName; //Example: Oshowa Otters
@property (nonatomic, strong, nullable) NSString * pointsForTeam; //Example: **NULL**
@property (nonatomic, strong, nullable) NSString * locationId; //Example: 35
@property (nonatomic, assign) NSInteger minutesToArriveEarly; //Example: 0
@property (nonatomic, strong, nullable) NSString * formattedResults; //Example: **NULL**
@property (nonatomic, strong, nullable) NSString * repeatingTypeCode; //Example: **NULL**
@property (nonatomic, strong, nullable) NSDate * startDate; //Example: 2019-12-17T15:30:18Z
@property (nonatomic, assign) NSInteger doesntCountTowardsRecord; //Example: 0
@property (nonatomic, strong, nullable) NSString * timeZone; //Example: America/Detroit
@property (nonatomic, strong, nullable) NSString * pointsForOpponent; //Example: **NULL**
@property (nonatomic, assign) NSInteger gameTypeCode; //Example: 1
@property (nonatomic, strong, nullable) NSString * timeZoneOffset; //Example: -05:00
@property (nonatomic, strong, nullable) NSDate * arrivalDate; //Example: 2019-12-17T15:30:18Z
@property (nonatomic, strong, nullable) NSString * formattedTitleForMultiTeam; //Example: Maple Syrup Marauders vs. Oshowa Otters
@property (nonatomic, strong, nullable) NSDate * updatedAt; //Example: 2019-12-04T15:55:50Z
@property (nonatomic, assign) BOOL isOvertime; //Example: 0
@property (nonatomic, strong, nullable) NSString * repeatingUuid; //Example: **NULL**
@property (nonatomic, strong, nullable) NSString * results; //Example: **NULL**
@property (nonatomic, strong, nullable) NSString * notes; //Example: **NULL**
@property (nonatomic, strong, nullable) NSString * timeZoneIanaName; //Example: America/Detroit
@property (nonatomic, assign) NSInteger durationInMinutes; //Example: 120
@property (nonatomic, strong, nullable) NSURL * linkStatisticData;
@property (nonatomic, strong, nullable) NSURL * linkCalendarSingleEvent;
@property (nonatomic, strong, nullable) NSURL * linkAvailabilities;
@property (nonatomic, strong, nullable) NSURL * linkOpponent;
@property (nonatomic, strong, nullable) NSURL * linkEventStatistics;
@property (nonatomic, strong, nullable) NSURL * linkTeam;
@property (nonatomic, strong, nullable) NSURL * linkSuggestedAssignments;
@property (nonatomic, strong, nullable) NSURL * linkLocation;
@property (nonatomic, strong, nullable) NSURL * linkEventLineups;
@property (nonatomic, strong, nullable) NSURL * linkDivisionLocation;
@property (nonatomic, strong, nullable) NSURL * linkAssignments;
@property (nonatomic, strong, nullable) NSURL * linkAssignmentsTeam;

+(void)actionUpdateFinalScoreForEvent:(TSDKEvent *_Nonnull)event completion:(TSDKCompletionBlock _Nullable)completion;
+ (void)getEventWithId:(NSString * _Nonnull)eventId teamId:(NSString * _Nonnull)teamId completion:(TSDKEventCompletionBlock _Nonnull)completion;

+ (void)saveEvent:(TSDKEvent * _Nonnull)event notifyTeamAsMember:(TSDKMember * _Nullable)member completion:(TSDKEventArrayCompletionBlock _Nullable)completion;
- (void)updateFinalScoreWithCompletion:(TSDKSimpleCompletionBlock _Nullable)completion;
- (NSComparisonResult)compareStartDate:(TSDKEvent *_Nonnull)compareEvent;
- (NSString *_Nullable)displayNameWithShortLabelPreference:(BOOL)preferShortLabel;
- (void)deleteAndShouldNotifyTeamAsRosterMember:(TSDKMember *_Nullable)member completion:(TSDKSimpleCompletionBlock _Nullable)completion;
- (TSDKEventEditMode)editMode;
- (void)setEditMode:(TSDKEventEditMode)editMode;

//Update the final score for an event
//+(void)actionUpdateFinalScoreShootoutpointsforteam:(NSString *_Nonnull)shootoutPointsForTeam pointsForOpponent:(NSString *_Nonnull)pointsForOpponent resultsUrl:(NSString *_Nonnull)resultsUrl isShootout:(NSString *_Nonnull)isShootout id:(NSString *_Nonnull)id pointsForTeam:(NSString *_Nonnull)pointsForTeam shootoutPointsForOpponent:(NSString *_Nonnull)shootoutPointsForOpponent isOvertime:(NSString *_Nonnull)isOvertime results:(NSString *_Nonnull)results WithCompletion:(TSDKCompletionBlock _Nullable)completion;

//event_ids = [event_id, event_id]
//+(void)actionBulkCreateNotifyteamasmemberid:(NSString *_Nonnull)notifyTeamAsMemberId templates:(NSString *_Nonnull)templates notifyTeam:(NSString *_Nonnull)notifyTeam teamId:(NSString *_Nonnull)teamId WithCompletion:(TSDKCompletionBlock _Nullable)completion;

//members_to_notify = [member_id, member_id]
//+(void)actionSendAvailabilityRemindersId:(NSString *_Nonnull)id membersToNotify:(NSString *_Nonnull)membersToNotify notifyTeamAsMemberId:(NSString *_Nonnull)notifyTeamAsMemberId WithCompletion:(TSDKCompletionBlock _Nullable)completion;

//+(void)queryOverviewTeamid:(NSString *_Nonnull)teamId WithCompletion:(TSDKCompletionBlock _Nullable)completion;

//+(void)querySearchId:(NSString *_Nonnull)id pageNumber:(NSString *_Nonnull)pageNumber updatedSince:(NSString *_Nonnull)updatedSince isGame:(NSString *_Nonnull)isGame sortStartDate:(NSString *_Nonnull)sortStartDate locationId:(NSString *_Nonnull)locationId opponentId:(NSString *_Nonnull)opponentId userId:(NSString *_Nonnull)userId repeatingUuid:(NSString *_Nonnull)repeatingUuid startedBefore:(NSString *_Nonnull)startedBefore startedAfter:(NSString *_Nonnull)startedAfter pageSize:(NSString *_Nonnull)pageSize teamId:(NSString *_Nonnull)teamId WithCompletion:(TSDKCompletionBlock _Nullable)completion;

//+(void)querySearchGamesTeamid:(NSString *_Nonnull)teamId pageNumber:(NSString *_Nonnull)pageNumber pageSize:(NSString *_Nonnull)pageSize WithCompletion:(TSDKCompletionBlock _Nullable)completion;

@end

@interface TSDKEvent (ForwardedMethods)

-(void)getAvailabilitiesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKAvailabilityGroupCompletionBlock _Nullable)completion;
-(void)getLocationWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKLocationArrayCompletionBlock _Nullable)completion;
-(void)getSuggestedAssignmentsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKSuggestedAssignmentsArrayCompletionBlock _Nonnull)completion;
-(void)getEventStatisticsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getDivisionLocationWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getOpponentWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKOpponentArrayCompletionBlock _Nullable)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;
-(void)getStatisticDataWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKStatisticDatumArrayCompletionBlock _Nullable)completion;
-(void)getCalendarSingleEventWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getEventLineupWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKEventLineupCompletionBlock _Nullable)completion;
-(void)getAssignmentsTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;

@end
