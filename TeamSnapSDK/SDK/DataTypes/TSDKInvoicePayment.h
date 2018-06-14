// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKInvoicePayment : TSDKCollectionObject

@property (nonatomic, weak, nullable) NSString * detail; //Example: **NULL**
@property (nonatomic, weak, nullable) NSString * initialPaymentProviderName; //Example: Offline
@property (nonatomic, assign) BOOL isRefundable; //Example: 1
@property (nonatomic, weak, nullable) NSString * initialPaymentProviderId; //Example: 8
@property (nonatomic, assign) NSInteger amount; //Example: 150
@property (nonatomic, weak, nullable) NSString * amountWithCurrency; //Example: $150.00
@property (nonatomic, weak, nullable) NSString * amountWithProcessingFeeWithCurrency; //Example: $150.00
@property (nonatomic, weak, nullable) NSDate * scheduledAt; //Example: <null>
@property (nonatomic, weak, nullable) NSDate * createdAt; //Example: 2018-05-15T16:25:18Z
@property (nonatomic, weak, nullable) NSDate * lastTransactedAt; //Example: 2018-05-15T16:25:18Z
@property (nonatomic, weak, nullable) NSDate * updatedAt; //Example: 2018-05-15T16:25:18Z
@property (nonatomic, weak, nullable) NSString * invoiceId; //Example: 52600
@property (nonatomic, weak, nullable) NSString * status; //Example: paid
@property (nonatomic, assign) NSInteger amountWithProcessingFee; //Example: 150
@property (nonatomic, weak, nullable) NSURL * linkInvoice;
@property (nonatomic, weak, nullable) NSURL * linkTeam;
@property (nonatomic, weak, nullable) NSURL * linkInvoicePaymentTransactions;


//Records a submitted wepay credit card invoice_payment
//+(void)actionPayWepayCreditCardAmount:(NSString *_Nonnull)amount invoiceId:(NSString *_Nonnull)invoiceId creditCardId:(NSString *_Nonnull)creditCardId WithCompletion:(TSDKCompletionBlock _Nullable)completion;

//Creates a payment schedule, submits deposit, and schedules future payments
//+(void)actionPayWithPaymentScheduleWepayCreditCardConfirmdatesamounts:(NSString *_Nonnull)confirmDatesAmounts invoiceId:(NSString *_Nonnull)invoiceId creditCardId:(NSString *_Nonnull)creditCardId WithCompletion:(TSDKCompletionBlock _Nullable)completion;

//Records wepay refunded invoice_payments
//+(void)actionRecordRefundedWepayPaymentAmount:(NSString *_Nonnull)amount refundReason:(NSString *_Nonnull)refundReason wepayProcessingFee:(NSString *_Nonnull)wepayProcessingFee invoicePaymentId:(NSString *_Nonnull)invoicePaymentId teamsnapProcessingFee:(NSString *_Nonnull)teamsnapProcessingFee WithCompletion:(TSDKCompletionBlock _Nullable)completion;

//Records an offline cash refund for an invoice_payment
//+(void)actionRefundOfflineCashAmount:(NSString *_Nonnull)amount invoicePaymentId:(NSString *_Nonnull)invoicePaymentId detail:(NSString *_Nonnull)detail WithCompletion:(TSDKCompletionBlock _Nullable)completion;

//Records wepay pending invoice_payments
//+(void)actionRecordPendingWepayPaymentAmount:(NSString *_Nonnull)amount teamsnapProcessingFee:(NSString *_Nonnull)teamsnapProcessingFee wepayProcessingFee:(NSString *_Nonnull)wepayProcessingFee wepayCheckoutId:(NSString *_Nonnull)wepayCheckoutId invoicePaymentId:(NSString *_Nonnull)invoicePaymentId referenceId:(NSString *_Nonnull)referenceId WithCompletion:(TSDKCompletionBlock _Nullable)completion;

//Records a check payment for an invoice
//+(void)actionPayOfflineCheckAmount:(NSString *_Nonnull)amount invoiceId:(NSString *_Nonnull)invoiceId detail:(NSString *_Nonnull)detail WithCompletion:(TSDKCompletionBlock _Nullable)completion;

//Records an offline check refund for an invoice_payment
//+(void)actionRefundOfflineCheckAmount:(NSString *_Nonnull)amount invoicePaymentId:(NSString *_Nonnull)invoicePaymentId detail:(NSString *_Nonnull)detail WithCompletion:(TSDKCompletionBlock _Nullable)completion;

//Records wepay failed payments
//+(void)actionRecordFailedWepayPaymentErrordescription:(NSString *_Nonnull)errorDescription invoicePaymentId:(NSString *_Nonnull)invoicePaymentId wepayErrorId:(NSString *_Nonnull)wepayErrorId WithCompletion:(TSDKCompletionBlock _Nullable)completion;

//Records a cash payment for an invoice
//+(void)actionPayOfflineCashAmount:(NSString *_Nonnull)amount invoiceId:(NSString *_Nonnull)invoiceId detail:(NSString *_Nonnull)detail WithCompletion:(TSDKCompletionBlock _Nullable)completion;

//Records wepay paid invoice_payments
//+(void)actionRecordPaidWepayPaymentAmount:(NSString *_Nonnull)amount wepayProcessingFee:(NSString *_Nonnull)wepayProcessingFee invoicePaymentId:(NSString *_Nonnull)invoicePaymentId teamsnapProcessingFee:(NSString *_Nonnull)teamsnapProcessingFee WithCompletion:(TSDKCompletionBlock _Nullable)completion;



//+(void)querySearchId:(NSString *_Nonnull)id invoiceId:(NSString *_Nonnull)invoiceId pageNumber:(NSString *_Nonnull)pageNumber pageSize:(NSString *_Nonnull)pageSize WithCompletion:(TSDKCompletionBlock _Nullable)completion;

@end

@interface TSDKInvoicePayment (ForwardedMethods)

-(void)getInvoiceWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKInvoicesArrayCompletionBlock _Nonnull)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nonnull)completion;
-(void)getInvoicePaymentTransactionsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;

@end
