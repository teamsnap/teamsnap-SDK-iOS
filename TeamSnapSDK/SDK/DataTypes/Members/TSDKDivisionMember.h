//
//  TSDKDivisionMember.h
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 4/26/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"
#import "TSDKMessageRecipient.h"
#import "TSDKMessageSender.h"

@interface TSDKDivisionMember : TSDKCollectionObject <TSDKMessageRecipient, TSDKMessageSender>

@property (nonatomic, assign) BOOL isOwner; //Example: 1
@property (nonatomic, assign) BOOL isCommissioner; //Example: 1
@property (nonatomic, assign) BOOL isManager; //Example: 1
@property (nonatomic, weak) NSDate *createdAt; //Example: 2016-01-05T22:59:33Z
@property (nonatomic, weak) NSString *addressCity; //Example: **NULL**
@property (nonatomic, weak) NSString *addressState; //Example: **NULL**
@property (nonatomic, weak) NSString *addressZip; //Example: **NULL**
@property (nonatomic, assign) BOOL isLeagueOwner; //Example: 1
@property (nonatomic, weak) NSString *addressStreet2; //Example: **NULL**
@property (nonatomic, assign) NSInteger userId; //Example: 2971597
@property (nonatomic, weak) NSString *firstName; //Example: Skyler
@property (nonatomic, weak) NSString *addressStreet1; //Example: **NULL**
@property (nonatomic, weak) NSString *birthday; //Example:
@property (nonatomic, weak) NSDate *updatedAt; //Example: 2016-04-26T20:59:16Z
@property (nonatomic, weak) NSString *lastName; //Example: Seamans
@property (nonatomic, weak) NSURL *linkDivisionContacts;
@property (nonatomic, weak) NSURL *linkContactEmailAddresses;
@property (nonatomic, weak) NSURL *linkMessageData;
@property (nonatomic, weak) NSURL *linkForumPosts;
@property (nonatomic, weak) NSURL *linkDivisionMemberPreferences;
@property (nonatomic, weak) NSURL *linkMessages;
@property (nonatomic, weak) NSURL *linkMemberPreferences;
@property (nonatomic, weak) NSURL *linkContactPhoneNumbers;
@property (nonatomic, weak) NSURL *linkDivisionContactEmailAddresses;
@property (nonatomic, weak) NSURL *linkContacts;
@property (nonatomic, weak) NSURL *linkDivisionMemberEmailAddresses;
@property (nonatomic, weak) NSURL *linkMemberEmailAddresses;
@property (nonatomic, weak) NSURL *linkDivisionMemberPhoneNumbers;
@property (nonatomic, weak) NSURL *linkDivisionContactPhoneNumbers;
@property (nonatomic, weak) NSURL *linkMemberPhoneNumbers;
@property (nonatomic, weak) NSURL *linkUser;

@end

@interface TSDKDivisionMember (ForwardedMethods)

-(void)getDivisionContactsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getContactEmailAddressesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKContactEmailAddressArrayCompletionBlock)completion;
-(void)getMessageDataWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getForumPostsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKForumPostArrayCompletionBlock)completion;
-(void)getDivisionMemberPreferencesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getMessagesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMessagesArrayCompletionBlock)completion;
-(void)getMemberPreferencesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberPreferencesArrayCompletionBlock)completion;
-(void)getContactPhoneNumbersWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKContactPhoneNumberArrayCompletionBlock)completion;
-(void)getDivisionContactEmailAddressesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getContactsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKContactArrayCompletionBlock)completion;
-(void)getDivisionMemberEmailAddressesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getMemberEmailAddressesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberEmailAddressArrayCompletionBlock)completion;
-(void)getDivisionMemberPhoneNumbersWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getDivisionContactPhoneNumbersWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getMemberPhoneNumbersWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberPhoneNumberArrayCompletionBlock)completion;
-(void)getUserWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKUserArrayCompletionBlock)completion;


@end