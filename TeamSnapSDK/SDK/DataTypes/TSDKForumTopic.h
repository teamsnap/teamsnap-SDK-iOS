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

@property (nonatomic, weak) NSDate *createdAt; //Example: 2012-05-25T18:19:51Z
@property (nonatomic, weak) NSDate *updatedAt; //Example: 2013-02-08T18:22:04Z
@property (nonatomic, weak) NSString *title; //Example: Test Post
@property (nonatomic, assign) BOOL isAnnouncement; //Example: 0
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, weak) NSURL *linkForumSubscriptions;
@property (nonatomic, weak) NSURL *linkTeam;
@property (nonatomic, weak) NSURL *linkForumPosts;

+(void)addNewTopicWithTitle:(NSString *)title isAnnouncement:(BOOL)isAnnouncement forTeamId:(NSInteger)teamId withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKCompletionBlock)completion;

@end

@interface TSDKForumTopic (ForwardedMethods)

-(void)getForumSubscriptionsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion;
-(void)getForumPostsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKForumPostArrayCompletionBlock)completion;

@end
