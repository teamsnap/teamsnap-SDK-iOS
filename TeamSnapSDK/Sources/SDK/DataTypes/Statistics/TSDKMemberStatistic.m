//
//  TSDKMemberStatistic.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 9/2/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKMemberStatistic.h"

@implementation TSDKMemberStatistic

@dynamic averageRankingForQuery, countGamesPlayed, average, averageRanking, totalRankingForQuery, statisticId, total, teamId, totalRanking, memberId, linkMember, linkStatistic, linkTeam;

+ (NSString *)SDKType {
    return @"member_statistic";
}

@end
