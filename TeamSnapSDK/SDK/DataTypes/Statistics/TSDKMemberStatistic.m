//
//  TSDKMemberStatistic.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 9/2/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKMemberStatistic.h"

@implementation TSDKMemberStatistic

@dynamic teamId, totalRankingForQuery, average, averageRankingForQuery, statisticId, memberId, averageRanking, total, totalRanking, linkMember, linkStatistic, linkTeam;

+ (NSString *)SDKType {
    return @"member_statistic";
}

@end
