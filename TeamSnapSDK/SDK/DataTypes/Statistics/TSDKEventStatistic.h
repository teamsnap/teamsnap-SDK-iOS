//
//  TSDKEventStatistic.h
//  TeamSnapSDK
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKEventStatistic : TSDKCollectionObject

@property (nonatomic, assign) NSInteger totalRankingForQuery; //Example: 1
@property (nonatomic, assign) NSInteger eventId; //Example: 2357548
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, assign) NSInteger total; //Example: 5
@property (nonatomic, assign) NSInteger statisticId; //Example: 769991
@property (nonatomic, weak) NSURL *linkEvent;
@property (nonatomic, weak) NSURL *linkStatistic;
@property (nonatomic, weak) NSURL *linkTeam;

@end

@interface TSDKEventStatistic (ForwardedMethods)

-(void)getEventWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKEventArrayCompletionBlock)completion;
-(void)getStatisticWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKStatisticArrayCompletionBlock)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion;

@end
