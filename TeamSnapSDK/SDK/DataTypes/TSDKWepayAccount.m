//
//  TSDKWepayAccount.m
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 10/1/18.
//  Copyright © 2018 teamsnap. All rights reserved.
//

#import "TSDKWepayAccount.h"

@implementation TSDKWepayAccount

@dynamic userId, isDebitOptedIn, updatedAt, accountName, hasCompletedKyc, wepayDisabledAt, wepayUserId, wepayAccessToken, hasCreatedWepayAccount, wepayAccountId, hasCompletedBankAccount, userFullName,  wepayActionReasons, hasConfirmedEmailAddress, referenceId, createdAt, expiredAt, divisionId, linkUser, linkWepayLogin;

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

+ (void)createWithEmail:(NSString *)email firstName:(NSString *)firstName lastName:(NSString *)lastName accountName:(NSString *)accountName accountDescription:(NSString *)accountDescription teamId:(NSString *)teamId countryCode:(NSString *)countryCode completion:(TSDKWepayAccountCompletionBlock)completion {
    TSDKCollectionCommand *createAccountCommand = [[TSDKCollectionObject commandForClass:@"wepay_accounts" forKey:@"create_with_access"] copy];
    createAccountCommand.data[@"first_name"] = firstName;
    createAccountCommand.data[@"last_name"] = lastName;
    createAccountCommand.data[@"account_name"] = accountName;
    createAccountCommand.data[@"account_description"] = accountDescription;
    createAccountCommand.data[@"email"] = email;
    createAccountCommand.data[@"team_id"] = teamId;
    createAccountCommand.data[@"country_code"] = countryCode;
    
    [createAccountCommand executeWithCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON * _Nullable objects, NSError * _Nullable error) {
        if (success && ([[objects collection] isKindOfClass:[NSArray class]])) {
            NSArray *accounts = [TSDKObjectsRequest SDKObjectsFromCollection:objects];
            TSDKWepayAccount *newAccount;
            
            for(id object in accounts) {
                if([object isKindOfClass:[TSDKWepayAccount class]]) {
                    newAccount = object;
                }
            }
            
            if(newAccount) {
                completion(success, complete, newAccount, error);
            } else {
                completion(success, complete, nil, error);
            }
        } else {
            completion(success, complete, nil, error);
        }
    }];
}

- (void)sendConfirmationWithCompletion:(TSDKCompletionBlock)completion {
    TSDKCollectionCommand *sendConfirmationCommand = [[TSDKCollectionObject commandForClass:@"wepay_accounts" forKey:@"send_confirmation"] copy];
    sendConfirmationCommand.data[@"id"] = self.objectIdentifier;
    [sendConfirmationCommand executeWithCompletion:completion];
}

@end
