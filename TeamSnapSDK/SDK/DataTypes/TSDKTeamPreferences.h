//
//  TSDKTeamPreferences.h
//  SDKPlayground
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

typedef NS_CLOSED_ENUM(NSInteger, TSDKTeamPreferenceAssignmentsEnabledFor) {
    TSDKTeamPreferenceAssignmentsEnabledForAll = 0,
    TSDKTeamPreferenceAssignmentsEnabledForGames = 1,
    TSDKTeamPreferenceAssignmentsEnabledForEvents = 2,
};


typedef NS_CLOSED_ENUM(NSInteger, TSDKTeamPreferenceAvailabilitiesSortOrder) {
    TSDKTeamPreferenceAvailabilitiesSortOrderName,
    TSDKTeamPreferenceAvailabilitiesSortOrderJerseyNumber,
    TSDKTeamPreferenceAvailabilitiesSortOrderDateSet,
};

typedef NS_CLOSED_ENUM (NSUInteger, TSDKTeamPreferenceMemberSortOrder) {
    TSDKTeamPreferenceMemberSortOrderFirstName,
    TSDKTeamPreferenceMemberSortOrderLastName,
};

@interface TSDKTeamPreferences : TSDKCollectionObject

@property (nonatomic, assign) NSInteger tslScorePushEnabled; //Example: 1
@property (nonatomic, assign) BOOL trackedItemsIsPrivate; //Example: **NULL**
@property (nonatomic, strong) NSString *_Nullable teamMessage; //Example: <p>Test</p>
@property (nonatomic, assign) BOOL availabilitiesShowTab; //Example: 1
@property (nonatomic, strong) NSString *_Nullable globalUniformHome; //Example: White shirt, grey pants
@property (nonatomic, assign) TSDKTeamPreferenceAssignmentsEnabledFor assignmentsEnableForCode; //Example: 2
@property (nonatomic, assign) BOOL paymentsIgnoreNonPlayers; //Example: 0
@property (nonatomic, assign) BOOL remindersSendGame; //Example: 0
@property (nonatomic, assign) BOOL globalUseInternationalDate; //Example: 0
@property (nonatomic, assign) NSInteger availabilityGameCutoff; //Example: 72
@property (nonatomic, assign) BOOL isTrackedItemsPrivate; //Example: <null>
@property (nonatomic, strong) NSString *_Nullable assignmentsEnableFor; //Example: Events
@property (nonatomic, assign) BOOL trackedItemsIgnoreNonPlayers; //Example: 0
@property (nonatomic, assign) BOOL isYouth; //Example: 1
@property (nonatomic, assign) BOOL isTslPushEnabled; //Example: 1
@property (nonatomic, assign) BOOL tracksPoints; //Example: 1
@property (nonatomic, assign) NSInteger availabilityEventCutoff; //Example: 72
@property (nonatomic, assign) BOOL isCoed; //Example: 1
@property (nonatomic, assign) BOOL paymentsShowTab; //Example: 1
@property (nonatomic, assign) BOOL remindersSendEvent; //Example: 0
@property (nonatomic, strong) NSString *_Nullable alternateSportName; //Example:
@property (nonatomic, assign) NSInteger colorSchemeCd; //Example: 0
@property (nonatomic, assign) BOOL announcementAboveHomePhoto; //Example: 1
@property (nonatomic, strong) NSDate *_Nullable updatedAt; //Example: 2016-02-23T14:50:23Z
@property (nonatomic, assign) BOOL isPaymentsPrivate; //Example: 0
@property (nonatomic, assign) BOOL teamMediaShowTab; //Example: 1
@property (nonatomic, strong) NSString *_Nullable skillLevel; //Example: **NULL**
@property (nonatomic, assign) BOOL trackedItemsShowTab; //Example: 1
@property (nonatomic, strong) NSString *_Nullable teamHeadline; //Example: A message from the Team Manager...
@property (nonatomic, strong) NSString *_Nullable globalUniformAway; //Example: Blue shirt, gray pants
@property (nonatomic, assign) NSInteger globalUseInternationalTime; //Example: 0
@property (nonatomic, assign) BOOL assignmentsShowTab; //Example: 1
@property (nonatomic, assign) BOOL leagueControlledSettings; //Example: 0
@property (nonatomic, strong) NSDate *_Nullable createdAt; //Example: 2012-03-25T23:46:01Z
@property (nonatomic, assign) BOOL tslPushEnabled; //Example: 1
@property (nonatomic, assign) BOOL statisticsShowTab; //Example: 1
@property (nonatomic, assign) BOOL isTslScorePushEnabled; //Example: 1
@property (nonatomic, assign) BOOL marketplaceShowTab; //Example: 1
@property (nonatomic, strong) NSString *_Nullable teamId; //Example: 71118
@property (nonatomic, assign) BOOL shareAvailabilityNotes; //Example: 0
@property (nonatomic, assign) BOOL shouldShowPushNotificationBanner;
@property (nonatomic, assign) BOOL isTslEnabled; //Example: 1
@property (nonatomic, assign) BOOL isTeamChatEnabled; // Example 1
@property (nonatomic, assign) BOOL isUnifiedMessagingTeamChat; //Example: 1
@property (nonatomic, strong, nullable) NSDate * teamChatUnifiedMessagingMigrationDate; //Example: 2020-06-01T00:00:00+00:00 
@property (nonatomic, assign) NSInteger managerDefaultAvailability; //Example: 0
@property (nonatomic, strong) NSString *_Nullable gender; //Example: **NULL**
@property (nonatomic, assign) BOOL filesShowTab; //Example: 1
@property (nonatomic, assign) BOOL showDivisionStandings; //Example: 0
@property (nonatomic, strong) NSString *_Nullable ageGroup; //Example: **NULL**
@property (nonatomic, assign) BOOL canTeamAddMembers;
@property (nonatomic, assign) BOOL canTeamDeleteMembers;
@property (nonatomic, assign) BOOL canDisplayStore;
@property (nonatomic, assign) BOOL isStoreConfigured;
@property (nonatomic, assign, readonly) BOOL isEventLineupEnabled;
@property (nonatomic, assign, readonly) BOOL isDirectMessageEnabled;
@property (nonatomic, assign, readonly) BOOL isHealthCheckEnabled;
@property (nonatomic, assign, readonly) NSInteger healthCheckUnlockHours; //Example: 8
@property (nonatomic, assign) BOOL canSetupWepay;
@property (nonatomic, strong) NSString *_Nullable currencySymbol; //Example: $
@property (nonatomic, strong) NSString *_Nullable currencyCode; //Example: USD
@property (nonatomic, assign) NSInteger hideHeader; //Example: 0
@property (nonatomic, assign) BOOL showInvoicing; //Example: 1
@property (nonatomic, strong) NSURL *_Nullable linkTeam;
@property (nonatomic, strong) NSURL *_Nullable linkTeamPhoto;
@property (nonatomic, strong) NSURL *_Nullable linkTeamLogo;
@property (nonatomic, strong) NSURL *_Nullable linkSportPositions;

