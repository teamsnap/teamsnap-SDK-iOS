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

@property (nonatomic, weak) NSDate *_Nullable createdAt; //Example: 2012-05-25T18:19:51Z
@property (nonatomic, weak) NSDate *_Nullable updatedAt; //Example: 2013-02-08T18:22:04Z
@property (nonatomic, weak) NSString *_Nullable title; //Example: Test Post
@property (nonatomic, assign) BOOL isAnnouncement; //Example: 0
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, weak) NSURL *_Nullable linkForumSubscriptions;
@property (nonatomic, weak) NSURL *_Nullable linkTeam;
@property (nonatomic, weak) NSURL *_Nullable linkForumPosts;

+(void)addNewTopicWithTitle:(NSString *_Nonnull)title isAnnouncement:(BOOL)isAnnouncement forTeamId:(NSInteger)teamId withConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKCompletionBlock _Nullable)completion;

@end

@interface TSDKForumTopic (ForwardedMethods)

-(void)getForumSubscriptionsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;
-(void)getForumPostsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKForumPostArrayCompletionBlock _Nullable)completion;

@end
