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
@property (nonatomic, strong) NSString *_Nullable statisticId; //Example: 769991
@property (nonatomic, strong) NSNumber *_Nullable value; //Example: 5
@property (nonatomic, strong) NSString *_Nullable memberId; //Example: 3652826
@property (nonatomic, strong) NSString *_Nullable teamId; //Example: 71118
@property (nonatomic, strong) NSString *_Nullable eventId; //Example: 2357548
@property (nonatomic, strong) NSURL *_Nullable linkMember;
@property (nonatomic, strong) NSURL *_Nullable linkStatistic;
@property (nonatomic, strong) NSURL *_Nullable linkEvent;
@property (nonatomic, strong) NSURL *_Nullable linkTeam;

//+(void)actionBulkDeleteStatisticDataWithCompletion:(TSDKCompletionBlock)completion; //(null)
//+(void)actionBulkUpdateStatisticDataWithCompletion:(TSDKCompletionBlock)completion; //(null)

@end

@interface TSDKStatisticDatum (ForwardedMethods)

-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberArrayCompletionBlock _Nullable)completion;
-(void)getStatisticWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKStatisticArrayCompletionBlock _Nullable)completion;
-(void)getEventWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKEventArrayCompletionBlock _Nullable)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;


@end
