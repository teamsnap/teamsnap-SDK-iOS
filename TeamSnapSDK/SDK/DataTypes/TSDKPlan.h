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

@property (nonatomic, assign) BOOL hasTextMessaging; //Example: 0
@property (nonatomic, assign) BOOL hasSeasons; //Example: 0
@property (nonatomic, assign) BOOL hasStatistics; //Example: 0
@property (nonatomic, weak) NSString *platform; //Example: web
@property (nonatomic, assign) BOOL hasPhotos; //Example: 0
@property (nonatomic, assign) BOOL hasCustomFields; //Example: 0
@property (nonatomic, assign) BOOL hasHideMarketplaceTab; //Example: 0
@property (nonatomic, assign) NSInteger annualPrice; //Example: **NULL**
@property (nonatomic, assign) BOOL hasAvailabilities; //Example: 0
@property (nonatomic, assign) BOOL hasSponsorships; //Example: 0
@property (nonatomic, assign) BOOL hasTeamMedia; //Example: 0
@property (nonatomic, assign) BOOL hasSslSecurity; //Example: 0
@property (nonatomic, assign) BOOL hasOffSeason; //Example: 0
@property (nonatomic, assign) BOOL hasAdFree; //Example: 0
@property (nonatomic, weak) NSString *monthlyPriceDescription; //Example: Free!
@property (nonatomic, weak) NSString *name; //Example: Free Plan
@property (nonatomic, assign) NSInteger uploadQuotaInMb; //Example: 0
@property (nonatomic, assign) BOOL hasTracking; //Example: 0
@property (nonatomic, assign) BOOL isActive; //Example: 1
@property (nonatomic, assign) BOOL hasPayments; //Example: 0
@property (nonatomic, assign) BOOL hasTeamLogo; //Example: 0
@property (nonatomic, assign) BOOL hasWeather; //Example: 0
@property (nonatomic, assign) BOOL hasTeamColors; //Example: 0
@property (nonatomic, weak) NSString *planType; //Example: free
@property (nonatomic, assign) BOOL hasRss; //Example: 0
@property (nonatomic, assign) BOOL hasPaypal; //Example: 0
@property (nonatomic, assign) BOOL hasExternalEmail; //Example: 0
@property (nonatomic, assign) BOOL hasAssignments; //Example: 0
@property (nonatomic, assign) BOOL hasCustomDomain; //Example: 0
@property (nonatomic, weak) NSString *platformVersion; //Example: 0.0.0
@property (nonatomic, assign) NSInteger monthlyPrice; //Example: 0
@property (nonatomic, assign) BOOL hasRosterPhotos; //Example: 1
@property (nonatomic, assign) BOOL hasClubs; //Example: 0

-(BOOL)freeTrial;
-(BOOL)freeNotTrial;
-(BOOL)freePlan;

@end
