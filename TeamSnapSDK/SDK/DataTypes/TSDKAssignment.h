// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKAssignment : TSDKCollectionObject

@property (nonatomic, strong, nullable) NSString * assignmentDescription; //Example: stuff
@property (nonatomic, strong, nullable) NSString * logoUrl; //Example: **NULL**
@property (nonatomic, assign) NSInteger position; //Example: 1
@property (nonatomic, strong, nullable) NSString * dfpAdUnitId; //Example: <null>
@property (nonatomic, assign) BOOL isEditable; //Example: 1
@property (nonatomic, strong, nullable) NSDate * createdAt; //Example: 2019-11-01T17:25:36Z
@property (nonatomic, assign) BOOL isSponsored; //Example: 0
@property (nonatomic, strong, nullable) NSDate * updatedAt; //Example: 2019-11-01T17:25:36Z
@property (nonatomic, assign) NSInteger managerCreated; //Example: 1
@property (nonatomic, strong, nullable) NSString * teamId; //Example: 1
@property (nonatomic, strong, nullable) NSString * eventId; //Example: 13
@property (nonatomic, strong, nullable) NSString * memberId; //Example: 78
@property (nonatomic, strong, nullable) NSURL * linkMember;
@property (nonatomic, strong, nullable) NSURL * linkMemberAssignment;
@property (nonatomic, strong, nullable) NSURL * linkMemberAssignments;
@property (nonatomic, strong, nullable) NSURL * linkEvent;
@property (nonatomic, strong, nullable) NSURL * linkTeam;


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

