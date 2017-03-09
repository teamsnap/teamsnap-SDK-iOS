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

@property (nonatomic, weak) NSDate *_Nullable createdAt; //Example: 2015-02-25T16:52:38Z
@property (nonatomic, weak) NSDate *_Nullable updatedAt; //Example: 2015-02-25T16:52:38Z
@property (nonatomic, weak) NSString *_Nullable name; //Example: Birth Certificate
@property (nonatomic, weak) NSString *_Nullable teamId; //Example: 71118
@property (nonatomic, weak) NSURL *_Nullable linkTeam;
@property (nonatomic, weak) NSURL *_Nullable linkTrackedItemStatuses;

@end

@interface TSDKTrackedItem (ForwardedMethods)

-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;
-(void)getTrackedItemStatusesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTrackedItemStatusArrayCompletionBlock _Nullable)completion;

@end
