//
//  TSDKForumPost.h
//  SDKPlayground
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKForumPost : TSDKCollectionObject

@property (nonatomic, assign) BOOL wasBroadcasted; //Example: **NULL**
@property (nonatomic, weak) NSDate *_Nullable createdAt; //Example: 2012-05-25T18:19:51Z
@property (nonatomic, weak) NSString *_Nullable posterName; //Example: Jason R
@property (nonatomic, weak) NSString *_Nullable message; //Example: <p>This is a test post!</p>
@property (nonatomic, weak) NSString *_Nullable memberId; //Example: 993324
@property (nonatomic, weak) NSString *_Nullable teamId; //Example: 71118
@property (nonatomic, weak) NSString *_Nullable forumTopicId; //Example: 611875
@property (nonatomic, weak) NSString *_Nullable divisionMemberId; //Example: **NULL**
@property (nonatomic, weak) NSDate *_Nullable updatedAt; //Example: 2013-02-08T18:22:04Z
@property (nonatomic, weak) NSURL *_Nullable linkMember;
@property (nonatomic, weak) NSURL *_Nullable linkForumTopic;
@property (nonatomic, weak) NSURL *_Nullable linkTeam;
@property (nonatomic, weak) NSURL *_Nullable linkDivisionMember;

+ (void)savePost:(TSDKForumPost *_Nonnull)post broadcastToTeam:(BOOL)broadcastToTeam completion:(TSDKSaveCompletionBlock _Nullable)completion;

@end

@interface TSDKForumPost (ForwardedMethods)

-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberArrayCompletionBlock _Nullable)completion;
-(void)getForumTopicWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKForumTopicArrayCompletionBlock _Nullable)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;
-(void)getDivisionMemberWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;

@end
