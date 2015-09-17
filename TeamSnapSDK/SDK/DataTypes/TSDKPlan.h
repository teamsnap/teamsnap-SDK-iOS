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

@property (nonatomic) BOOL hasTextMessaging; //Example: 1
@property (nonatomic) BOOL hasSeasons; //Example: 1
@property (nonatomic) BOOL hasStatistics; //Example: 1
@property (nonatomic, weak) NSString *platform; //Example: web
@property (nonatomic) BOOL hasPhotos; //Example: 1
@property (nonatomic) BOOL hasCustomFields; //Example: 1
@property (nonatomic) BOOL hasHideMarketplaceTab; //Example: 1
@property (nonatomic) NSInteger annualPrice; //Example: 79
@property (nonatomic) BOOL hasAvailabilities; //Example: 1
@property (nonatomic) BOOL hasSponsorships; //Example: 0
@property (nonatomic) BOOL hasTeamMedia; //Example: 1
@property (nonatomic) BOOL hasSslSecurity; //Example: 1
@property (nonatomic) BOOL hasOffSeason; //Example: 1
@property (nonatomic) BOOL hasAdFree; //Example: 1
@property (nonatomic, weak) NSString *monthlyPriceDescription; //Example: $9.95/month
@property (nonatomic, weak) NSString *name; //Example: Premium Plan
@property (nonatomic) NSInteger uploadQuotaInMb; //Example: 129000
@property (nonatomic) BOOL hasTracking; //Example: 1
@property (nonatomic) BOOL hasExternalEmail; //Example: 1
@property (nonatomic) BOOL hasPayments; //Example: 1
@property (nonatomic) BOOL hasTeamLogo; //Example: 1
@property (nonatomic) BOOL hasWeather; //Example: 1
@property (nonatomic) BOOL hasTeamColors; //Example: 1
@property (nonatomic, weak) NSString *platformVersion; //Example: 0.0.0
@property (nonatomic, weak) NSString *planType; //Example: premium
@property (nonatomic) BOOL hasRss; //Example: 1
@property (nonatomic) BOOL hasPaypal; //Example: 1
@property (nonatomic) BOOL hasAssignments; //Example: 1
@property (nonatomic) BOOL hasCustomDomain; //Example: 1
@property (nonatomic) NSInteger monthlyPrice; //Example: 9.949999999999999
@property (nonatomic) BOOL hasRosterPhotos; //Example: 1
@property (nonatomic) BOOL hasClubs; //Example: 1

@end
