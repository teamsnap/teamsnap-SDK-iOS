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

@property (nonatomic, assign) BOOL isInvitable; //Example: 1
@property (nonatomic, weak) NSString *addressCity; //Example: **NULL**
@property (nonatomic, weak) NSString *invitationCode; //Example: **NULL**
@property (nonatomic, weak) NSString *addressZip; //Example: **NULL**
@property (nonatomic, weak) NSString *userId; //Example: **NULL**
@property (nonatomic, assign) NSInteger memberId; //Example: 1943020
@property (nonatomic, weak) NSDate *updatedAt; //Example: 2013-03-19T22:43:00Z
@property (nonatomic, weak) NSString *addressState; //Example: **NULL**
@property (nonatomic, weak) NSString *lastName; //Example: Rahaim
@property (nonatomic, weak) NSString *hideAddress; //Example: **NULL**
@property (nonatomic, weak) NSString *allowSharedAccess; //Example: **NULL**
@property (nonatomic, weak) NSString *label; //Example: Dad
@property (nonatomic, weak) NSString *addressStreet1; //Example: **NULL**
@property (nonatomic, weak) NSString *invitationDeclined; //Example: **NULL**
@property (nonatomic, weak) NSString *addressCountry; //Example: **NULL**
@property (nonatomic, weak) NSDate *createdAt; //Example: 2013-03-19T22:43:00Z
@property (nonatomic, weak) NSString *addressStreet2; //Example: **NULL**
@property (nonatomic, weak) NSString *firstName; //Example: Jason
@property (nonatomic, assign) NSInteger teamId; //Example: 153832
@property (nonatomic, weak) NSURL *linkMember;
@property (nonatomic, weak) NSURL *linkContactPhoneNumbers;
@property (nonatomic, weak) NSURL *linkTeam;
@property (nonatomic, weak) NSURL *linkContactEmailAddresses;


-(void)getMemberWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getContactPhoneNumbersWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getTeamWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getContactEmailAddressesWithCompletion:(TSDKArrayCompletionBlock)completion;

@end
