//
//  TSDKContact.h
//  TeamSnapSDK
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKContact : TSDKCollectionObject

@property (nonatomic, assign) BOOL isPushable; //Example: 1
@property (nonatomic, assign) BOOL isInvitable; //Example: 0
@property (nonatomic, weak) NSString *addressCity; //Example:
@property (nonatomic, assign) BOOL isAddressHidden; //Example: 0
@property (nonatomic, weak) NSString *addressZip; //Example:
@property (nonatomic, weak) NSString *invitationCode; //Example: **NULL**
@property (nonatomic, assign) NSInteger memberId; //Example: 993324
@property (nonatomic, weak) NSString *userId; //Example: **NULL**
@property (nonatomic, weak) NSString *addressState; //Example:
@property (nonatomic, weak) NSDate *updatedAt; //Example: 2015-10-30T17:50:41Z
@property (nonatomic, assign) BOOL isAlertable; //Example: 0
@property (nonatomic, weak) NSString *lastName; //Example: Rahaim
@property (nonatomic, assign) BOOL isEmailable; //Example: 0
@property (nonatomic, assign) NSInteger hideAddress; //Example: 0
@property (nonatomic, assign) NSInteger allowSharedAccess; //Example: 0
@property (nonatomic, weak) NSString *label; //Example: Father
@property (nonatomic, weak) NSString *addressStreet1; //Example:
@property (nonatomic, weak) NSString *invitationDeclined; //Example: **NULL**
@property (nonatomic, weak) NSString *addressCountry; //Example:
@property (nonatomic, weak) NSDate *createdAt; //Example: 2012-07-12T03:06:00Z
@property (nonatomic, weak) NSString *addressStreet2; //Example: **NULL**
@property (nonatomic, weak) NSString *firstName; //Example: Jack
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, weak) NSURL *linkMember;
@property (nonatomic, weak) NSURL *linkContactPhoneNumbers;
@property (nonatomic, weak) NSURL *linkTeam;
@property (nonatomic, weak) NSURL *linkContactEmailAddresses;


@end

@interface TSDKContact (ForwardedMethods)

-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberArrayCompletionBlock)completion;
-(void)getContactPhoneNumbersWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKContactPhoneNumberArrayCompletionBlock)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion;
-(void)getContactEmailAddressesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKContactEmailAddressArrayCompletionBlock)completion;


@end

