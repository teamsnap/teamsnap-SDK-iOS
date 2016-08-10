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

@property (nonatomic, weak) NSString *gameReminderPreference; //Example: none
@property (nonatomic, weak) NSString *eventReminderPreference; //Example: member

@property (nonatomic, assign) BOOL remindersSendManagerGame; //Example: 1
@property (nonatomic, assign) BOOL remindersSendManagerEvent; //Example: 0

@property (nonatomic, assign) NSInteger remindersSendManagerDaysBeforeEvent; //Example: 2
@property (nonatomic, assign) NSInteger remindersSendManagerDaysBeforeGame; //Example: 2
@property (nonatomic, assign) NSInteger remindersSendDaysBeforeEvent; //Example: 2
@property (nonatomic, assign) NSInteger remindersSendDaysBeforeGame; //Example: 2

@property (nonatomic, assign) BOOL publicSiteShowThumbnail; //Example: 0
@property (nonatomic, assign) NSInteger memberId; //Example: 10689385
@property (nonatomic, assign) BOOL facebookPostScores; //Example: 0
@property (nonatomic, weak) NSString *scheduleShowFor; //Example: Games and Events
@property (nonatomic, assign) BOOL publicSiteShowLastName; //Example: 0
@property (nonatomic, assign) NSInteger scheduleShowForCode; //Example: 1
@property (nonatomic, weak) NSString *facebookPostScoresToPageName; //Example: **NULL**
@property (nonatomic, assign) BOOL mobileSendPushMessages; //Example: 1
@property (nonatomic, weak) NSDate *updatedAt; //Example: 2016-08-09T15:45:41Z
@property (nonatomic, assign) BOOL assignmentsHidePast; //Example: 0
@property (nonatomic, weak) NSString *facebookPostScoresToPageId; //Example: **NULL**
@property (nonatomic, assign) BOOL scheduleHidePast; //Example: 0
@property (nonatomic, assign) BOOL facebookPoliteScores; //Example: 0
@property (nonatomic, assign) BOOL availabilityShowPast; //Example: 0
@property (nonatomic, assign) BOOL facebookOnlyPostWins; //Example: 0
@property (nonatomic, assign) BOOL facebookPostScoresToWall; //Example: 0
@property (nonatomic, weak) NSString *facebookPageAccessToken; //Example: **NULL**
@property (nonatomic, weak) NSDate *createdAt; //Example: 2015-01-15T16:54:21Z



@property (nonatomic, assign) NSInteger teamId; //Example: 859069
@property (nonatomic, weak) NSURL *linkMember;
@property (nonatomic, weak) NSURL *linkTeam;
@end

@interface TSDKMemberPreferences (ForwardedMethods)

-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberArrayCompletionBlock)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion;


@end

