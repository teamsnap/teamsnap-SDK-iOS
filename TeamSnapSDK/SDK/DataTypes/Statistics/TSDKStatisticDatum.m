//
//  TSDKStatisticDatum.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 9/2/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKStatisticDatum.h"

@implementation TSDKStatisticDatum

@dynamic ranking, statisticId, value, memberId, teamId, eventId, linkMember, linkStatistic, linkEvent, linkTeam;

+ (NSString *)SDKType {
    return @"statistic_datum";
}

@end
