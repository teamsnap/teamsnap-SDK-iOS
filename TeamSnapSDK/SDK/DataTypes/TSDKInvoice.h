// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

typedef NS_ENUM(NSUInteger, TSDKInvoiceOfflinePaymentMethod) {
    TSDKInvoiceOfflinePaymentMethodCash,
    TSDKInvoiceOfflinePaymentMethodCheck,
};

typedef NS_ENUM(NSUInteger, TSDKInvoiceStatus) {
    TSDKInvoiceStatusOpen,
    TSDKInvoiceStatusPaid,
    TSDKInvoiceStatusCanceled,
    TSDKInvoiceStatusUnknown
};

@protocol TSDKInvoiceProtocol <NSObject>

@property (nonatomic, weak, nullable) NSString * title; //Example: Memorial Tournament
@property (nonatomic, weak, nullable) NSDate * dueAt; //Example: 2018-05-25T00:00:00Z
@property (nonatomic, assign) BOOL isCancelable; //Example: 1
@property (nonatomic, weak, nullable) NSDecimalNumber * paymentAdjustmentsAmount; //Example: 0
@property (nonatomic, weak, nullable) NSString * paymentAdjustmentsAmountWithCurrency; //Example: $0.00
@property (nonatomic, weak, nullable) NSDecimalNumber * amountPaid; //Example: 0
@property (nonatomic, weak, nullable) NSString * amountPaidWithCurrency; //Example: $0.00

- (CGFloat)percentPaid;

- (TSDKInvoiceStatus)invoiceStatus;

@end

@interface TSDKInvoice : TSDKCollectionObject <TSDKInvoiceProtocol>

@property (nonatomic, assign) BOOL isPayableOffline; //Example: 1
@property (nonatomic, strong, nullable) NSDecimalNumber * paymentAdjustmentsAmount; //Example: 0
@property (nonatomic, strong, nullable) NSString * processingFeesCanceledWithCurrency; //Example: $0.00
@property (nonatomic, strong, nullable) NSDecimalNumber * amountRefundedWithProcessingFeesRefunded; //Example: 0
@property (nonatomic, strong, nullable) NSDecimalNumber * processingFeesCanceled; //Example: 0
@property (nonatomic, strong, nullable) NSDate * createdAt; //Example: 2018-03-05T23:39:56Z
@property (nonatomic, strong, nullable) NSString * processingFeesSubTotalWithCurrency; //Example: $0.00
@property (nonatomic, strong, nullable) NSString * teamId; //Example: 3852291
@property (nonatomic, strong, nullable) NSDate * dueAt; //Example: 2018-02-01T08:00:00Z
@property (nonatomic, strong, nullable) NSString * invoiceFrom; //Example: Steph Test League April 2016
@property (nonatomic, assign) BOOL isPayable; //Example: 1
@property (nonatomic, strong, nullable) NSDecimalNumber * amountPaid; //Example: 0
@property (nonatomic, strong, nullable) NSString * divisionId; //Example: 90472
@property (nonatomic, strong, nullable) NSString * processingFeesBilledWithCurrency; //Example: $0.00
@property (nonatomic, strong, nullable) NSString * invoiceDescription; //Example: Your feb dues are overdue
@property (nonatomic, strong, nullable) NSString * uuid; //Example: 82c295b2-20ce-11e8-858a-30e171559d06
@property (nonatomic, strong, nullable) NSDecimalNumber * amountPaidWithProcessingFeesPaid; //Example: 0
@property (nonatomic, strong, nullable) NSDecimalNumber * processingFeesSubTotal; //Example: 0
@property (nonatomic, strong, nullable) NSString * paymentAdjustmentsAmountWithCurrency; //Example: $0.00
@property (nonatomic, strong, nullable) NSDecimalNumber * processingFeesBilled; //Example: 0
@property (nonatomic, strong, nullable) NSDecimalNumber * amountRefunded; //Example: 0
@property (nonatomic, assign) BOOL isCancelable; //Example: 1
@property (nonatomic, strong, nullable) NSString * amountRefundedWithCurrency; //Example: $0.00
@property (nonatomic, strong, nullable) NSString * invoiceTo; //Example: Skyler Seamans
@property (nonatomic, strong, nullable) NSDecimalNumber * total; //Example: 10
@property (nonatomic, strong, nullable) NSString * processingFeesPaidWithCurrency; //Example: $0.00
@property (nonatomic, strong, nullable) NSDecimalNumber * processingFeesPaid; //Example: 0
@property (nonatomic, strong, nullable) NSString * batchInvoiceId; //Example: 3586
@property (nonatomic, assign) NSInteger subTotal; //Example: 10
@property (nonatomic, strong, nullable) NSString * status; //Example: open
@property (nonatomic, assign) BOOL hasPaymentSchedule; //Example: 0
@property (nonatomic, assign) BOOL hasPayments; //Example: 0
@property (nonatomic, strong, nullable) NSString * amountRefundedWithProcessingFeesRefundedWithCurrency; //Example: $0.00
@property (nonatomic, strong, nullable) NSDate * sentAt; //Example: <null>
@property (nonatomic, strong, nullable) NSURL * paymentUrl; //Example: https://go.teamsnap.com/pay_invoice/793e4a19-5aa6-11e8-8534-3ca82a21c0e6
@property (nonatomic, strong, nullable) NSDate * updatedAt; //Example: 2018-05-18T14:19:28Z
@property (nonatomic, strong, nullable) NSString * balanceWithCurrency; //Example: $150.00
@property (nonatomic, strong, nullable) NSString * title; //Example: Memorial Tournament
@property (nonatomic, strong, nullable) NSDecimalNumber * balance; //Example: 10
@property (nonatomic, strong, nullable) NSString * amountPaidWithProcessingFeesPaidWithCurrency; //Example: $0.00
@property (nonatomic, strong, nullable) NSString * subTotalWithCurrency; //Example: $150.00
@property (nonatomic, strong, nullable) NSString * amountPaidWithCurrency; //Example: $0.00
@property (nonatomic, strong, nullable) NSString * totalWithCurrency; //Example: $150.00
@property (nonatomic, assign) NSInteger canPayByPaymentSchedule; //Example: 0
@property (nonatomic, strong, nullable) NSURL * linkInvoiceLineItems;
@property (nonatomic, strong, nullable) NSURL * linkInvoiceRecipients;
@property (nonatomic, strong, nullable) NSURL * linkTeam;
@property (nonatomic, strong, nullable) NSURL * linkBatchInvoice;
@property (nonatomic, strong, nullable) NSURL * linkInvoicePayments;

