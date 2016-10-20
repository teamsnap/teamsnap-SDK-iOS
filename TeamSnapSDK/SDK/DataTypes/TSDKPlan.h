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

@property (nonatomic, assign) BOOL hasTextMessaging; //Example: 1
@property (nonatomic, assign) BOOL hasSeasons; //Example: 1
@property (nonatomic, assign) BOOL hasStatistics; //Example: 1
@property (nonatomic, weak) NSString *_Nullable platform; //Example: web
@property (nonatomic, assign) BOOL hasPhotos; //Example: 1
@property (nonatomic, assign) BOOL hasCustomFields; //Example: 1
@property (nonatomic, assign) BOOL hasHideMarketplaceTab; //Example: 1
@property (nonatomic, assign) NSInteger annualPrice; //Example: 129.99
@property (nonatomic, assign) BOOL hasAvailabilities; //Example: 1
@property (nonatomic, assign) BOOL hasSponsorships; //Example: 1
@property (nonatomic, assign) BOOL hasTeamMedia; //Example: 1
@property (nonatomic, assign) BOOL hasSslSecurity; //Example: 1
@property (nonatomic, assign) BOOL hasOffSeason; //Example: 1
@property (nonatomic, assign) BOOL hasAdFree; //Example: 1
@property (nonatomic, weak) NSString *_Nullable monthlyPriceDescription; //Example: $17.99/month
@property (nonatomic, weak) NSString *_Nullable name; //Example: Ultra Plan
@property (nonatomic, assign) NSInteger uploadQuotaInMb; //Example: 99000
@property (nonatomic, assign) BOOL hasTracking; //Example: 1
@property (nonatomic, assign) BOOL isActive; //Example: 0
@property (nonatomic, assign) BOOL hasPayments; //Example: 1
@property (nonatomic, assign) BOOL hasTeamLogo; //Example: 1
@property (nonatomic, assign) BOOL hasWeather; //Example: 1
@property (nonatomic, assign) BOOL hasTeamColors; //Example: 1
@property (nonatomic, weak) NSString *_Nullable planType; //Example: ultra
@property (nonatomic, assign) BOOL hasRss; //Example: 1
@property (nonatomic, assign) BOOL hasPaypal; //Example: 1
@property (nonatomic, assign) BOOL hasExternalEmail; //Example: 1
@property (nonatomic, assign) BOOL hasAssignments; //Example: 1
@property (nonatomic, assign) BOOL hasCustomDomain; //Example: 1
@property (nonatomic, weak) NSString *_Nullable platformVersion; //Example: 0.0.0
@property (nonatomic, assign) NSInteger monthlyPrice; //Example: 17.99
@property (nonatomic, assign) BOOL hasRosterPhotos; //Example: 1
@property (nonatomic, assign) BOOL hasClubs; //Example: 1

-(BOOL)freeTrial;
-(BOOL)freeNotTrial;
-(BOOL)freePlan;

@end
