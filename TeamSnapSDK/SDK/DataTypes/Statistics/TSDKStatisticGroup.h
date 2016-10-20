//
//  TSDKStatisticGroup.h
//  SDKPlayground
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKStatisticGroup : TSDKCollectionObject

@property (nonatomic, assign) NSInteger position; //Example: 1
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, weak) NSString *_Nullable name; //Example: Offense
@property (nonatomic, weak) NSURL *_Nullable linkTeam;
@property (nonatomic, weak) NSURL *_Nullable linkStatistics;

//+(void)actionReorderStatisticGroupsWithCompletion:(TSDKCompletionBlock)completion; //(null)

@end

@interface TSDKStatisticGroup (ForwardedMethods)

-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;
-(void)getStatisticsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKStatisticArrayCompletionBlock _Nullable)completion;


@end
