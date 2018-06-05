// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
//q#import "TSDKObjectsRequest.h"

typedef NS_ENUM(NSUInteger, TSDKBatchInvoiceStatus) {
    TSDKBatchInvoiceStatusOpen,
    TSDKBatchInvoiceStatusPaid,
    TSDKBatchInvoiceStatusCanceled,
    TSDKBatchInvoiceStatusUnknown
};

@class TSDKMember, TSDKBatchInvoiceLineItem;

@interface TSDKBatchInvoice : TSDKCollectionObject

@property (nonatomic, assign) BOOL isRecipientPayingTransactionFees; //Example: 1
@property (nonatomic, weak, nullable) NSString * teamId; //Example: 3852291
@property (nonatomic, weak, nullable) NSString * amountInvoicedWithCurrency; //Example: $750.00
@property (nonatomic, weak, nullable) NSString * status; //Example: open
@property (nonatomic, weak, nullable) NSString * title; //Example: Memorial Tournament
@property (nonatomic, assign) BOOL isCancelable; //Example: 1
@property (nonatomic, assign) NSInteger paymentAdjustmentsAmount; //Example: 0
@property (nonatomic, weak, nullable) NSDate * updatedAt; //Example: 2018-05-18T14:19:28Z
@property (nonatomic, weak, nullable) NSString * paymentAdjustmentsAmountWithCurrency; //Example: $0.00
@property (nonatomic, assign) NSInteger invoicesPastDueCount; //Example: 5
@property (nonatomic, assign) BOOL isDeletable; //Example: 0
@property (nonatomic, assign) NSInteger invoicesCount; //Example: 5
@property (nonatomic, assign) NSInteger amountPaid; //Example: 0
@property (nonatomic, assign) NSInteger amountInvoiced; //Example: 750
@property (nonatomic, weak, nullable) NSString * amountPaidWithCurrency; //Example: $0.00
@property (nonatomic, assign) NSInteger invoicesUnpaidCount; //Example: 5
@property (nonatomic, weak, nullable) NSString * amountDueWithCurrency; //Example: $750.00
@property (nonatomic, assign) NSInteger amountDue; //Example: 750
@property (nonatomic, assign) NSInteger invoicesPaidCount; //Example: 0
@property (nonatomic, weak, nullable) NSDate * createdAt; //Example: 2018-05-18T14:19:28Z
@property (nonatomic, weak, nullable) NSString * divisionId; //Example: <null>
@property (nonatomic, weak, nullable) NSDate * dueAt; //Example: 2018-05-25T00:00:00Z
@property (nonatomic, weak, nullable) NSString * batchInvoiceDescription; //Example: Field fees
@property (nonatomic, weak, nullable) NSURL * linkInvoices;
@property (nonatomic, weak, nullable) NSURL * linkInvoiceRecipients;
@property (nonatomic, weak, nullable) NSURL * linkTeam;
@property (nonatomic, weak, nullable) NSURL * linkBatchInvoiceLineItems;


//Beta: (This endpoint is subject to change) Cancel batch invoice. Cancels all invoices belonging to batch invoice, as a result sets status on batch invoice to canceled. There must be invoices in order to cancel a batch invoice.
//+(void)actionCancelId:(NSString *_Nonnull)id WithCompletion:(TSDKCompletionBlock _Nullable)completion;

//Beta: (This endpoint is subject to change) Creates a batch invoice and associated batch invoice line items and invoices.
//+(void)actionCreateWithInvoicesDueat:(NSString *_Nonnull)dueAt divisionId:(NSString *_Nullable)divisionId title:(NSString *_Nonnull)title isRecipientPayingTransactionFees:(NSString *_Nonnull)isRecipientPayingTransactionFees teamId:(NSString *_Nullable)teamId description:(NSString *_Nullable)description type:(NSString *_Nonnull)type batchInvoiceLineItems:(NSString *_Nonnull)batchInvoiceLineItems WithCompletion:(TSDKCompletionBlock _Nullable)completion;

+(void)actionCreateWithInvoicesDueat:(NSString *_Nonnull)dueAt teamId:(NSString *_Nonnull)teamId title:(NSString *_Nonnull)title description:(NSString *_Nullable)description type:(NSString *_Nonnull)type invoiceLineItems:(NSArray<TSDKBacthInvoiceLineItem *> *)invoiceLineItems members:(NSArray<TSDKMember *> *)members isRecipientPayingTransactionFees:(NSString *_Nonnull)isRecipientPayingTransactionFees completion:(TSDKCompletionBlock _Nullable)completion;


//+(void)querySearchId:(NSString *_Nonnull)id pageNumber:(NSString *_Nonnull)pageNumber divisionId:(NSString *_Nonnull)divisionId teamId:(NSString *_Nonnull)teamId pageSize:(NSString *_Nonnull)pageSize WithCompletion:(TSDKCompletionBlock _Nullable)completion;


/**
 Returns a float value indicating the percentage of amount paid vs the amount invoiced.

 @return A float value indicating the percentage of amount paid vs the amount invoiced.
 */
- (CGFloat)percentPaid;

- (TSDKBatchInvoiceStatus)invoiceStatus;

@end

@interface TSDKBatchInvoice (ForwardedMethods)

-(void)getInvoicesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getInvoiceRecipientsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nonnull)completion;
-(void)getBatchInvoiceLineItemsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKBatchInvoiceLineItemArrayCompletionBlock _Nonnull)completion;

@end
