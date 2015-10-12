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

@property (nonatomic) BOOL hasTextMessaging; //Example: 0
@property (nonatomic) BOOL hasSeasons; //Example: 0
@property (nonatomic) BOOL hasStatistics; //Example: 0
@property (nonatomic, weak) NSString *platform; //Example: web
@property (nonatomic) BOOL hasPhotos; //Example: 0
@property (nonatomic) BOOL hasCustomFields; //Example: 0
@property (nonatomic) BOOL hasHideMarketplaceTab; //Example: 0
@property (nonatomic) NSInteger annualPrice; //Example: **NULL**
@property (nonatomic) BOOL hasAvailabilities; //Example: 0
@property (nonatomic) BOOL hasSponsorships; //Example: 0
@property (nonatomic) BOOL hasTeamMedia; //Example: 0
@property (nonatomic) BOOL hasSslSecurity; //Example: 0
@property (nonatomic) BOOL hasOffSeason; //Example: 0
@property (nonatomic) BOOL hasAdFree; //Example: 0
@property (nonatomic, weak) NSString *monthlyPriceDescription; //Example: Free!
@property (nonatomic, weak) NSString *name; //Example: Free Plan
@property (nonatomic) NSInteger uploadQuotaInMb; //Example: 0
@property (nonatomic) BOOL hasTracking; //Example: 0
@property (nonatomic) BOOL isActive; //Example: 1
@property (nonatomic) BOOL hasPayments; //Example: 0
@property (nonatomic) BOOL hasTeamLogo; //Example: 0
@property (nonatomic) BOOL hasWeather; //Example: 0
@property (nonatomic) BOOL hasTeamColors; //Example: 0
@property (nonatomic, weak) NSString *planType; //Example: free
@property (nonatomic) BOOL hasRss; //Example: 0
@property (nonatomic) BOOL hasPaypal; //Example: 0
@property (nonatomic) BOOL hasExternalEmail; //Example: 0
@property (nonatomic) BOOL hasAssignments; //Example: 0
@property (nonatomic) BOOL hasCustomDomain; //Example: 0
@property (nonatomic, weak) NSString *platformVersion; //Example: 0.0.0
@property (nonatomic) NSInteger monthlyPrice; //Example: 0
@property (nonatomic) BOOL hasRosterPhotos; //Example: 1
@property (nonatomic) BOOL hasClubs; //Example: 0

-(BOOL)freeTrial;
-(BOOL)freeNotTrial;
-(BOOL)freePlan;

@end
