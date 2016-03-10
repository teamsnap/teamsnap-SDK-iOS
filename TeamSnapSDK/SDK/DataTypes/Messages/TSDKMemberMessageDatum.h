// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKMemberMessageDatum : TSDKCollectionObject

@property (nonatomic, assign) NSInteger userId; //Example: 7
@property (nonatomic, assign) NSInteger teamId; //Example: 11
@property (nonatomic, assign) NSInteger unreadCount; //Example: 0
@property (nonatomic, weak) NSURL *linkTeam;
@property (nonatomic, weak) NSURL *linkUser;

@end

@interface TSDKMemberMessageDatum (ForwardedMethods)

-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion;
-(void)getUserWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKUserArrayCompletionBlock)completion;

@end