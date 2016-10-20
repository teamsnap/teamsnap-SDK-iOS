//
//  TSDKTeamPreferences.h
//  SDKPlayground
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

typedef enum : NSUInteger {
    TSDKTeamPreferenceAvailabilitiesSortOrderName,
    TSDKTeamPreferenceAvailabilitiesSortOrderJerseyNumber,
    TSDKTeamPreferenceAvailabilitiesSortOrderDateSet,
} TSDKTeamPreferenceAvailabilitiesSortOrder;

typedef enum : NSUInteger {
    TSDKTeamPreferenceMemberSortOrderFirstName,
    TSDKTeamPreferenceMemberSortOrderLastName,
} TSDKTeamPreferenceMemberSortOrder;

@interface TSDKTeamPreferences : TSDKCollectionObject

@property (nonatomic, assign) NSInteger tslScorePushEnabled; //Example: 1
@property (nonatomic, assign) BOOL trackedItemsIsPrivate; //Example: **NULL**
@property (nonatomic, weak) NSString *_Nullable teamMessage; //Example: <p>Test</p>
@property (nonatomic, assign) BOOL availabilitiesShowTab; //Example: 1
@property (nonatomic, weak) NSString *_Nullable globalUniformHome; //Example: White shirt, grey pants
@property (nonatomic, assign) BOOL tslEnabled; //Example: 1
@property (nonatomic, assign) BOOL paymentsIgnoreNonPlayers; //Example: 0
@property (nonatomic, assign) BOOL remindersSendGame; //Example: 0
@property (nonatomic, assign) BOOL globalUseInternationalDate; //Example: 0
@property (nonatomic, assign) NSInteger availabilityGameCutoff; //Example: 72
@property (nonatomic, assign) BOOL isTrackedItemsPrivate; //Example: <null>
@property (nonatomic, weak) NSString *_Nullable assignmentsEnableFor; //Example: Events
@property (nonatomic, assign) BOOL trackedItemsIgnoreNonPlayers; //Example: 0
@property (nonatomic, assign) BOOL isYouth; //Example: 1
@property (nonatomic, assign) BOOL isTslPushEnabled; //Example: 1
@property (nonatomic, assign) BOOL tracksPoints; //Example: 1
@property (nonatomic, assign) NSInteger availabilityEventCutoff; //Example: 72
@property (nonatomic, assign) BOOL isCoed; //Example: 1
@property (nonatomic, assign) BOOL paymentsShowTab; //Example: 1
@property (nonatomic, assign) BOOL remindersSendEvent; //Example: 0
@property (nonatomic, weak) NSString *_Nullable alternateSportName; //Example:
@property (nonatomic, assign) NSInteger colorSchemeCd; //Example: 0
@property (nonatomic, assign) BOOL announcementAboveHomePhoto; //Example: 1
@property (nonatomic, weak) NSDate *_Nullable updatedAt; //Example: 2016-02-23T14:50:23Z
@property (nonatomic, assign) BOOL isPaymentsPrivate; //Example: 0
@property (nonatomic, assign) BOOL teamMediaShowTab; //Example: 1
@property (nonatomic, weak) NSString *_Nullable skillLevel; //Example: **NULL**
@property (nonatomic, assign) BOOL trackedItemsShowTab; //Example: 1
@property (nonatomic, weak) NSString *_Nullable teamHeadline; //Example: A message from the Team Manager...
@property (nonatomic, weak) NSString *_Nullable globalUniformAway; //Example: Blue shirt, gray pants
@property (nonatomic, assign) NSInteger globalUseInternationalTime; //Example: 0
@property (nonatomic, assign) BOOL assignmentsShowTab; //Example: 1
@property (nonatomic, assign) BOOL leagueControlledSettings; //Example: 0
@property (nonatomic, weak) NSDate *_Nullable createdAt; //Example: 2012-03-25T23:46:01Z
@property (nonatomic, assign) BOOL tslPushEnabled; //Example: 1
@property (nonatomic, assign) BOOL statisticsShowTab; //Example: 1
@property (nonatomic, assign) BOOL isTslScorePushEnabled; //Example: 1
@property (nonatomic, assign) BOOL marketplaceShowTab; //Example: 1
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, assign) NSInteger shareAvailabilityNotes; //Example: 0
@property (nonatomic, assign) NSInteger assignmentsEnableForCode; //Example: 2
@property (nonatomic, assign) BOOL isTslEnabled; //Example: 1
@property (nonatomic, assign) NSInteger managerDefaultAvailability; //Example: 0
@property (nonatomic, weak) NSString *_Nullable gender; //Example: **NULL**
@property (nonatomic, assign) BOOL filesShowTab; //Example: 1
@property (nonatomic, assign) BOOL showDivisionStandings; //Example: 0
@property (nonatomic, weak) NSString *_Nullable ageGroup; //Example: **NULL**

@property (nonatomic, weak) NSString *_Nullable currencySymbol; //Example: $
@property (nonatomic, assign) NSInteger hideHeader; //Example: 0
@property (nonatomic, weak) NSURL *_Nullable linkTeam;
@property (nonatomic, weak) NSURL *_Nullable linkTeamPhoto;
@property (nonatomic, weak) NSURL *_Nullable linkTeamLogo;

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
