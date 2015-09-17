//
//  TSDKStatistic.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 9/2/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKStatistic.h"

@implementation TSDKStatistic

@dynamic isTeamStatistic, statisticGroupId, position, isInDescendingOrder, prettyFormula, acronym, formula, isPercentage, isTopStatistic, isPrivate, displayZeroTotals, precision, teamId, name, alwaysDisplayDecimals, linkStatisticGroup, linkTeamStatistics, linkTeam, linkMemberStatistics, linkStatisticData;

+ (NSString *)SDKType {
    return @"statistic";
}

@end
