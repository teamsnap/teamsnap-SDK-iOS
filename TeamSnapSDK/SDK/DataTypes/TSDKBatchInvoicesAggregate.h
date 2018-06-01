// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKBatchInvoicesAggregate : TSDKCollectionObject

@property (nonatomic, weak, nullable) NSString * divisionId; //Example: <null>
@property (nonatomic, weak, nullable) NSString * amountDueWithCurrency; //Example: $750.00
@property (nonatomic, assign) NSInteger openBatchInvoicesCount; //Example: 5
@property (nonatomic, assign) NSInteger amountDue; //Example: 750
@property (nonatomic, weak, nullable) NSString * amountInvoicedWithCurrency; //Example: $750.00
@property (nonatomic, weak, nullable) NSString * teamId; //Example: 3852291
@property (nonatomic, weak, nullable) NSString * amountCollectedWithCurrency; //Example: $0.00
@property (nonatomic, assign) NSInteger amountCollected; //Example: 0
@property (nonatomic, assign) NSInteger amountInvoiced; //Example: 750
@property (nonatomic, weak, nullable) NSURL * linkTeam;

@end

@interface TSDKBatchInvoicesAggregate (ForwardedMethods)

-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nonnull)completion;

@end
