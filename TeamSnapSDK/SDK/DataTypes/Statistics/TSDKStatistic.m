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

- (CGFloat)round:(NSNumber *)value To:(NSInteger)decimalPlaces {
    NSInteger power = pow(10, decimalPlaces);
    return  [[NSNumber numberWithFloat:(round([value floatValue] * power) / power)] floatValue];
}

- (NSString *)displayStringForStatisticValue:(NSNumber *)statValue {

    if ((self.alwaysDisplayDecimals == false) && [statValue isWholeNumber]) {
        if (self.isPercentage) {
            return [NSString stringWithFormat:@"%ld%%", (long)statValue.integerValue * 100];
        } else {
            return [NSString stringWithFormat:@"%ld", (long)statValue.integerValue];
        }
    } else {
        NSString *formatString = [NSString stringWithFormat:@"%%.%ldf", (long)self.precision];
        if ([self isPercentage]) {
            formatString = [formatString stringByAppendingString:@"%%"];
            statValue = @(statValue.floatValue * 100);
        }
        CGFloat roundedValue = [self round:statValue To:self.precision];
        
        return [NSString stringWithFormat:formatString, roundedValue];
    }
}

@end
