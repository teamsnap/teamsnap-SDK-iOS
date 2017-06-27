//
//  TSDKContactEmailAddress.h
//  TeamSnapSDK
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKObjectsRequest.h"
#import "TSDKMemberEmailAddress.h"

@interface TSDKContactEmailAddress : TSDKMemberEmailAddress

@property (nonatomic, weak) NSString *_Nullable label; //Example:
@property (nonatomic, assign) BOOL isHidden; //Example: 0
@property (nonatomic, weak) NSDate *_Nullable createdAt; //Example: 2016-04-13T23:45:10Z
@property (nonatomic, assign) BOOL receivesTeamEmails; //Example: 0
@property (nonatomic, weak) NSString *_Nullable contactId; //Example: 7252155
@property (nonatomic, weak) NSDate *_Nullable updatedAt; //Example: 2017-05-15T16:17:56Z
@property (nonatomic, weak) NSString *_Nullable teamId; //Example: 859069
@property (nonatomic, weak) NSString *_Nullable email; //Example: contact-7252155-email-address-32403360@example.com
@property (nonatomic, weak) NSString *_Nullable memberId; //Example: 22861914
@property (nonatomic, assign) BOOL isAccepted;
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
