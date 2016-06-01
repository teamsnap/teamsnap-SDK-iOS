//
//  TSDKMemberPreferences.h
//  TeamSnapSDK
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

typedef NS_ENUM(NSUInteger, TSDKMemberPreferencesScheduleReminder) {
    TSDKMemberPreferencesScheduleReminderUnknown,
    TSDKMemberPreferencesScheduleReminderOff,
    TSDKMemberPreferencesScheduleReminderGamesAndEvents,
    TSDKMemberPreferencesScheduleReminderGamesOnly,
    TSDKMemberPreferencesScheduleReminderEventsOnly
};

typedef NS_ENUM(NSUInteger, TSDKMemberPreferencesManagerAvailabilityReminder) {
    TSDKMemberPreferencesManagerAvailabilityReminderOff,
    TSDKMemberPreferencesManagerAvailabilityReminderGamesAndEvents,
    TSDKMemberPreferencesManagerAvailabilityReminderGamesOnly,
    TSDKMemberPreferencesManagerAvailabilityReminderEventsOnly
};

@interface TSDKMemberPreferences : TSDKCollectionObject

@property (nonatomic, assign) TSDKMemberPreferencesScheduleReminder scheduleReminderPreference;
@property (nonatomic, assign) TSDKMemberPreferencesManagerAvailabilityReminder managerAvailabilityReminderPreference;

@property (nonatomic, assign) NSInteger remindersSendDaysBeforeEvent; //Example: 2
@property (nonatomic, assign) NSInteger publicSiteShowThumbnail; //Example: 0
@property (nonatomic, assign) NSInteger memberId; //Example: 993324
@property (nonatomic, assign) NSInteger facebookPostScores; //Example: 1
@property (nonatomic, assign) BOOL remindersSendGame; //Example: 1
@property (nonatomic, weak) NSString *scheduleShowFor; //Example: Games and Events
@property (nonatomic, assign) NSInteger publicSiteShowLastName; //Example: 0
@property (nonatomic, assign) BOOL remindersSendEvent; //Example: 1
@property (nonatomic, assign) BOOL remindersSendManagerGame; //Example: 0
@property (nonatomic, assign) NSInteger scheduleShowForCode; //Example: 1
@property (nonatomic, weak) NSString *facebookPostScoresToPageName; //Example: **NULL**
@property (nonatomic, assign) NSInteger mobileSendPushMessages; //Example: 1
@property (nonatomic, weak) NSDate *updatedAt; //Example: 2016-02-19T19:56:27Z
@property (nonatomic, assign) NSInteger remindersSendManagerDaysBeforeEvent; //Example: 2
@property (nonatomic, weak) NSString *facebookPostScoresToPageId; //Example: **NULL**
@property (nonatomic, assign) NSInteger assignmentsHidePast; //Example: 0
@property (nonatomic, assign) NSInteger scheduleHidePast; //Example: 0
@property (nonatomic, assign) NSInteger facebookPoliteScores; //Example: 0
@property (nonatomic, assign) NSInteger remindersSendDaysBeforeGame; //Example: 2
@property (nonatomic, assign) NSInteger availabilityShowPast; //Example: 1
@property (nonatomic, assign) NSInteger remindersSendManagerDaysBeforeGame; //Example: 2
@property (nonatomic, assign) NSInteger facebookOnlyPostWins; //Example: 0
@property (nonatomic, assign) NSInteger facebookPostScoresToWall; //Example: 1
@property (nonatomic, weak) NSString *facebookPageAccessToken; //Example: **NULL**
@property (nonatomic, weak) NSDate *createdAt; //Example: 2012-03-25T23:46:02Z
@property (nonatomic, assign) BOOL remindersSendManagerEvent; //Example: 0
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, weak) NSURL *linkMember;
@property (nonatomic, weak) NSURL *linkTeam;

@end

@interface TSDKMemberPreferences (ForwardedMethods)

-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberArrayCompletionBlock)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion;


@end

