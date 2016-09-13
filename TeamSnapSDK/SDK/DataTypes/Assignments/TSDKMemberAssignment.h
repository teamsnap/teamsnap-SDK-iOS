//
//  TSDKMemberAssignment.h
//  SDKDeveloperTools
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKMemberAssignment : TSDKCollectionObject

@property (nonatomic, weak) NSString *updatedAt; //Example: **NULL**
@property (nonatomic, weak) NSString *createdAt; //Example: **NULL**
@property (nonatomic, assign) BOOL managerCreated; //Example: 1
@property (nonatomic, assign) NSInteger assignmentId; //Example: 242266
@property (nonatomic, assign) NSInteger memberId; //Example: 1282395
@property (nonatomic, assign) NSInteger eventId; //Example: 2781974
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, weak) NSURL *linkMember;
@property (nonatomic, weak) NSURL *linkAssignment;
@property (nonatomic, weak) NSURL *linkEvent;
@property (nonatomic, weak) NSURL *linkTeam;


@end

@interface TSDKMemberAssignment (ForwardedMethods)

-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberArrayCompletionBlock)completion;
-(void)getAssignmentWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKAssignmentArrayCompletionBlock)completion;
-(void)getEventWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKEventArrayCompletionBlock)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion;


@end
