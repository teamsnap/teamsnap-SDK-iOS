// Copyright (c) 2015 TeamSnap. All rights reserved.
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKAssignment : TSDKCollectionObject

@property (nonatomic, weak) NSDate *updatedAt; //Example: 2016-08-16T12:18:23Z
@property (nonatomic, assign) BOOL isEditable; //Example: 1
@property (nonatomic, weak) NSDate *createdAt; //Example: 2016-08-16T12:18:23Z
@property (nonatomic, assign) NSInteger memberId; //Example: 20751997
@property (nonatomic, assign) NSInteger managerCreated; //Example: 1
@property (nonatomic, weak) NSString *assignmentDescription; //Example: Water
@property (nonatomic, assign) NSInteger eventId; //Example: 67576187
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, weak) NSURL *linkMember;
@property (nonatomic, weak) NSURL *linkMemberAssignments;
@property (nonatomic, weak) NSURL *linkEvent;
@property (nonatomic, weak) NSURL *linkTeam;

@end

@interface TSDKAssignment (ForwardedMethods)

-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberArrayCompletionBlock)completion;
-(void)getMemberAssignmentsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getEventWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKEventArrayCompletionBlock)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion;


@end
