//
//  TSDKSport.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 9/2/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKSport.h"

@implementation TSDKSport

@dynamic hasShootouts, hasStatisticTemplate, shootoutLabel, overtimeLabel, hasCustomizedLanguage, isNonSport, overtimeAbbrev, tracksPoints, hasOvertime, lowScoreWins, shootoutAbbrev, name, tracksOvertimeLosses;

+ (NSString *)SDKType {
    return @"sport";
}

@end
