//
//  TSDKStripeAccount.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 7/8/19.
//  Copyright © 2019 teamsnap. All rights reserved.
//

#import "TSDKStripeAccount.h"

@implementation TSDKStripeAccount

@dynamic accountId, accountDisplayName, createdAt, paymentAccountUrl, userId, updatedAt, paymentAccountRequiredFormFieldsUrl;

+ (NSString *)SDKType {
    return @"stripe_account";
}

@end
