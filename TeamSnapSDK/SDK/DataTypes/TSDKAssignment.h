// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKAssignment : TSDKCollectionObject

@property (nonatomic, strong) NSString *_Nullable updatedAt; //Example: **NULL**
@property (nonatomic, assign) BOOL isEditable; //Example: 1
@property (nonatomic, assign) NSInteger position; //Example: 1
@property (nonatomic, strong) NSString *_Nullable createdAt; //Example: **NULL**
@property (nonatomic, strong) NSString *_Nullable memberId; //Example: 1282395
@property (nonatomic, assign) BOOL managerCreated; //Example: 1
@property (nonatomic, strong) NSString *_Nullable assignmentDescription; //Example: Chips?
@property (nonatomic, strong) NSString *_Nullable eventId; //Example: 2781974
@property (nonatomic, strong) NSString *_Nullable teamId; //Example: 71118
@property (nonatomic, strong) NSURL *_Nullable linkMember;
@property (nonatomic, strong) NSURL *_Nullable linkMemberAssignment;
@property (nonatomic, strong) NSURL *_Nullable linkMemberAssignments;
@property (nonatomic, strong) NSURL *_Nullable linkEvent;
@property (nonatomic, strong) NSURL *_Nullable linkTeam;


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

