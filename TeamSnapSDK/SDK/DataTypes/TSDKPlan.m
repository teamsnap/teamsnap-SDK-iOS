//
//  TSDKPlan.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 9/14/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKPlan.h"

@implementation TSDKPlan

@dynamic hasEventLineup, hasTextMessaging, hasSeasons, hasTsl, hasStatistics, platform, hasPhotos, createdAt, memberLimit, hasCustomFields, hasHideMarketplaceTab, annualPrice, hasAvailabilities, hasSponsorships, hasTeamMedia, hasSslSecurity, hasOffSeason, hasAdFree, monthlyPriceDescription, name, uploadQuotaInMb, hasTracking, hasUnlimitedMembers, hasExternalEmail, hasPayments, hasTeamLogo, hasWeather, hasTeamColors, hasRss, hasAvailabilitiesExport, hasPaypal, hasCustomDomain, hasAssignments, isActive, planType, platformVersion, updatedAt, monthlyPrice, hasTeamChat, hasRosterPhotos, hasClubs;

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
