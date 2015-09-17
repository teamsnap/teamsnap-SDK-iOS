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
@property (nonatomic) BOOL marketplaceShowTab; //Example: 1
@property (nonatomic) BOOL statisticsShowTab; //Example: 1
@property (nonatomic, weak) NSDate *createdAt; //Example: 2013-03-19T22:28:03Z
@property (nonatomic, weak) NSString *availabilityEventCutoff; //Example: **NULL**
@property (nonatomic) NSInteger teamId; //Example: 153832
@property (nonatomic, weak) NSString *teamMessage;
@property (nonatomic) BOOL assignmentsShowTab; //Example: 0
@property (nonatomic) BOOL isPaymentsPrivate; //Example: 1
@property (nonatomic) NSInteger colorSchemeCd; //Example: 0
@property (nonatomic, weak) NSString *availabilitiesSortOrder; //Example: name
@property (nonatomic) NSInteger shareAvailabilityNotes; //Example: 0
@property (nonatomic) NSInteger tslEnabled; //Example: 1
@property (nonatomic, weak) NSString *alternateSportName; //Example:
@property (nonatomic, weak) NSString *assignmentsEnableFor; //Example: Games and Events
@property (nonatomic, weak) NSString *availabilityGameCutoff; //Example: **NULL**
@property (nonatomic) NSInteger paymentsIgnoreNonPlayers; //Example: 1
@property (nonatomic) BOOL filesShowTab; //Example: 1
@property (nonatomic) BOOL availabilitiesShowTab; //Example: 1
@property (nonatomic, weak) NSString *currencySymbol; //Example: $
@property (nonatomic) NSInteger assignmentsEnableForCode; //Example: 0
@property (nonatomic) BOOL isCoed; //Example: 0
@property (nonatomic) NSInteger tslPushEnabled; //Example: 1
@property (nonatomic) NSInteger leagueControlledSettings; //Example: 0
@property (nonatomic) NSInteger remindersSendGame; //Example: 1
@property (nonatomic) NSInteger managerDefaultAvailability; //Example: 0
@property (nonatomic) NSInteger tslScorePushEnabled; //Example: 1
@property (nonatomic, weak) NSString *introductionText; //Example:
@property (nonatomic) NSInteger trackedItemsIgnoreNonPlayers; //Example: 1
@property (nonatomic) NSInteger announcementAboveHomePhoto; //Example: 1
@property (nonatomic) NSInteger globalUseInternationalDate; //Example: 0
@property (nonatomic, weak) NSString *memberSortOrder; //Example: first
@property (nonatomic) NSInteger tracksPoints; //Example: 1
@property (nonatomic, weak) NSString *teamHeadline; //Example: A message from the Team Manager...
@property (nonatomic, weak) NSString *skillLevel; //Example: **NULL**
@property (nonatomic) BOOL isYouth; //Example: 1
@property (nonatomic, weak) NSString *gender; //Example: **NULL**
@property (nonatomic) NSInteger globalUseInternationalTime; //Example: 0
@property (nonatomic) BOOL showDivisionStandings; //Example: 1
@property (nonatomic, weak) NSDate *updatedAt; //Example: 2015-09-11T21:30:22Z
@property (nonatomic) NSInteger hideHeader; //Example: 0
@property (nonatomic, weak) NSString *ageGroup; //Example: **NULL**
@property (nonatomic) BOOL paymentsShowTab; //Example: 1
@property (nonatomic, weak) NSString *globalUniformHome; //Example:
@property (nonatomic) NSInteger trackedItemsIsPrivate; //Example: 0
@property (nonatomic) NSInteger remindersSendEvent; //Example: 1
@property (nonatomic) BOOL trackedItemsShowTab; //Example: 1
@property (nonatomic, weak) NSURL *linkTeam;
@property (nonatomic, weak) NSURL *linkTeamPhoto;

@end
