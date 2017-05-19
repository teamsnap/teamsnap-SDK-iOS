//
//  TSDKContact.h
//  TeamSnapSDK
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"
#import "TSDKMessageRecipient.h"
#import "TSDKMessageSender.h"
#import "TSDKMember.h"

@interface TSDKContact : TSDKCollectionObject <TSDKMessageRecipient, TSDKMessageSender, TSDKMemberOrContactProtocol>

@property (nonatomic, assign) BOOL isPushable; //Example: 1
@property (nonatomic, assign) BOOL isInvitable; //Example: 0
@property (nonatomic, weak) NSString *_Nullable addressCity; //Example:
@property (nonatomic, assign) BOOL isAddressHidden; //Example: 0
@property (nonatomic, weak) NSString *_Nullable addressZip; //Example:
@property (nonatomic, weak) NSString *_Nullable invitationCode; //Example: **NULL**
@property (nonatomic, weak) NSString *_Nullable memberId; //Example: 993324
@property (nonatomic, weak) NSString *_Nullable userId; //Example: **NULL**
@property (nonatomic, weak) NSString *_Nullable addressState; //Example:
@property (nonatomic, weak) NSDate *_Nullable updatedAt; //Example: 2015-10-30T17:50:41Z
@property (nonatomic, assign) BOOL isAlertable; //Example: 0
@property (nonatomic, weak) NSString *_Nullable lastName; //Example: Rahaim
@property (nonatomic, assign) BOOL isEmailable; //Example: 0
@property (nonatomic, assign) BOOL allowSharedAccess; //Example: 0
@property (nonatomic, assign) BOOL isEditable; //Example: 0
@property (nonatomic, weak) NSString *_Nullable label; //Example: Father
@property (nonatomic, weak) NSString *_Nullable addressStreet1; //Example:
@property (nonatomic, weak) NSString *_Nullable invitationDeclined; //Example: **NULL**
@property (nonatomic, weak) NSString *_Nullable addressCountry; //Example:
@property (nonatomic, weak) NSDate *_Nullable createdAt; //Example: 2012-07-12T03:06:00Z
@property (nonatomic, weak) NSString *_Nullable addressStreet2; //Example: **NULL**
@property (nonatomic, weak) NSString *_Nullable firstName; //Example: Jack
@property (nonatomic, weak) NSString *_Nullable teamId; //Example: 71118
@property (nonatomic, assign) BOOL isManager; //Example: 1
@property (nonatomic, assign) BOOL isOwner; //Example: 1
@property (nonatomic, assign) BOOL isCommissioner; //Example: 0
@property (nonatomic, weak) NSURL *_Nullable linkMember;
@property (nonatomic, weak) NSURL *_Nullable linkContactPhoneNumbers;
@property (nonatomic, weak) NSURL *_Nullable linkTeam;
@property (nonatomic, weak) NSURL *_Nullable linkContactEmailAddresses;
@property (nonatomic, weak) NSURL *_Nullable linkMessages;

@end

@interface TSDKContact (ForwardedMethods)

-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberArrayCompletionBlock _Nullable)completion;
-(void)getContactPhoneNumbersWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKContactPhoneNumberArrayCompletionBlock _Nullable)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;
-(void)getContactEmailAddressesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKContactEmailAddressArrayCompletionBlock _Nullable)completion;
-(void)getMessagesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration type:(TSDKMessageType)type completion:(TSDKMessagesArrayCompletionBlock _Nullable)completion;

@end

