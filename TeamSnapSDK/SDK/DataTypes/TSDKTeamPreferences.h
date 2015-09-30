//
//  TSDKTeamPreferences.h
//  SDKPlayground
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKTeamPreferences : TSDKCollectionObject

@property (nonatomic, weak) NSString *globalUniformAway; //Example:
@property (nonatomic) BOOL marketplaceShowTab; //Example: 0
@property (nonatomic) BOOL statisticsShowTab; //Example: 0
@property (nonatomic, weak) NSDate *createdAt; //Example: 2012-05-27T03:32:51Z
@property (nonatomic, weak) NSString *availabilityEventCutoff; //Example: **NULL**
@property (nonatomic) NSInteger teamId; //Example: 1
@property (nonatomic, weak) NSString *teamMessage; //Example: <p><span style="font-size:
@property (nonatomic) BOOL assignmentsShowTab; //Example: 1
@property (nonatomic) BOOL isPaymentsPrivate; //Example: 0
@property (nonatomic) NSInteger colorSchemeCd; //Example: 13
@property (nonatomic, weak) NSString *availabilitiesSortOrder; //Example: jersey
@property (nonatomic) NSInteger shareAvailabilityNotes; //Example: 0
@property (nonatomic) NSInteger tslEnabled; //Example: 1
@property (nonatomic, weak) NSString *alternateSportName; //Example: Global Domination
@property (nonatomic, weak) NSString *assignmentsEnableFor; //Example: Games and Events
@property (nonatomic) NSInteger paymentsIgnoreNonPlayers; //Example: 0
@property (nonatomic, weak) NSString *availabilityGameCutoff; //Example: **NULL**
@property (nonatomic) BOOL filesShowTab; //Example: 1
@property (nonatomic) BOOL availabilitiesShowTab; //Example: 1
@property (nonatomic, weak) NSString *currencySymbol; //Example: $
@property (nonatomic) NSInteger assignmentsEnableForCode; //Example: 0
@property (nonatomic) BOOL isCoed; //Example: 1
@property (nonatomic) NSInteger tslPushEnabled; //Example: 1
@property (nonatomic) NSInteger leagueControlledSettings; //Example: 0
@property (nonatomic) NSInteger remindersSendGame; //Example: 0
@property (nonatomic) NSInteger managerDefaultAvailability; //Example: 0
@property (nonatomic) NSInteger tslScorePushEnabled; //Example: 1
@property (nonatomic, weak) NSString *introductionText; //Example: Hi,
@property (nonatomic) NSInteger trackedItemsIgnoreNonPlayers; //Example: 0
@property (nonatomic) NSInteger announcementAboveHomePhoto; //Example: 1
@property (nonatomic) NSInteger globalUseInternationalDate; //Example: 0
@property (nonatomic) BOOL teamMediaShowTab; //Example: 1
@property (nonatomic, weak) NSString *memberSortOrder; //Example: last
@property (nonatomic) NSInteger tracksPoints; //Example: 0
@property (nonatomic, weak) NSString *teamHeadline; //Example: Welcome
@property (nonatomic, weak) NSString *skillLevel; //Example: Competitive
@property (nonatomic) BOOL isYouth; //Example: 0
@property (nonatomic, weak) NSString *gender; //Example: Coed
@property (nonatomic) NSInteger globalUseInternationalTime; //Example: 0
@property (nonatomic) BOOL showDivisionStandings; //Example: 0
@property (nonatomic, weak) NSDate *updatedAt; //Example: 2015-09-30T05:00:03Z
@property (nonatomic) NSInteger hideHeader; //Example: 0
@property (nonatomic, weak) NSString *ageGroup; //Example:
@property (nonatomic) BOOL paymentsShowTab; //Example: 1
@property (nonatomic) BOOL isTrackedItemsPrivate; //Example: 0
@property (nonatomic, weak) NSString *globalUniformHome; //Example:
@property (nonatomic) NSInteger remindersSendEvent; //Example: 0
@property (nonatomic) NSInteger trackedItemsIsPrivate; //Example: 0
@property (nonatomic) BOOL trackedItemsShowTab; //Example: 1
@property (nonatomic, weak) NSURL *linkTeam;
@property (nonatomic, weak) NSURL *linkTeamPhoto;
@property (nonatomic, weak) NSURL *linkTeamLogo;


-(void)getTeamWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getTeamPhotoWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getTeamLogoWithCompletion:(TSDKArrayCompletionBlock)completion;

@end
