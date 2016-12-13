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

@property (nonatomic, weak) NSString *_Nullable averageRankingForQuery; //Example: **NULL**
@property (nonatomic, assign) NSInteger countGamesPlayed; //Example: 0
@property (nonatomic, weak) NSString *_Nullable average; //Example: **NULL**
@property (nonatomic, weak) NSString *_Nullable averageRanking; //Example: **NULL**
@property (nonatomic, weak) NSString *_Nullable totalRankingForQuery; //Example: **NULL**
@property (nonatomic, weak) NSString *_Nullable statisticId; //Example: 776832
@property (nonatomic, weak) NSString *_Nullable total; //Example: **NULL**
@property (nonatomic, weak) NSString *_Nullable teamId; //Example: 153832
@property (nonatomic, weak) NSString *_Nullable totalRanking; //Example: **NULL**
@property (nonatomic, weak) NSString *_Nullable memberId; //Example: 1942977
@property (nonatomic, weak) NSURL *_Nullable linkMember;
@property (nonatomic, weak) NSURL *_Nullable linkStatistic;
@property (nonatomic, weak) NSURL *_Nullable linkTeam;

@end

@interface TSDKMemberStatistic (ForwardedMethods)

-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberArrayCompletionBlock _Nullable)completion;
-(void)getStatisticWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKStatisticArrayCompletionBlock _Nullable)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;

@end
