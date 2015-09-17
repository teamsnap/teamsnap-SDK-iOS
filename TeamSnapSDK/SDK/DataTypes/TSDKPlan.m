//
//  TSDKPlan.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 9/14/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKPlan.h"

@implementation TSDKPlan

@dynamic hasTextMessaging, hasSeasons, hasStatistics, platform, hasPhotos, hasCustomFields, hasHideMarketplaceTab, annualPrice, hasAvailabilities, hasSponsorships, hasTeamMedia, hasSslSecurity, hasOffSeason, hasAdFree, monthlyPriceDescription, name, uploadQuotaInMb, hasTracking, hasExternalEmail, hasPayments, hasTeamLogo, hasWeather, hasTeamColors, platformVersion, planType, hasRss, hasPaypal, hasAssignments, hasCustomDomain, monthlyPrice, hasRosterPhotos, hasClubs;

+ (NSString *)SDKType {
    return @"plan";
}

@end
