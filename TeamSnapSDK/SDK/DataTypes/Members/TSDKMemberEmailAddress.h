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

@property (nonatomic, assign) NSInteger teamId; //Example: 153832
@property (nonatomic, weak) NSDate *updatedAt; //Example: 2015-06-22T15:03:54Z
@property (nonatomic, assign) NSInteger receivesTeamEmails; //Example: 1
@property (nonatomic, weak) NSDate *createdAt; //Example: 2013-03-19T22:36:41Z
@property (nonatomic, weak) NSString *email; //Example: Jason@jasonr.com
@property (nonatomic, assign) BOOL isHidden; //Example: 0
@property (nonatomic, weak) NSString *label; //Example:
@property (nonatomic, weak) NSString *invitationState; // Example: complete, new
@property (nonatomic, assign) NSInteger memberId; //Example: 1943020
@property (nonatomic, assign) BOOL isInvited; //Example: 0
@property (nonatomic, weak) NSURL *linkMember;
@property (nonatomic, weak) NSURL *linkTeam;

+(void)actionInvite:(TSDKMemberEmailAddress *)memberEmailAddress asSenderMemberId:(NSInteger)senderMemberId withCompletion:(TSDKCompletionBlock)completion;
-(void)inviteAsSenderMemberId:(NSInteger)senderMemberId withCompletion:(TSDKCompletionBlock)completion;
@end

@interface TSDKMemberEmailAddress(ForwardedMethods)

-(void)getMemberWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getTeamWithCompletion:(TSDKArrayCompletionBlock)completion;

@end
