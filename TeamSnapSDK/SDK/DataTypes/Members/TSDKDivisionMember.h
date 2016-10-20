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
@property (nonatomic, weak) NSDate *_Nullable createdAt; //Example: 2016-01-05T22:59:33Z
@property (nonatomic, weak) NSString *_Nullable addressCity; //Example: **NULL**
@property (nonatomic, weak) NSString *_Nullable addressState; //Example: **NULL**
@property (nonatomic, weak) NSString *_Nullable addressZip; //Example: **NULL**
@property (nonatomic, assign) BOOL isLeagueOwner; //Example: 1
@property (nonatomic, weak) NSString *_Nullable addressStreet2; //Example: **NULL**
@property (nonatomic, assign) NSInteger userId; //Example: 2971597
@property (nonatomic, weak) NSString *_Nullable firstName; //Example: Skyler
@property (nonatomic, weak) NSString *_Nullable addressStreet1; //Example: **NULL**
@property (nonatomic, weak) NSString *_Nullable birthday; //Example:
@property (nonatomic, weak) NSDate *_Nullable updatedAt; //Example: 2016-04-26T20:59:16Z
@property (nonatomic, weak) NSString *_Nullable lastName; //Example: Seamans
@property (nonatomic, weak) NSURL *_Nullable linkDivisionContacts;
@property (nonatomic, weak) NSURL *_Nullable linkContactEmailAddresses;
@property (nonatomic, weak) NSURL *_Nullable linkMessageData;
@property (nonatomic, weak) NSURL *_Nullable linkForumPosts;
@property (nonatomic, weak) NSURL *_Nullable linkDivisionMemberPreferences;
@property (nonatomic, weak) NSURL *_Nullable linkMessages;
@property (nonatomic, weak) NSURL *_Nullable linkMemberPreferences;
@property (nonatomic, weak) NSURL *_Nullable linkContactPhoneNumbers;
@property (nonatomic, weak) NSURL *_Nullable linkDivisionContactEmailAddresses;
@property (nonatomic, weak) NSURL *_Nullable linkContacts;
@property (nonatomic, weak) NSURL *_Nullable linkDivisionMemberEmailAddresses;
@property (nonatomic, weak) NSURL *_Nullable linkMemberEmailAddresses;
@property (nonatomic, weak) NSURL *_Nullable linkDivisionMemberPhoneNumbers;
@property (nonatomic, weak) NSURL *_Nullable linkDivisionContactPhoneNumbers;
@property (nonatomic, weak) NSURL *_Nullable linkMemberPhoneNumbers;
@property (nonatomic, weak) NSURL *_Nullable linkUser;

@end

@interface TSDKDivisionMember (ForwardedMethods)

-(void)getDivisionContactsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getContactEmailAddressesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKContactEmailAddressArrayCompletionBlock _Nullable)completion;
-(void)getMessageDataWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getForumPostsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKForumPostArrayCompletionBlock _Nullable)completion;
-(void)getDivisionMemberPreferencesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getMessagesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMessagesArrayCompletionBlock _Nullable)completion;
-(void)getMemberPreferencesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberPreferencesArrayCompletionBlock _Nullable)completion;
-(void)getContactPhoneNumbersWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKContactPhoneNumberArrayCompletionBlock _Nullable)completion;
-(void)getDivisionContactEmailAddressesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getContactsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKContactArrayCompletionBlock _Nullable)completion;
-(void)getDivisionMemberEmailAddressesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getMemberEmailAddressesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberEmailAddressArrayCompletionBlock _Nullable)completion;
-(void)getDivisionMemberPhoneNumbersWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getDivisionContactPhoneNumbersWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getMemberPhoneNumbersWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberPhoneNumberArrayCompletionBlock _Nullable)completion;
-(void)getUserWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKUserArrayCompletionBlock _Nullable)completion;


@end
