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

@property (nonatomic, weak) NSString *_Nullable label; //Example: Home
@property (nonatomic, assign) BOOL isHidden; //Example: 0
@property (nonatomic, weak) NSDate *_Nullable createdAt; //Example: 2012-05-25T18:17:49Z
@property (nonatomic, weak) NSString *_Nullable invitationState; //Example: not_invitable
@property (nonatomic, assign) BOOL isInvited; //Example: 0
@property (nonatomic, assign) BOOL receivesTeamEmails; //Example: 1
@property (nonatomic, weak) NSDate *_Nullable updatedAt; //Example: 2014-08-29T23:49:11Z
@property (nonatomic, weak) NSString *_Nullable invitationCode; //Example: **NULL**
@property (nonatomic, weak) NSString *_Nullable teamId; //Example: 71118
@property (nonatomic, weak) NSString *_Nullable email; //Example: jr@myi40.com
@property (nonatomic, weak) NSString *_Nullable memberId; //Example: 993324
@property (nonatomic, weak) NSURL *_Nullable linkMember;
@property (nonatomic, weak) NSURL *_Nullable linkTeam;


/**
 Deprecated in a future version. Use contact_email_address/invite instead.

 @param memberEmailAddresses The member email address to invite
 @param senderMemberId The sender of the invite
 @param configuration The request configuration, if nil, a standard configuration is used.
 @param completion Completion to be called when action finishes
 */
+(void)actionInvite:(NSArray *_Nonnull)memberEmailAddresses asSenderMemberId:(NSString *_Nonnull)senderMemberId withConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKCompletionBlock _Nullable)completion __attribute__((deprecated));


/**
 Deprecated in a future version. Use contact_email_address/invite instead.

 @param senderMemberId The sender of the invite
 @param configuration The request configuration, if nil, a standard configuration is used.
 @param completion Completion to be called when action finishes
 */
-(void)inviteAsSenderMemberId:(NSString *_Nonnull)senderMemberId withConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKCompletionBlock _Nullable)completion __attribute__((deprecated));

@end

@interface TSDKMemberEmailAddress (ForwardedMethods)

-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberArrayCompletionBlock _Nullable)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration * _Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;


@end

