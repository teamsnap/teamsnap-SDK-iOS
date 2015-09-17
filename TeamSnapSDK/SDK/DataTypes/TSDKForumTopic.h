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
@property (nonatomic) BOOL isAnnouncement; //Example: 0
@property (nonatomic) NSInteger teamId; //Example: 71118
@property (nonatomic, weak) NSURL *linkForumSubscriptions;
@property (nonatomic, weak) NSURL *linkTeam;
@property (nonatomic, weak) NSURL *linkForumPosts;

@end