// Not AutoGenerated:
#if TARGET_OS_IPHONE
-(void)getTeamPhotoWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKImageCompletionBlock _Nullable)completion;
-(void)getTeamLogoWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKImageCompletionBlock _Nullable)completion;
#endif

- (TSDKTeamPreferenceMemberSortOrder)memberSortOrderPreference;
- (void)setMemberSortOrderPreference:(TSDKTeamPreferenceMemberSortOrder)memberSortOrderPreference;
- (NSString *_Nullable)rawValueForMemberSortOrder:(TSDKTeamPreferenceMemberSortOrder)memberSortOrderPreference;

- (TSDKTeamPreferenceAvailabilitiesSortOrder)availabilitiesSortOrderPreference;
- (void)setAvailabilitySortOrderPreference:(TSDKTeamPreferenceAvailabilitiesSortOrder)sortOrderPreference;

//+(void)actionUploadTeamPhotoWithCompletion:(TSDKCompletionBlock)completion; //(null)
//+(void)actionUploadTeamLogoWithCompletion:(TSDKCompletionBlock)completion; //(null)
//+(void)actionRemoveTeamLogoWithCompletion:(TSDKCompletionBlock)completion; //(null)
//+(void)actionRemoveTeamPhotoWithCompletion:(TSDKCompletionBlock)completion; //(null)

@end

@interface TSDKTeamPreferences (ForwardedMethods)

-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;

@end
