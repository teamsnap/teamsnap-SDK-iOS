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
@property (nonatomic, strong) NSString *_Nullable addressCity; //Example:
@property (nonatomic, assign) BOOL isAddressHidden; //Example: 0
@property (nonatomic, strong) NSString *_Nullable addressZip; //Example:
@property (nonatomic, strong) NSString *_Nullable invitationCode; //Example: **NULL**
@property (nonatomic, strong) NSString *_Nullable memberId; //Example: 993324
@property (nonatomic, strong) NSString *_Nullable userId; //Example: **NULL**
@property (nonatomic, strong, nullable) NSString * userFirstName; //Example: **Bob**
@property (nonatomic, strong, nullable) NSString * userLastName; //Example: **Loblaw**
@property (nonatomic, strong) NSString *_Nullable addressState; //Example:
@property (nonatomic, strong) NSDate *_Nullable updatedAt; //Example: 2015-10-30T17:50:41Z
@property (nonatomic, assign) BOOL isAlertable; //Example: 0
@property (nonatomic, strong) NSString *_Nullable lastName; //Example: Rahaim
@property (nonatomic, assign) BOOL isEmailable; //Example: 0
@property (nonatomic, assign) BOOL allowSharedAccess; //Example: 0
@property (nonatomic, assign) BOOL isEditable; //Example: 0
@property (nonatomic, assign) BOOL isDeletable; //Example: 0
@property (nonatomic, strong) NSString *_Nullable label; //Example: Father
@property (nonatomic, strong) NSString *_Nullable addressStreet1; //Example:
@property (nonatomic, strong) NSString *_Nullable invitationDeclined; //Example: **NULL**
@property (nonatomic, strong) NSString *_Nullable addressCountry; //Example:
@property (nonatomic, strong) NSDate *_Nullable createdAt; //Example: 2012-07-12T03:06:00Z
@property (nonatomic, strong) NSString *_Nullable addressStreet2; //Example: **NULL**
@property (nonatomic, strong) NSString *_Nullable firstName; //Example: Jack
@property (nonatomic, strong) NSString *_Nullable teamId; //Example: 71118
@property (nonatomic, assign) BOOL isManager; //Example: 1
@property (nonatomic, assign) BOOL isOwner; //Example: 1
@property (nonatomic, assign) BOOL isCommissioner; //Example: 0
@property (nonatomic, assign) BOOL isLeagueOwner; //Example: 0
@property (nonatomic, assign) NSInteger emailLimit; //Example: 10, the max number of emails that can be added
@property (nonatomic, assign) NSInteger position; //Example: 1, a sorting position for displaying Contacts in a list
@property (nonatomic, assign) BOOL showName; //Example: YES, a flag for displaying a name with a Contact.
@property (nonatomic, strong) NSURL *_Nullable linkMember;
@property (nonatomic, strong) NSURL *_Nullable linkContactPhoneNumbers;
@property (nonatomic, strong) NSURL *_Nullable linkTeam;
@property (nonatomic, strong) NSURL *_Nullable linkContactEmailAddresses;
@property (nonatomic, strong) NSURL *_Nullable linkMessages;

@end

@interface TSDKContact (ForwardedMethods)

-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberArrayCompletionBlock _Nullable)completion;
-(void)getContactPhoneNumbersWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKContactPhoneNumberArrayCompletionBlock _Nullable)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;
-(void)getContactEmailAddressesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKContactEmailAddressArrayCompletionBlock _Nullable)completion;
-(void)getMessagesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration type:(TSDKMessageType)type completion:(TSDKMessagesArrayCompletionBlock _Nullable)completion;
- (void)getMessageWithId:(NSString *_Nonnull)messageId withConfiguration:(TSDKRequestConfiguration *_Nonnull)configuration completion:(void (^_Nonnull)(TSDKMessage * _Nullable))completion;

@end

