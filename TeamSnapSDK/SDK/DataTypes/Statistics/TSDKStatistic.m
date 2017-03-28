//
//  TSDKStatistic.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 9/2/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKStatistic.h"
#import "NSNumber+TSDKConveniences.h"

@implementation TSDKStatistic

@dynamic isTeamStatistic, statisticGroupId, position, isInDescendingOrder, prettyFormula, acronym, formula, isPercentage, isTopStatistic, isPrivate, displayZeroTotals, precision, teamId, name, alwaysDisplayDecimals, linkStatisticGroup, linkTeamStatistics, linkTeam, linkMemberStatistics, linkStatisticData;

+ (NSString *)SDKType {
    return @"statistic";
}

- (NSString *)displayStringForStatisticValue:(NSNumber *)statValue {
    if ((self.precision == 0) || ((self.alwaysDisplayDecimals == false) && [statValue isWholeNumber])) {
        return [NSString stringWithFormat:@"%ld", (long)[statValue integerValue]];
    } else {
        NSString *formatString = [NSString stringWithFormat:@"%%.%ldf", (long)self.precision];
        
        return [NSString stringWithFormat:formatString, [statValue floatValue]];
    }
}

@end
