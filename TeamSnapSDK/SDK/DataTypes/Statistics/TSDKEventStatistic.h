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
@property (nonatomic, weak) NSString *_Nullable eventId; //Example: 2357548
@property (nonatomic, weak) NSString *_Nullable teamId; //Example: 71118
@property (nonatomic, assign) NSInteger total; //Example: 5
@property (nonatomic, weak) NSString *_Nullable statisticId; //Example: 769991
@property (nonatomic, weak) NSURL *_Nullable linkEvent;
@property (nonatomic, weak) NSURL *_Nullable linkStatistic;
@property (nonatomic, weak) NSURL *_Nullable linkTeam;

@end

@interface TSDKEventStatistic (ForwardedMethods)

-(void)getEventWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKEventArrayCompletionBlock _Nullable)completion;
-(void)getStatisticWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKStatisticArrayCompletionBlock _Nullable)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;

@end
