// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKDivisionPreferences : TSDKCollectionObject

@property (nonatomic, weak) NSDate *_Nullable createdAt; //Example: 2016-01-05T22:59:32Z
@property (nonatomic, assign) NSInteger availabilityEventCutoff; //Example: 0
@property (nonatomic, assign) BOOL hasTrackedItemsForNonPlayers; //Example: 1
@property (nonatomic, assign) BOOL isRegistrationEnabled; //Example: 1
@property (nonatomic, assign) BOOL hasInternationalDate; //Example: 0
@property (nonatomic, assign) BOOL isPaymentsEnabled; //Example: 1
@property (nonatomic, assign) BOOL hasPaymentsForNonPlayers; //Example: 1
@property (nonatomic, assign) BOOL isSponsorEditableForNonCommissioners; //Example: 1
@property (nonatomic, assign) BOOL hasInternationalTime; //Example: 0
@property (nonatomic, assign) BOOL isPaymentsPrivate; //Example: 0
@property (nonatomic, weak) NSString *_Nullable colorSchemeCd; //Example: **NULL**
@property (nonatomic, assign) BOOL isScheduleEnabled; //Example: <null>
@property (nonatomic, assign) BOOL isStatisticsEnabled; //Example: 1
@property (nonatomic, assign) BOOL isEventRemindersEnabled; //Example: 1
@property (nonatomic, weak) NSString *_Nullable alternateSportName; //Example:
@property (nonatomic, assign) BOOL isAssignmentsEnabled; //Example: 1
@property (nonatomic, assign) BOOL isAnnouncementAboveHomePhoto; //Example: 1
@property (nonatomic, weak) NSString *_Nullable availabilitiesSortOrder; //Example: jersey
@property (nonatomic, weak) NSString *_Nullable availabilityGameCutoff; //Example: **NULL**
@property (nonatomic, assign) BOOL isAvailabilitiesEnabled; //Example: 1
@property (nonatomic, assign) BOOL isTrackedItemsEnabled; //Example: 1
@property (nonatomic, weak) NSString *_Nullable currencySymbol; //Example: $
@property (nonatomic, assign) NSInteger assignmentsEnableForCode; //Example: 0
@property (nonatomic, assign) BOOL isCoed; //Example: 0
@property (nonatomic, weak) NSString *_Nullable paypalCurrencyId; //Example: <null>
@property (nonatomic, assign) BOOL isRosterImportable; //Example: 1
@property (nonatomic, assign) BOOL isTrackingPoints; //Example: 1
@property (nonatomic, assign) BOOL isStandingsEnabled; //Example: 1
@property (nonatomic, weak) NSString *_Nullable memberSortOrder; //Example: first
@property (nonatomic, assign) BOOL isLeagueControllingSettings; //Example: 0
@property (nonatomic, assign) BOOL isYouth; //Example: 1
@property (nonatomic, weak) NSString *_Nullable canHaveSubdivisions; //Example: **NULL**
@property (nonatomic, weak) NSDate *_Nullable updatedAt; //Example: 2016-08-12T21:38:13Z
@property (nonatomic, assign) BOOL isTeamMediaEnabled; //Example: 1
@property (nonatomic, assign) BOOL isHeaderHidden; //Example: 0
@property (nonatomic, assign) BOOL isTrackedItemsPrivate; //Example: 0
@property (nonatomic, assign) BOOL isMultiSport; //Example: <null>
@property (nonatomic, assign) BOOL isMarketplaceEnabled; //Example: 1
@property (nonatomic, assign) BOOL isGameRemindersEnabled; //Example: 1
@property (nonatomic, weak) NSURL *_Nullable linkDivisionLogo;
@property (nonatomic, weak) NSURL *_Nullable linkDivision;
@property (nonatomic, weak) NSURL *_Nullable linkPaypalCurrency;
@property (nonatomic, weak) NSURL *_Nullable linkDivisionLogoThumbnail;

@end

@interface TSDKDivisionPreferences (ForwardedMethods)

-(void)getDivisionLogoWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getPaypalCurrencyWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getDivisionLogoThumbnailWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;

@end



