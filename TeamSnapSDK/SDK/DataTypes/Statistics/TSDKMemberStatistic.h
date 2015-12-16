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

@property (nonatomic, assign) NSInteger teamId; //Example: 153832
@property (nonatomic, assign) NSInteger totalRankingForQuery; //Example: 1
@property (nonatomic, assign) NSInteger average; //Example: 2.4
@property (nonatomic, assign) NSInteger averageRankingForQuery; //Example: 2
@property (nonatomic, assign) NSInteger statisticId; //Example: 776832
@property (nonatomic, assign) NSInteger memberId; //Example: 3061193
@property (nonatomic, assign) NSInteger averageRanking; //Example: 2
@property (nonatomic, assign) NSInteger total; //Example: 24
@property (nonatomic, assign) NSInteger totalRanking; //Example: 1
@property (nonatomic, weak) NSURL *linkMember;
@property (nonatomic, weak) NSURL *linkStatistic;
@property (nonatomic, weak) NSURL *linkTeam;


-(void)getMemberWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getStatisticWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getTeamWithCompletion:(TSDKArrayCompletionBlock)completion;

@end
