// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKAssignment : TSDKCollectionObject

@property (nonatomic, weak) NSString *_Nullable updatedAt; //Example: **NULL**
@property (nonatomic, assign) BOOL isEditable; //Example: 1
@property (nonatomic, weak) NSString *_Nullable createdAt; //Example: **NULL**
@property (nonatomic, assign) NSInteger memberId; //Example: 1282395
@property (nonatomic, assign) BOOL managerCreated; //Example: 1
@property (nonatomic, weak) NSString *_Nullable assignmentDescription; //Example: Chips?
@property (nonatomic, assign) NSInteger eventId; //Example: 2781974
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, weak) NSURL *_Nullable linkMember;
@property (nonatomic, weak) NSURL *_Nullable linkMemberAssignment;
@property (nonatomic, weak) NSURL *_Nullable linkMemberAssignments;
@property (nonatomic, weak) NSURL *_Nullable linkEvent;
@property (nonatomic, weak) NSURL *_Nullable linkTeam;


//+(void)actionSendAssignmentEmailsWithCompletion:(TSDKCompletionBlock)completion; //(null)


@end

@interface TSDKAssignment (ForwardedMethods)

-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberArrayCompletionBlock _Nullable)completion;
-(void)getMemberAssignmentWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberAssignmentArrayCompletionBlock _Nullable)completion;
// The use for this is in question. I have removed it to avoid confusion.
//-(void)getMemberAssignmentsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberAssignmentArrayCompletionBlock)completion;
-(void)getEventWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKEventArrayCompletionBlock _Nullable)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;


@end

