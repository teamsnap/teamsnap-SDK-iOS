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

@property (nonatomic, strong) NSString *_Nullable memberId; //Example: 1943020
@property (nonatomic, strong) NSDate *_Nullable updatedAt; //Example: 2015-08-28T20:21:41Z
@property (nonatomic, strong) NSString *_Nullable forumTopicId; //Example: 2099728
@property (nonatomic, strong) NSURL *_Nullable linkTeam;
@property (nonatomic, strong) NSURL *_Nullable linkMember;
@property (nonatomic, strong) NSURL *_Nullable linkForumTopic;

@end

@interface TSDKForumSubscription (ForwardedMethods)

-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;
-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberArrayCompletionBlock _Nullable)completion;
-(void)getForumTopicWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKForumTopicArrayCompletionBlock _Nullable)completion;

@end
