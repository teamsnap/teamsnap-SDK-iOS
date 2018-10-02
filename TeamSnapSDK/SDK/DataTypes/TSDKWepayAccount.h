//
//  TSDKWepayAccount.h
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 10/1/18.
//  Copyright © 2018 teamsnap. All rights reserved.
//

// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

typedef NS_ENUM(NSUInteger, TSDKWePayAccountState) {
    TSDKWePayAccountStateSubmitted,
    TSDKWePayAccountStateActionRequired,
    TSDKWePayAccountStatePending,
    TSDKWePayAccountStateActive,
    TSDKWePayAccountStateDisabled,
    TSDKWePayAccountStateDeleted,
    TSDKWePayAccountStateUnknown
};

@interface TSDKWepayAccount : TSDKCollectionObject

@property (nonatomic, strong, nullable) NSString * userId; //Example: 2971597
@property (nonatomic, assign) BOOL isDebitOptedIn; //Example: 0
@property (nonatomic, strong, nullable) NSDate * updatedAt; //Example: 2018-09-28T15:28:11Z
@property (nonatomic, strong, nullable) NSString * accountName; //Example: Test
@property (nonatomic, assign) BOOL hasCompletedKyc; //Example: 0
@property (nonatomic, strong, nullable) NSDate * wepayDisabledAt; //Example: <null>
@property (nonatomic, strong, nullable) NSString * wepayUserId; //Example: <null>
@property (nonatomic, strong, nullable) NSString * wepayAccessToken; //Example: **NULL**
@property (nonatomic, assign) BOOL hasCreatedWepayAccount; //Example: 1
@property (nonatomic, strong, nullable) NSString * wepayAccountId; //Example: <null>
@property (nonatomic, assign) BOOL hasCompletedBankAccount; //Example: 0
@property (nonatomic, strong, nullable) NSString * wepayActionReasons; //Example: **NULL**
@property (nonatomic, assign) BOOL hasConfirmedEmailAddress; //Example: 0
@property (nonatomic, strong, nullable) NSString * referenceId; //Example: f5d06061-8935-46eb-8cce-30362f572e3c
@property (nonatomic, strong, nullable) NSDate * createdAt; //Example: 2018-09-28T15:28:11Z
@property (nonatomic, strong, nullable) NSDate * expiredAt; //Example: <null>
@property (nonatomic, strong, nullable) NSString * divisionId; //Example: <null>
@property (nonatomic, strong, nullable) NSURL * linkUser;

- (TSDKWePayAccountState)state;


@end

@interface TSDKWepayAccount (ForwardedMethods)

-(void)getUserWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKUserArrayCompletionBlock _Nonnull)completion;

@end
