//
//  BatchInvoice.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 5/17/18.
//  Copyright © 2018 teamsnap. All rights reserved.
//

#import "TSDKBatchInvoice.h"

@implementation TSDKBatchInvoice

@dynamic divisionId, teamId, title, batchInvoiceDescription, status, dueAt, isRecipientPayingTransactionFees, invoicesCount,
    invoicesPaidCount, invoicesUnpaidCount, invoicesPastDueCount, amountPaid, amountPaidWithCurrency, amountDue,
    amountDueWithCurrency, amountInvoiced, amountInvoicedWithCurrency, paymentAdjustmentsAmount,
    paymentAdjustmentsAmountWithCurrency, isCancelable, isDeletable, createdAt, updatedAt, linkBatchInvoiceLineItems,
    linkInvoices, linkDivision, linkTeam;

+ (NSString *)SDKType {
    return @"batch_invoice";
}

@end
