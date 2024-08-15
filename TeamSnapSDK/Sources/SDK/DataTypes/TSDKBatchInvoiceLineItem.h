// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"


typedef NS_CLOSED_ENUM(NSInteger, TSDKInvoiceCategory) {
    TSDKInvoiceCategoryFee = 1,
    TSDKInvoiceCategoryDues = 2,
    TSDKInvoiceCategoryTournament = 3,
    TSDKInvoiceCategoryUniform = 4,
    TSDKInvoiceCategoryTeamExpense = 5
};

@interface TSDKBatchInvoiceLineItem : TSDKCollectionObject

@property (nonatomic, strong, nullable) NSDecimalNumber * amount; //Example: 2
@property (nonatomic, assign) TSDKInvoiceCategory invoiceCategoryId; //Example: 1
@property (nonatomic, assign) NSInteger quantity; //Example: 1
@property (nonatomic, strong, nullable) NSString * amountWithCurrency; //Example: $2.00
@property (nonatomic, strong, nullable) NSDate * createdAt; //Example: 2018-04-25T20:28:42Z
@property (nonatomic, strong, nullable) NSString * batchInvoiceId; //Example: 7034
@property (nonatomic, strong, nullable) NSString * batchInvoiceLineItemDescription; //Example: Default description
@property (nonatomic, strong, nullable) NSDate * updatedAt; //Example: 2018-04-25T20:28:42Z
@property (nonatomic, strong, nullable) NSURL * linkTeam;
@property (nonatomic, strong, nullable) NSURL * linkBatchInvoice;

@end

@interface TSDKBatchInvoiceLineItem (ForwardedMethods)

-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nonnull)completion;
-(void)getBatchInvoiceWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKBatchInvoicesArrayCompletionBlock _Nonnull)completion;


@end
