//
//  TSDKStatisticDatum.h
//  SDKPlayground
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKStatisticDatum : TSDKCollectionObject

@property (nonatomic, assign) NSInteger ranking; //Example: 1
@property (nonatomic, assign) NSInteger statisticId; //Example: 769991
@property (nonatomic, assign) NSInteger value; //Example: 5
@property (nonatomic, assign) NSInteger memberId; //Example: 3652826
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, assign) NSInteger eventId; //Example: 2357548
@property (nonatomic, weak) NSURL *linkMember;
@property (nonatomic, weak) NSURL *linkStatistic;
@property (nonatomic, weak) NSURL *linkEvent;
@property (nonatomic, weak) NSURL *linkTeam;

//+(void)actionBulkDeleteStatisticDataWithCompletion:(TSDKCompletionBlock)completion; //(null)
//+(void)actionBulkUpdateStatisticDataWithCompletion:(TSDKCompletionBlock)completion; //(null)

@end

@interface TSDKStatisticDatum (ForwardedMethods)

-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberArrayCompletionBlock)completion;
-(void)getStatisticWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKStatisticArrayCompletionBlock)completion;
-(void)getEventWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKEventArrayCompletionBlock)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion;


@end
