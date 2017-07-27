//
//  TSDKContactEmailAddress.h
//  TeamSnapSDK
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKObjectsRequest.h"
#import "TSDKMemberEmailAddress.h"

@interface TSDKContactEmailAddress : TSDKCollectionObject

@property (nonatomic, weak) NSString *_Nullable label; //Example: **NULL**
@property (nonatomic, assign) BOOL isHidden; //Example: 0
@property (nonatomic, weak) NSDate *_Nullable createdAt; //Example: 2016-08-25T15:14:40Z
@property (nonatomic, assign) BOOL isInvitable; //Example: 1
@property (nonatomic, weak) NSString *_Nullable invitationState; //Example: new
@property (nonatomic, assign) BOOL isInvited; //Example: 1
@property (nonatomic, assign) BOOL isAccepted; //Example: 0
@property (nonatomic, assign) NSInteger receivesTeamEmails; //Example: 0
@property (nonatomic, weak) NSString *_Nullable contactId; //Example: 210077327
@property (nonatomic, weak) NSDate *_Nullable updatedAt; //Example: 2017-07-20T23:30:27Z
@property (nonatomic, weak) NSString *_Nullable invitationCode; //Example: 0b79ddef80a8c334333a41a6
@property (nonatomic, weak) NSString *_Nullable teamId; //Example: 859069
@property (nonatomic, weak) NSString *_Nullable email; //Example: skyler.seamans+off@teamsnap.com
@property (nonatomic, weak) NSString *_Nullable memberId; //Example: 22861914
@property (nonatomic, weak) NSURL *_Nullable linkContact;
@property (nonatomic, weak) NSURL *_Nullable linkMember;
@property (nonatomic, weak) NSURL *_Nullable linkTeam;

+ (void)actionInvite:(NSArray <TSDKContactEmailAddress *> *_Nonnull)contactEmailAddresses withConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKCompletionBlock _Nullable)completion;
- (void)inviteWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKCompletionBlock _Nullable)completion;


@end

@interface TSDKContactEmailAddress (ForwardedMethods)

-(void)getContactWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKContactArrayCompletionBlock _Nonnull)completion;
-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberArrayCompletionBlock _Nonnull)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nonnull)completion;

@end
