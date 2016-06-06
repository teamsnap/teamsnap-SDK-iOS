//
//  TSDKMemberEmailAddress.h
//  TeamSnapSDK
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKMemberEmailAddress : TSDKCollectionObject

@property (nonatomic, weak) NSString *label; //Example: Home
@property (nonatomic, assign) BOOL isHidden; //Example: 0
@property (nonatomic, weak) NSDate *createdAt; //Example: 2012-05-25T18:17:49Z
@property (nonatomic, weak) NSString *invitationState; //Example: not_invitable
@property (nonatomic, assign) BOOL isInvited; //Example: 0
@property (nonatomic, assign) BOOL receivesTeamEmails; //Example: 1
@property (nonatomic, weak) NSDate *updatedAt; //Example: 2014-08-29T23:49:11Z
@property (nonatomic, weak) NSString *invitationCode; //Example: **NULL**
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, weak) NSString *email; //Example: jr@myi40.com
@property (nonatomic, assign) NSInteger memberId; //Example: 993324
@property (nonatomic, weak) NSURL *linkMember;
@property (nonatomic, weak) NSURL *linkTeam;


+(void)actionInvite:(NSArray *)memberEmailAddresses asSenderMemberId:(NSInteger)senderMemberId withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKCompletionBlock)completion;
-(void)inviteAsSenderMemberId:(NSInteger)senderMemberId withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKCompletionBlock)completion;

@end

@interface TSDKMemberEmailAddress (ForwardedMethods)

-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberArrayCompletionBlock)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion;


@end

