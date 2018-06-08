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

- (TSDKInvoiceStatus)invoiceStatus {
    if([[self.status lowercaseString] isEqualToString:[@"open" lowercaseString]]) {
        return TSDKInvoiceStatusOpen;
    } else if([[self.status lowercaseString] isEqualToString:[@"paid" lowercaseString]]) {
        return TSDKInvoiceStatusPaid;
    } else if([[self.status lowercaseString] isEqualToString:[@"canceled" lowercaseString]]) {
        return TSDKInvoiceStatusCanceled;
    } else {
        return TSDKInvoiceStatusUnknown;
    }
}

@end
