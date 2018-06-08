// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"
#import "TSDKBatchInvoice.h"

@interface TSDKInvoice : TSDKCollectionObject <TSDKInvoiceProtocol>

@property (nonatomic, assign) BOOL isPayableOffline; //Example: 1
@property (nonatomic, assign) NSInteger paymentAdjustmentsAmount; //Example: 0
@property (nonatomic, weak, nullable) NSString * processingFeesCanceledWithCurrency; //Example: $0.00
@property (nonatomic, assign) NSInteger amountRefundedWithProcessingFeesRefunded; //Example: 0
@property (nonatomic, assign) NSInteger processingFeesCanceled; //Example: 0
@property (nonatomic, weak, nullable) NSDate * createdAt; //Example: 2018-05-18T14:19:28Z
@property (nonatomic, weak, nullable) NSString * processingFeesSubTotalWithCurrency; //Example: $0.00
@property (nonatomic, weak, nullable) NSString * teamId; //Example: 3852291
@property (nonatomic, weak, nullable) NSDate * dueAt; //Example: 2018-05-25T00:00:00Z
@property (nonatomic, weak, nullable) NSString * invoiceFrom; //Example: **NULL**
@property (nonatomic, assign) BOOL isPayable; //Example: 1
@property (nonatomic, assign) NSInteger amountPaid; //Example: 0
@property (nonatomic, weak, nullable) NSString * invoiceDescription; //Example: Field fees
@property (nonatomic, weak, nullable) NSString * processingFeesBilledWithCurrency; //Example: $0.00
@property (nonatomic, weak, nullable) NSString * divisionId; //Example: <null>
@property (nonatomic, weak, nullable) NSString * uuid; //Example: 793e4a19-5aa6-11e8-8534-3ca82a21c0e6
@property (nonatomic, assign) NSInteger amountPaidWithProcessingFeesPaid; //Example: 0
@property (nonatomic, assign) NSInteger processingFeesSubTotal; //Example: 0
@property (nonatomic, weak, nullable) NSString * paymentAdjustmentsAmountWithCurrency; //Example: $0.00
@property (nonatomic, assign) NSInteger processingFeesBilled; //Example: 0
@property (nonatomic, assign) NSInteger amountRefunded; //Example: 0
@property (nonatomic, assign) BOOL isCancelable; //Example: 1
@property (nonatomic, weak, nullable) NSString * amountRefundedWithCurrency; //Example: $0.00
@property (nonatomic, weak, nullable) NSString * invoiceTo; //Example: Kirby Ziegler
@property (nonatomic, assign) NSInteger total; //Example: 150
@property (nonatomic, weak, nullable) NSString * processingFeesPaidWithCurrency; //Example: $0.00
@property (nonatomic, assign) NSInteger processingFeesPaid; //Example: 0
@property (nonatomic, weak, nullable) NSString * batchInvoiceId; //Example: 9146
@property (nonatomic, assign) NSInteger subTotal; //Example: 150
@property (nonatomic, weak, nullable) NSString * status; //Example: open
@property (nonatomic, assign) BOOL hasPaymentSchedule; //Example: 0
@property (nonatomic, assign) BOOL hasPayments; //Example: 0
@property (nonatomic, weak, nullable) NSString * amountRefundedWithProcessingFeesRefundedWithCurrency; //Example: $0.00
@property (nonatomic, weak, nullable) NSDate * sentAt; //Example: <null>
@property (nonatomic, weak, nullable) NSURL * paymentUrl; //Example: https://go.teamsnap.com/pay_invoice/793e4a19-5aa6-11e8-8534-3ca82a21c0e6
@property (nonatomic, weak, nullable) NSDate * updatedAt; //Example: 2018-05-18T14:19:28Z
@property (nonatomic, weak, nullable) NSString * balanceWithCurrency; //Example: $150.00
@property (nonatomic, weak, nullable) NSString * title; //Example: Memorial Tournament
@property (nonatomic, assign) NSInteger balance; //Example: 150
@property (nonatomic, weak, nullable) NSString * amountPaidWithProcessingFeesPaidWithCurrency; //Example: $0.00
@property (nonatomic, weak, nullable) NSString * subTotalWithCurrency; //Example: $150.00
@property (nonatomic, weak, nullable) NSString * amountPaidWithCurrency; //Example: $0.00
@property (nonatomic, weak, nullable) NSString * totalWithCurrency; //Example: $150.00
@property (nonatomic, assign) NSInteger canPayByPaymentSchedule; //Example: 0
@property (nonatomic, weak, nullable) NSURL * linkInvoiceLineItems;
@property (nonatomic, weak, nullable) NSURL * linkInvoiceRecipients;
@property (nonatomic, weak, nullable) NSURL * linkTeam;
@property (nonatomic, weak, nullable) NSURL * linkBatchInvoice;
@property (nonatomic, weak, nullable) NSURL * linkInvoicePayments;


//Create invoices using batch_invoice as a template for the specified ids.
//+(void)actionCreateFromBatchInvoiceMemberids:(NSString *_Nonnull)memberIds batchInvoiceId:(NSString *_Nonnull)batchInvoiceId WithCompletion:(TSDKCompletionBlock _Nullable)completion;

//Cancel invoice. Creates a line item opposite of the invoice balance. If payments have been made sets status to paid. If no payments have been made, sets status to canceled.
//+(void)actionCancelId:(NSString *_Nonnull)id WithCompletion:(TSDKCompletionBlock _Nullable)completion;



//+(void)querySearchStatus:(NSString *_Nonnull)status pageNumber:(NSString *_Nonnull)pageNumber id:(NSString *_Nonnull)id memberId:(NSString *_Nonnull)memberId userId:(NSString *_Nonnull)userId batchInvoiceId:(NSString *_Nonnull)batchInvoiceId pageSize:(NSString *_Nonnull)pageSize WithCompletion:(TSDKCompletionBlock _Nullable)completion;


// NOT autogenerated
/**
 Returns a float value indicating the percentage of amount paid vs the amount invoiced.
 
 @return A float value indicating the percentage of amount paid vs the amount invoiced.
 */
- (CGFloat)percentPaid;

- (TSDKInvoiceStatus)invoiceStatus;

@end

@interface TSDKInvoice (ForwardedMethods)

-(void)getInvoiceLineItemsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getInvoiceRecipientsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKInvoiceRecipientArrayCompletionBlock _Nonnull)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nonnull)completion;
-(void)getBatchInvoiceWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKBatchInvoicesArrayCompletionBlock _Nonnull)completion;
-(void)getInvoicePaymentsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;


@end

