//
//  TSDKMemberStatistic.h
//  SDKPlayground
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKMemberStatistic : TSDKCollectionObject

@property (nonatomic, weak) NSString *averageRankingForQuery; //Example: **NULL**
@property (nonatomic, assign) NSInteger countGamesPlayed; //Example: 0
@property (nonatomic, weak) NSString *average; //Example: **NULL**
@property (nonatomic, weak) NSString *averageRanking; //Example: **NULL**
@property (nonatomic, weak) NSString *totalRankingForQuery; //Example: **NULL**
@property (nonatomic, assign) NSInteger statisticId; //Example: 776832
@property (nonatomic, weak) NSString *total; //Example: **NULL**
@property (nonatomic, assign) NSInteger teamId; //Example: 153832
@property (nonatomic, weak) NSString *totalRanking; //Example: **NULL**
@property (nonatomic, assign) NSInteger memberId; //Example: 1942977
@property (nonatomic, weak) NSURL *linkMember;
@property (nonatomic, weak) NSURL *linkStatistic;
@property (nonatomic, weak) NSURL *linkTeam;

@end

@interface TSDKMemberStatistic (ForwardedMethods)

-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberArrayCompletionBlock)completion;
-(void)getStatisticWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKStatisticArrayCompletionBlock)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion;

@end
