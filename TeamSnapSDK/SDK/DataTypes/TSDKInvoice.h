//// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKInvoice : TSDKCollectionObject

@property (nonatomic, assign) NSInteger paymentAdjustmentsAmount; //Example: 0
@property (nonatomic, weak, nullable) NSString * processingFeesCanceledWithCurrency; //Example: $0.00
@property (nonatomic, assign) NSInteger amountRefundedWithProcessingFeesRefunded; //Example: 0
@property (nonatomic, assign) NSInteger processingFeesCanceled; //Example: 0
@property (nonatomic, weak, nullable) NSDate * createdAt; //Example: 2018-03-05T23:39:56Z
@property (nonatomic, weak, nullable) NSString * processingFeesSubTotalWithCurrency; //Example: $0.00
@property (nonatomic, weak, nullable) NSDate * dueAt; //Example: 2018-02-01T08:00:00Z
@property (nonatomic, weak, nullable) NSString * invoiceFrom; //Example: Steph Test League April 2016
@property (nonatomic, assign) NSInteger amountPaid; //Example: 0
@property (nonatomic, weak, nullable) NSString * divisionId; //Example: 90472
@property (nonatomic, weak, nullable) NSString * processingFeesBilledWithCurrency; //Example: $0.00
@property (nonatomic, weak, nullable) NSString * invoiceDescription; //Example: Your feb dues are overdue
@property (nonatomic, weak, nullable) NSString * uuid; //Example: 82c295b2-20ce-11e8-858a-30e171559d06
@property (nonatomic, assign) NSInteger amountPaidWithProcessingFeesPaid; //Example: 0
@property (nonatomic, assign) NSInteger processingFeesSubTotal; //Example: 0
@property (nonatomic, weak, nullable) NSString * paymentAdjustmentsAmountWithCurrency; //Example: $0.00
@property (nonatomic, assign) NSInteger processingFeesBilled; //Example: 0
@property (nonatomic, assign) NSInteger amountRefunded; //Example: 0
@property (nonatomic, assign) BOOL isCancelable; //Example: 1
@property (nonatomic, weak, nullable) NSString * amountRefundedWithCurrency; //Example: $0.00
@property (nonatomic, weak, nullable) NSString * invoiceTo; //Example: Skyler Seamans
@property (nonatomic, assign) NSInteger total; //Example: 10
@property (nonatomic, weak, nullable) NSString * processingFeesPaidWithCurrency; //Example: $0.00
@property (nonatomic, assign) NSInteger processingFeesPaid; //Example: 0
@property (nonatomic, weak, nullable) NSString * batchInvoiceId; //Example: 3586
@property (nonatomic, assign) NSInteger subTotal; //Example: 10
@property (nonatomic, weak, nullable) NSString * status; //Example: open
@property (nonatomic, weak, nullable) NSURL * paymentUrl; //Example: https://go.teamsnap.com/pay_invoice/82c295b2-20ce-11e8-858a-30e171559d06
@property (nonatomic, weak, nullable) NSString * amountRefundedWithProcessingFeesRefundedWithCurrency; //Example: $0.00
@property (nonatomic, weak, nullable) NSDate * sentAt; //Example: <null>
@property (nonatomic, weak, nullable) NSDate * updatedAt; //Example: 2018-03-05T23:39:56Z
@property (nonatomic, weak, nullable) NSString * balanceWithCurrency; //Example: $10.00
@property (nonatomic, assign) NSInteger balance; //Example: 10
@property (nonatomic, weak, nullable) NSString * amountPaidWithProcessingFeesPaidWithCurrency; //Example: $0.00
@property (nonatomic, weak, nullable) NSString * title; //Example: February Dues
@property (nonatomic, weak, nullable) NSString * subTotalWithCurrency; //Example: $10.00
@property (nonatomic, weak, nullable) NSString * amountPaidWithCurrency; //Example: $0.00
@property (nonatomic, weak, nullable) NSString * totalWithCurrency; //Example: $10.00
@property (nonatomic, weak, nullable) NSURL * linkDivision;
@property (nonatomic, weak, nullable) NSURL * linkInvoiceLineItems;
@property (nonatomic, weak, nullable) NSURL * linkInvoiceRecipients;
@property (nonatomic, weak, nullable) NSURL * linkBatchInvoice;
@property (nonatomic, weak, nullable) NSURL * linkInvoicePayments;


//Create invoices using batch_invoice as a template for the specified ids.
//+(void)actionCreateFromBatchInvoiceMemberids:(NSString *_Nonnull)memberIds batchInvoiceId:(NSString *_Nonnull)batchInvoiceId WithCompletion:(TSDKCompletionBlock _Nullable)completion;

//Cancel invoice. Creates a line item opposite of the invoice balance. If payments have been made sets status to paid. If no payments have been made, sets status to canceled.
//+(void)actionCancelId:(NSString *_Nonnull)id WithCompletion:(TSDKCompletionBlock _Nullable)completion;



//+(void)querySearchStatus:(NSString *_Nonnull)status id:(NSString *_Nonnull)id pageSize:(NSString *_Nonnull)pageSize userId:(NSString *_Nonnull)userId pageNumber:(NSString *_Nonnull)pageNumber batchInvoiceId:(NSString *_Nonnull)batchInvoiceId WithCompletion:(TSDKCompletionBlock _Nullable)completion;

@end


@interface TSDKInvoice (ForwardedMethods)

-(void)getDivisionWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getInvoiceLineItemsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getInvoiceRecipientsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getBatchInvoiceWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getInvoicePaymentsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;


@end

