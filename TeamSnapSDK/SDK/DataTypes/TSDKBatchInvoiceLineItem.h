// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"


@interface TSDKBatchInvoiceLineItem : TSDKCollectionObject

@property (nonatomic, assign) NSInteger amount; //Example: 2
@property (nonatomic, assign) NSInteger invoiceCategoryId; //Example: 1
@property (nonatomic, assign) NSInteger quantity; //Example: 1
@property (nonatomic, weak, nullable) NSString * amountWithCurrency; //Example: $2.00
@property (nonatomic, weak, nullable) NSDate * createdAt; //Example: 2018-04-25T20:28:42Z
@property (nonatomic, weak, nullable) NSString * batchInvoiceId; //Example: 7034
@property (nonatomic, weak, nullable) NSString * batchInvoiceLineItemDescription; //Example: Default description
@property (nonatomic, weak, nullable) NSDate * updatedAt; //Example: 2018-04-25T20:28:42Z
@property (nonatomic, weak, nullable) NSURL * linkTeam;
@property (nonatomic, weak, nullable) NSURL * linkBatchInvoice;

@end

@interface TSDKBatchInvoiceLineItem (ForwardedMethods)

-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nonnull)completion;
-(void)getBatchInvoiceWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKBatchInvoicesArrayCompletionBlock _Nonnull)completion;


@end
