//
//  TSDKTrackedItemStatus.h
//  SDKPlayground
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKTrackedItemStatus : TSDKCollectionObject

@property (nonatomic, weak) NSString *status; //Example: Complete
@property (nonatomic, assign) NSInteger statusCode; //Example: 1
@property (nonatomic, weak) NSDate *createdAt; //Example: 2015-02-25T16:52:48Z
@property (nonatomic, assign) NSInteger memberId; //Example: 10757149
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, weak) NSDate *updatedAt; //Example: 2015-02-25T16:52:48Z
@property (nonatomic, assign) NSInteger trackedItemId; //Example: 286943
@property (nonatomic, weak) NSURL *linkMember;
@property (nonatomic, weak) NSURL *linkTeam;
@property (nonatomic, weak) NSURL *linkTrackedItem;

@end

@interface TSDKTrackedItemStatus (ForwardedMethods)

-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberArrayCompletionBlock)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion;
-(void)getTrackedItemWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTrackedItemArrayCompletionBlock)completion;


@end
