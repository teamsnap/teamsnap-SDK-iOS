//
//  TSDKEventStatistic.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 2/24/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKEventStatistic.h"

@implementation TSDKEventStatistic

@dynamic totalRankingForQuery, eventId, teamId, total, statisticId, linkEvent, linkStatistic, linkTeam;

+ (NSString *)SDKType {
    return @"event_statistic";
}

@end
