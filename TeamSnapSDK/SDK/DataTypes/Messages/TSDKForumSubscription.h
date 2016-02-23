//
//  TSDKForumSubscription.h
//  TeamSnapSDK
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKForumSubscription : TSDKCollectionObject

@property (nonatomic, assign) NSInteger memberId; //Example: 1943020
@property (nonatomic, weak) NSDate *updatedAt; //Example: 2015-08-28T20:21:41Z
@property (nonatomic, assign) NSInteger forumTopicId; //Example: 2099728
@property (nonatomic, weak) NSURL *linkTeam;
@property (nonatomic, weak) NSURL *linkMember;
@property (nonatomic, weak) NSURL *linkForumTopic;

@end

@interface TSDKForumSubscription (ForwardedMethods)

-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion;
-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberArrayCompletionBlock)completion;
-(void)getForumTopicWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKForumTopicArrayCompletionBlock)completion;

@end