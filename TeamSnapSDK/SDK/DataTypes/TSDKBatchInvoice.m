// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKBatchInvoice.h"

@implementation TSDKBatchInvoice

@dynamic isRecipientPayingTransactionFees, teamId, amountInvoicedWithCurrency, status, title, isCancelable, paymentAdjustmentsAmount, updatedAt, paymentAdjustmentsAmountWithCurrency, invoicesPastDueCount, isDeletable, invoicesCount, amountPaid, amountInvoiced, amountPaidWithCurrency, invoicesUnpaidCount, amountDueWithCurrency, amountDue, invoicesPaidCount, createdAt, divisionId, dueAt, batchInvoiceDescription, linkInvoices, linkInvoiceRecipients, linkTeam, linkBatchInvoiceLineItems;

+ (NSString *)SDKType {
    return @"batch_invoice";
}

- (CGFloat)percentPaid {
    CGFloat amountPaidFloat = (CGFloat)self.amountPaid;
    CGFloat amountInvoicedFloat = (CGFloat)self.amountInvoiced;
    return amountPaidFloat/amountInvoicedFloat;
}

- (TSDKBatchInvoiceStatus)invoiceStatus {
    if([[self.status lowercaseString] isEqualToString:[@"open" lowercaseString]]) {
        return TSDKBatchInvoiceStatusOpen;
    } else if([[self.status lowercaseString] isEqualToString:[@"paid" lowercaseString]]) {
        return TSDKBatchInvoiceStatusPaid;
    } else if([[self.status lowercaseString] isEqualToString:[@"canceled" lowercaseString]]) {
        return TSDKBatchInvoiceStatusCanceled;
    } else {
        return TSDKBatchInvoiceStatusUnknown;
    }
}

@end
