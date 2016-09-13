// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKAssignment : TSDKCollectionObject

@property (nonatomic, weak) NSString *updatedAt; //Example: **NULL**
@property (nonatomic, assign) BOOL isEditable; //Example: 1
@property (nonatomic, weak) NSString *createdAt; //Example: **NULL**
@property (nonatomic, assign) NSInteger memberId; //Example: 1282395
@property (nonatomic, assign) BOOL managerCreated; //Example: 1
@property (nonatomic, weak) NSString *assignmentDescription; //Example: Chips?
@property (nonatomic, assign) NSInteger eventId; //Example: 2781974
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, weak) NSURL *linkMember;
@property (nonatomic, weak) NSURL *linkMemberAssignment;
@property (nonatomic, weak) NSURL *linkMemberAssignments;
@property (nonatomic, weak) NSURL *linkEvent;
@property (nonatomic, weak) NSURL *linkTeam;


//+(void)actionSendAssignmentEmailsWithCompletion:(TSDKCompletionBlock)completion; //(null)


@end

@interface TSDKAssignment (ForwardedMethods)

-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberArrayCompletionBlock)completion;
-(void)getMemberAssignmentWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberAssignmentArrayCompletionBlock)completion;
// The use for this is in question. I have removed it to avoid confusion.
//-(void)getMemberAssignmentsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberAssignmentArrayCompletionBlock)completion;
-(void)getEventWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKEventArrayCompletionBlock)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion;


@end

