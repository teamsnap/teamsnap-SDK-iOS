//
//  TSDKPlan.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 9/14/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKPlan.h"

@implementation TSDKPlan

@dynamic hasTextMessaging, hasSeasons, hasStatistics, platform, hasPhotos, hasCustomFields, hasHideMarketplaceTab, annualPrice, hasAvailabilities, hasSponsorships, hasTeamMedia, hasSslSecurity, hasOffSeason, hasAdFree, monthlyPriceDescription, name, uploadQuotaInMb, hasTracking, isActive, hasPayments, hasTeamLogo, hasWeather, hasTeamColors, planType, hasRss, hasPaypal, hasExternalEmail, hasAssignments, hasCustomDomain, platformVersion, monthlyPrice, hasRosterPhotos, hasClubs;

+ (NSString *)SDKType {
    return @"plan";
}

-(BOOL)freeTrial {
    return [self.planType isEqualToString:@"trial"];
}

-(BOOL)freeNotTrial{
    return [self.planType isEqualToString:@"free"];
}

-(BOOL)freePlan {
    return ([self freeTrial] || [self.planType isEqualToString:@"free"]);
}

@end
