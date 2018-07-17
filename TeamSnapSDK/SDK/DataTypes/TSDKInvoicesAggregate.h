// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKInvoicesAggregate : TSDKCollectionObject

@property (nonatomic, strong, nullable) NSDecimalNumber * openInvoicesBalance; //Example: 368
@property (nonatomic, strong, nullable) NSString * openInvoicesBalanceWithCurrency; //Example: $368.00
@property (nonatomic, strong, nullable) NSString * userId; //Example: 2971597
@property (nonatomic, strong, nullable) NSURL * linkUsers;

@end

@interface TSDKInvoicesAggregate (ForwardedMethods)

-(void)getUsersWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKUserArrayCompletionBlock _Nonnull)completion;

@end
