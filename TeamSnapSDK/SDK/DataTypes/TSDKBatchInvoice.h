// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"
#import "TSDKMember.h"
#import "TSDKBatchInvoiceLineItem.h"

typedef NS_ENUM(NSUInteger, TSDKInvoiceStatus) {
    TSDKInvoiceStatusOpen,
    TSDKInvoiceStatusPaid,
    TSDKInvoiceStatusCanceled,
    TSDKInvoiceStatusUnknown
};

@class TSDKMember, TSDKBatchInvoiceLineItem, TSDKInvoice;

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

@interface TSDKBatchInvoice : TSDKCollectionObject <TSDKInvoiceProtocol>

@property (nonatomic, assign) BOOL isRecipientPayingTransactionFees; //Example: 1
@property (nonatomic, weak, nullable) NSString * teamId; //Example: 3852291
@property (nonatomic, weak, nullable) NSString * amountInvoicedWithCurrency; //Example: $750.00
@property (nonatomic, weak, nullable) NSString * status; //Example: open
@property (nonatomic, weak, nullable) NSString * title; //Example: Memorial Tournament
@property (nonatomic, assign) BOOL isCancelable; //Example: 1
@property (nonatomic, weak, nullable) NSDecimalNumber * paymentAdjustmentsAmount; //Example: 0
@property (nonatomic, weak, nullable) NSDate * updatedAt; //Example: 2018-05-18T14:19:28Z
@property (nonatomic, weak, nullable) NSString * paymentAdjustmentsAmountWithCurrency; //Example: $0.00
@property (nonatomic, weak, nullable) NSDecimalNumber *invoicesPastDueCount; //Example: 5
@property (nonatomic, assign) BOOL isDeletable; //Example: 0
@property (nonatomic, assign) NSInteger invoicesCount; //Example: 5
@property (nonatomic, weak, nullable) NSDecimalNumber * amountPaid; //Example: 0
@property (nonatomic, weak, nullable) NSDecimalNumber * amountInvoiced; //Example: 750
@property (nonatomic, weak, nullable) NSString * amountPaidWithCurrency; //Example: $0.00
@property (nonatomic, assign) NSInteger invoicesUnpaidCount; //Example: 5
@property (nonatomic, weak, nullable) NSString * amountDueWithCurrency; //Example: $750.00
@property (nonatomic, weak, nullable) NSDecimalNumber * amountDue; //Example: 750
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

+ (void)createInvoicesWithDueDate:(NSDate *_Nonnull)dueDate
                           teamId:(NSString *_Nonnull)teamId
                            title:(NSString *_Nonnull)title
                      description:(NSString *_Nullable)description
                 invoiceLineItems:(NSArray *_Nonnull)invoiceLineItems
                          members:(NSArray *_Nonnull)members
 isRecipientPayingTransactionFees:(BOOL)isRecipientPayingTransactionFees
                       completion:(TSDKBatchInvoiceCreatedBlock _Nullable)completion;

+ (void)cancelInvoiceId:(NSString *_Nonnull)invoiceId completon:(TSDKSimpleCompletionBlock _Nullable)completion;
- (void)cancelWithCompletion:(TSDKSimpleCompletionBlock _Nullable)completion;
- (void)addRecipientsWithMembers:(NSArray <NSString *> *_Nonnull)memberIds completion:(TSDKSimpleCompletionBlock _Nullable)completion;

//+(void)querySearchId:(NSString *_Nonnull)id pageNumber:(NSString *_Nonnull)pageNumber divisionId:(NSString *_Nonnull)divisionId teamId:(NSString *_Nonnull)teamId pageSize:(NSString *_Nonnull)pageSize WithCompletion:(TSDKCompletionBlock _Nullable)completion;


/**
 Returns a float value indicating the percentage of amount paid vs the amount invoiced.

 @return A float value indicating the percentage of amount paid vs the amount invoiced.
 */
- (CGFloat)percentPaid;

- (TSDKInvoiceStatus)invoiceStatus;

@end

@interface TSDKBatchInvoice (ForwardedMethods)

-(void)getInvoicesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getInvoiceRecipientsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nonnull)completion;
-(void)getBatchInvoiceLineItemsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKBatchInvoiceLineItemArrayCompletionBlock _Nonnull)completion;

@end
