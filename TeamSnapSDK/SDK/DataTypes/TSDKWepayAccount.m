//
//  TSDKWepayAccount.m
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 10/1/18.
//  Copyright © 2018 teamsnap. All rights reserved.
//

#import "TSDKWepayAccount.h"

@implementation TSDKWepayAccount

@dynamic userId, isDebitOptedIn, updatedAt, accountName, hasCompletedKyc, wepayDisabledAt, wepayUserId, wepayAccessToken, hasCreatedWepayAccount, wepayAccountId, hasCompletedBankAccount, wepayActionReasons, hasConfirmedEmailAddress, referenceId, createdAt, expiredAt, divisionId, linkUser;

+ (NSString *)SDKType {
    return @"wepay_account";
}

- (TSDKWePayAccountState)state {
    NSString *accountState = [self getString:@"wepay_account_state"];
    if([[accountState lowercaseString] isEqualToString:[@"submitted" lowercaseString]]) {
        return TSDKWePayAccountStateSubmitted;
    } else if([[accountState lowercaseString] isEqualToString:[@"action_required" lowercaseString]]) {
        return TSDKWePayAccountStateActionRequired;
    } else if([[accountState lowercaseString] isEqualToString:[@"pending" lowercaseString]]) {
        return TSDKWePayAccountStatePending;
    } else if([[accountState lowercaseString] isEqualToString:[@"active" lowercaseString]]) {
        return TSDKWePayAccountStateActive;
    } else if([[accountState lowercaseString] isEqualToString:[@"disabled" lowercaseString]]) {
        return TSDKWePayAccountStateDisabled;
    } else if([[accountState lowercaseString] isEqualToString:[@"deleted" lowercaseString]]) {
        return TSDKWePayAccountStateDeleted;
    } else {
        return TSDKWePayAccountStateUnknown;
    }
}

@end
