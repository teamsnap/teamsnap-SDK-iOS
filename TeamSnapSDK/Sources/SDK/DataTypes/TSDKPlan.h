//
//  TSDKPlan.h
//  SDKPlayground
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKPlan : TSDKCollectionObject

@property (nonatomic, assign) BOOL hasEventLineup; //Example: 1
@property (nonatomic, assign) BOOL hasTextMessaging; //Example: 1
@property (nonatomic, assign) BOOL hasSeasons; //Example: 1
@property (nonatomic, assign) BOOL hasTsl; //Example: 1
@property (nonatomic, assign) BOOL hasStatistics; //Example: 1
@property (nonatomic, strong, nullable) NSString * platform; //Example: web
@property (nonatomic, assign) BOOL hasPhotos; //Example: 1
@property (nonatomic, strong, nullable) NSDate * createdAt; //Example: <null>
@property (nonatomic, assign) NSInteger memberLimit; //Example: 4000
@property (nonatomic, assign) BOOL hasCustomFields; //Example: 1
@property (nonatomic, assign) BOOL hasHideMarketplaceTab; //Example: 1
@property (nonatomic, assign) NSInteger annualPrice; //Example: 129.99
@property (nonatomic, assign) BOOL hasAvailabilities; //Example: 1
@property (nonatomic, assign) BOOL hasSponsorships; //Example: 1
@property (nonatomic, assign) BOOL hasTeamMedia; //Example: 1
@property (nonatomic, assign) BOOL hasSslSecurity; //Example: 1
@property (nonatomic, assign) BOOL hasOffSeason; //Example: 1
@property (nonatomic, assign) BOOL hasAdFree; //Example: 1
@property (nonatomic, strong, nullable) NSString * monthlyPriceDescription; //Example: $17.99/month
@property (nonatomic, strong, nullable) NSString * name; //Example: Ultra Plan
@property (nonatomic, assign) NSInteger uploadQuotaInMb; //Example: 120000
@property (nonatomic, assign) BOOL hasTracking; //Example: 1
@property (nonatomic, assign) BOOL hasUnlimitedMembers; //Example: 1
@property (nonatomic, assign) BOOL hasExternalEmail; //Example: 1
@property (nonatomic, assign) BOOL hasPayments; //Example: 1
@property (nonatomic, assign) BOOL hasTeamLogo; //Example: 1
@property (nonatomic, assign) BOOL hasWeather; //Example: 1
@property (nonatomic, assign) BOOL hasTeamColors; //Example: 1
@property (nonatomic, assign) BOOL hasRss; //Example: 1
@property (nonatomic, assign) BOOL hasAvailabilitiesExport; //Example: 1
@property (nonatomic, assign) BOOL hasPaypal; //Example: 1
@property (nonatomic, assign) BOOL hasCustomDomain; //Example: 1
@property (nonatomic, assign) BOOL hasAssignments; //Example: 1
@property (nonatomic, assign) BOOL isActive; //Example: 1
@property (nonatomic, strong, nullable) NSString * planType; //Example: ultra
@property (nonatomic, strong, nullable) NSString * platformVersion; //Example: 0.0.0
@property (nonatomic, strong, nullable) NSDate * updatedAt; //Example: <null>
@property (nonatomic, assign) NSInteger monthlyPrice; //Example: 17.99
@property (nonatomic, assign) BOOL hasTeamChat; //Example: 1
@property (nonatomic, assign) BOOL hasRosterPhotos; //Example: 1
@property (nonatomic, assign) BOOL hasClubs; //Example: 1

-(BOOL)freeTrial;
-(BOOL)freeNotTrial;
-(BOOL)freePlan;

@end
