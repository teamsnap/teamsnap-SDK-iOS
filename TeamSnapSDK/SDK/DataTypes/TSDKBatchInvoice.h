//
//  BatchInvoice.h
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 5/17/18.
//  Copyright © 2018 teamsnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKBatchInvoice : TSDKCollectionObject

@property (nonatomic, weak, nullable) NSString * divisionId;
@property (nonatomic, weak, nullable) NSString * teamId;
@property (nonatomic, weak, nullable) NSString * title;
@property (nonatomic, weak, nullable) NSString * batchInvoiceDescription;
@property (nonatomic, weak, nullable) NSString * status;
@property (nonatomic, weak, nullable) NSDate * dueAt;
@property (nonatomic, assign) BOOL isRecipientPayingTransactionFees;
@property (nonatomic, assign) NSInteger invoicesCount;
@property (nonatomic, assign) NSInteger invoicesPaidCount;
@property (nonatomic, assign) NSInteger invoicesUnpaidCount;
@property (nonatomic, assign) NSInteger invoicesPastDueCount;
@property (nonatomic, assign) CGFloat amountPaid;
@property (nonatomic, weak, nullable) NSString * amountPaidWithCurrency;
@property (nonatomic, assign) CGFloat amountDue;
@property (nonatomic, weak, nullable) NSString *amountDueWithCurrency;
@property (nonatomic, assign) CGFloat amountInvoiced;
@property (nonatomic, weak, nullable) NSString * amountInvoicedWithCurrency;
@property (nonatomic, assign) CGFloat paymentAdjustmentsAmount;
@property (nonatomic, weak, nullable) NSString * paymentAdjustmentsAmountWithCurrency;
@property (nonatomic, assign) BOOL isCancelable;
@property (nonatomic, assign) BOOL isDeletable;
@property (nonatomic, weak, nullable) NSDate * createdAt;
@property (nonatomic, weak, nullable) NSDate * updatedAt;
@property (nonatomic, weak, nullable) NSDate * linkBatchInvoiceLineItems;
@property (nonatomic, weak, nullable) NSDate * linkInvoices;
@property (nonatomic, weak, nullable) NSDate * linkDivision;
@property (nonatomic, weak, nullable) NSDate * linkTeam;

//+(void)actionCancelId:(NSString *_Nonnull)id WithCompletion:(TSDKCompletionBlock _Nullable)completion;

@end
