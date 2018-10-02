//
//  TSDKWepayAccount.m
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 10/1/18.
//  Copyright © 2018 teamsnap. All rights reserved.
//

#import "TSDKWepayAccount.h"

@implementation TSDKWepayAccount

@dynamic userId, isDebitOptedIn, updatedAt, accountName, hasCompletedKyc, wepayDisabledAt, wepayUserId, wepayAccessToken, hasCreatedWepayAccount, wepayAccountState, wepayAccountId, hasCompletedBankAccount, wepayActionReasons, hasConfirmedEmailAddress, referenceId, createdAt, expiredAt, divisionId, linkUser;

+ (NSString *)SDKType {
    return @"wepay_account";
}

@end
