//
//  TSDKMemberPreferences.h
//  TeamSnapSDK
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKMemberPreferences : TSDKCollectionObject

@property (nonatomic, weak) NSString *_Nullable gameReminderPreference; //Example: none
@property (nonatomic, weak) NSString *_Nullable eventReminderPreference; //Example: member

@property (nonatomic, assign) BOOL remindersSendManagerGame; //Example: 1
@property (nonatomic, assign) BOOL remindersSendManagerEvent; //Example: 0

@property (nonatomic, assign) NSInteger remindersSendManagerDaysBeforeEvent; //Example: 2
@property (nonatomic, assign) NSInteger remindersSendManagerDaysBeforeGame; //Example: 2
@property (nonatomic, assign) NSInteger remindersSendDaysBeforeEvent; //Example: 2
@property (nonatomic, assign) NSInteger remindersSendDaysBeforeGame; //Example: 2

@property (nonatomic, assign) BOOL publicSiteShowThumbnail; //Example: 0
@property (nonatomic, assign) NSInteger memberId; //Example: 10689385
@property (nonatomic, assign) BOOL facebookPostScores; //Example: 0
@property (nonatomic, weak) NSString *_Nullable scheduleShowFor; //Example: Games and Events
@property (nonatomic, assign) BOOL publicSiteShowLastName; //Example: 0
@property (nonatomic, assign) NSInteger scheduleShowForCode; //Example: 1
@property (nonatomic, weak) NSString *_Nullable facebookPostScoresToPageName; //Example: **NULL**
@property (nonatomic, assign) BOOL mobileSendPushMessages; //Example: 1
@property (nonatomic, weak) NSDate *_Nullable updatedAt; //Example: 2016-08-09T15:45:41Z
@property (nonatomic, assign) BOOL assignmentsHidePast; //Example: 0
@property (nonatomic, weak) NSString *_Nullable facebookPostScoresToPageId; //Example: **NULL**
@property (nonatomic, assign) BOOL scheduleHidePast; //Example: 0
@property (nonatomic, assign) BOOL facebookPoliteScores; //Example: 0
@property (nonatomic, assign) BOOL availabilityShowPast; //Example: 0
@property (nonatomic, assign) BOOL facebookOnlyPostWins; //Example: 0
@property (nonatomic, assign) BOOL facebookPostScoresToWall; //Example: 0
@property (nonatomic, weak) NSString *_Nullable facebookPageAccessToken; //Example: **NULL**
@property (nonatomic, weak) NSDate *_Nullable createdAt; //Example: 2015-01-15T16:54:21Z



@property (nonatomic, assign) NSInteger teamId; //Example: 859069
@property (nonatomic, weak) NSURL *_Nullable linkMember;
@property (nonatomic, weak) NSURL *_Nullable linkTeam;
@end

@interface TSDKMemberPreferences (ForwardedMethods)

-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberArrayCompletionBlock _Nullable)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;


@end