+ (TSDKInvoiceStatus)invoiceStatusForStatusString:(NSString *)statusString;
+(NSString *_Nonnull)invoiceStatusStringForStatus:(TSDKInvoiceStatus)status;

//Create invoices using batch_invoice as a template for the specified ids.
+ (void)createFromBatchInvoiceId:(NSString *_Nonnull)batchInvoiceId
                    forMembers:(NSArray <NSString *>*_Nonnull)memberIds
                  completion:(TSDKSimpleCompletionBlock _Nullable)completion;

//Cancel invoice. Creates a line item opposite of the invoice balance. If payments have been made sets status to paid. If no payments have been made, sets status to canceled.
+ (void)cancelInvoiceId:(NSString *_Nonnull)invoiceId WithCompletion:(TSDKSimpleCompletionBlock _Nullable)completion;

- (void)cancelWithCompletion:(TSDKSimpleCompletionBlock)completion;

//+(void)querySearchStatus:(NSString *_Nonnull)status pageNumber:(NSString *_Nonnull)pageNumber id:(NSString *_Nonnull)id memberId:(NSString *_Nonnull)memberId userId:(NSString *_Nonnull)userId batchInvoiceId:(NSString *_Nonnull)batchInvoiceId pageSize:(NSString *_Nonnull)pageSize WithCompletion:(TSDKCompletionBlock _Nullable)completion;


// NOT autogenerated
/**
 Returns a float value indicating the percentage of amount paid vs the amount invoiced.
 
 @return A float value indicating the percentage of amount paid vs the amount invoiced.
 */
- (CGFloat)percentPaid;

- (TSDKInvoiceStatus)invoiceStatus;

- (void)makePayment:(NSDecimalNumber * _Nonnull)amount method:(TSDKInvoiceOfflinePaymentMethod)method note:(NSString * _Nullable)note completion:(TSDKSimpleCompletionBlock _Nullable)completion;

@end

@interface TSDKInvoice (ForwardedMethods)

-(void)getInvoiceLineItemsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getInvoiceRecipientsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKInvoiceRecipientArrayCompletionBlock _Nonnull)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nonnull)completion;
-(void)getBatchInvoiceWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKBatchInvoicesArrayCompletionBlock _Nonnull)completion;
-(void)getInvoicePaymentsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKInvoicePaymentsArrayCompletionBlock _Nonnull)completion;

@end

