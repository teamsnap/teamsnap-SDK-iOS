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
@property (nonatomic, weak) NSString *name; //Example: Offense
@property (nonatomic, weak) NSURL *linkTeam;
@property (nonatomic, weak) NSURL *linkStatistics;

//+(void)actionReorderStatisticGroupsWithCompletion:(TSDKCompletionBlock)completion; //(null)

@end

@interface TSDKStatisticGroup (ForwardedMethods)

-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion;
-(void)getStatisticsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKStatisticArrayCompletionBlock)completion;


@end
