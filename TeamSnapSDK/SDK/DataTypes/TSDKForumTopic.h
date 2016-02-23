//
//  TSDKForumTopic.h
//  SDKPlayground
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKForumTopic : TSDKCollectionObject

@property (nonatomic, weak) NSString *title; //Example: Test Post
@property (nonatomic, assign) BOOL isAnnouncement; //Example: 0
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, weak) NSURL *linkForumSubscriptions;
@property (nonatomic, weak) NSURL *linkTeam;
@property (nonatomic, weak) NSURL *linkForumPosts;

+(void)addNewTopicWithTitle:(NSString *)title isAnnouncement:(BOOL)isAnnouncement forTeamId:(NSInteger)teamId withCompletion:(TSDKCompletionBlock)completion;

@end

@interface TSDKForumTopic (ForwardedMethods)

-(void)getForumSubscriptionsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion;
-(void)getForumPostsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKForumPostArrayCompletionBlock)completion;

@end
