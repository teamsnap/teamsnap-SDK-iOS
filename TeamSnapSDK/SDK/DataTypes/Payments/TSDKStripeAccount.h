//
//  TSDKStripeAccount.h
//  TeamSnapSDK
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface TSDKStripeAccount : TSDKCollectionObject

@property (nonatomic, strong, nullable) NSString * accountId; //Example: acct_1EsEzZEivZ73zEc7
@property (nonatomic, strong, nullable) NSString * accountDisplayName; //Example: Manny Manager
@property (nonatomic, strong, nullable) NSDate * createdAt; //Example: 2019-07-03T20:23:53Z
@property (nonatomic, strong, nullable) NSString * paymentAccountUrl; //Example: https://staging-payments-api.teamsnap.com/payment_accounts/14
@property (nonatomic, strong, nullable) NSString * userId; //Example: 4
@property (nonatomic, strong, nullable) NSDate * updatedAt; //Example: 2019-07-03T20:23:53Z
@property (nonatomic, strong, nullable) NSString * paymentAccountRequiredFormFieldsUrl; //Example: https://staging-payments-api.teamsnap.com/payment_accounts/14/form_fields

@end

NS_ASSUME_NONNULL_END
