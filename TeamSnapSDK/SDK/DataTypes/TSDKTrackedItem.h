//
//  TSDKTrackedItem.h
//  SDKPlayground
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKTrackedItem : TSDKCollectionObject

@property (nonatomic, weak) NSDate *createdAt; //Example: 2015-02-25T16:52:38Z
@property (nonatomic, weak) NSDate *updatedAt; //Example: 2015-02-25T16:52:38Z
@property (nonatomic, weak) NSString *name; //Example: Birth Certificate
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, weak) NSURL *linkTeam;
@property (nonatomic, weak) NSURL *linkTrackedItemStatuses;

@end

@interface TSDKTrackedItem (ForwardedMethods)

-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion;
-(void)getTrackedItemStatusesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTrackedItemStatusArrayCompletionBlock)completion;

@end
