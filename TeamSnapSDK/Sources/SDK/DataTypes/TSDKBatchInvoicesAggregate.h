// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKBatchInvoicesAggregate : TSDKCollectionObject

@property (nonatomic, strong, nullable) NSString * divisionId; //Example: <null>
@property (nonatomic, strong, nullable) NSString * amountDueWithCurrency; //Example: $750.00
@property (nonatomic, assign) NSInteger openBatchInvoicesCount; //Example: 5
@property (nonatomic, strong, nullable) NSDecimalNumber * amountDue; //Example: 750
@property (nonatomic, strong, nullable) NSString * amountInvoicedWithCurrency; //Example: $750.00
@property (nonatomic, strong, nullable) NSString * teamId; //Example: 3852291
@property (nonatomic, strong, nullable) NSString * amountCollectedWithCurrency; //Example: $0.00
@property (nonatomic, strong, nullable) NSDecimalNumber * amountCollected; //Example: 0
@property (nonatomic, strong, nullable) NSDecimalNumber * amountInvoiced; //Example: 750
@property (nonatomic, strong, nullable) NSURL * linkTeam;

@end

@interface TSDKBatchInvoicesAggregate (ForwardedMethods)

-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nonnull)completion;

@end
