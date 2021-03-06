// Copyright (c) 2015 TeamSnap. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKAssignment : TSDKCollectionObject

@property (nonatomic, strong, nullable) NSString * assignmentDescription; //Example: Scorekeeper
@property (nonatomic, strong, nullable) NSString * logoUrl; //Example: https://pod-gatorade.teamsnap.com/images/assignment_sponsorships/scorekeeper.png
@property (nonatomic, assign) NSInteger position; //Example: 3
@property (nonatomic, assign) BOOL isEditable; //Example: 1
@property (nonatomic, strong, nullable) NSDate * createdAt; //Example: 2019-12-02T21:26:07Z
@property (nonatomic, strong, nullable) NSString * adUnitId; //Example: <null>
@property (nonatomic, assign) BOOL isSponsored; //Example: 0
@property (nonatomic, strong, nullable) NSString * analyticLabel; //Example: Gatorade CA
@property (nonatomic, strong, nullable) NSDate * updatedAt; //Example: 2019-12-02T21:26:07Z
@property (nonatomic, assign) BOOL managerCreated; //Example: 1
@property (nonatomic, strong, nullable) NSString * teamId; //Example: 3
@property (nonatomic, strong, nullable) NSString * eventId; //Example: 206
@property (nonatomic, strong, nullable) NSString * memberId; //Example: <null>
@property (nonatomic, strong, nullable) NSURL * linkMember;
@property (nonatomic, strong, nullable) NSURL * linkMemberAssignment;
@property (nonatomic, strong, nullable) NSURL * linkMemberAssignments;
@property (nonatomic, strong, nullable) NSURL * linkEvent;
@property (nonatomic, strong, nullable) NSURL * linkTeam;

//Notifies all members on the team via email regarding upcoming event assignments.
+ (void)actionSendAssignmentEmailsEventids:(NSArray <NSString *> *_Nonnull)eventIds sendingMemberId:(NSString *_Nonnull)sendingMemberId teamId:(NSString *_Nonnull)teamId WithCompletion:(TSDKCompletionBlock _Nullable)completion;

@end

@interface TSDKAssignment (ForwardedMethods)

-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberArrayCompletionBlock _Nonnull)completion;
-(void)getMemberAssignmentWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberAssignmentArrayCompletionBlock _Nonnull)completion;
// The use for this is in question. I have removed it to avoid confusion.
//-(void)getMemberAssignmentsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberAssignmentArrayCompletionBlock _Nonnull)completion;
-(void)getEventWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKEventArrayCompletionBlock _Nonnull)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nonnull)completion;


@end
