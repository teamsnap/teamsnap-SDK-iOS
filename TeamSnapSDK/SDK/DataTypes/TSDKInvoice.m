//
//  TSDKInvoice.m
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 3/6/18.
//  Copyright © 2018 teamsnap. All rights reserved.
//

#import "TSDKInvoice.h"

@implementation TSDKInvoice

@dynamic isPayableOffline, paymentAdjustmentsAmount, processingFeesCanceledWithCurrency, amountRefundedWithProcessingFeesRefunded, processingFeesCanceled, createdAt, processingFeesSubTotalWithCurrency, teamId, dueAt, invoiceFrom, isPayable, amountPaid, invoiceDescription, processingFeesBilledWithCurrency, divisionId, uuid, amountPaidWithProcessingFeesPaid, processingFeesSubTotal, paymentAdjustmentsAmountWithCurrency, processingFeesBilled, amountRefunded, isCancelable, amountRefundedWithCurrency, invoiceTo, total, processingFeesPaidWithCurrency, processingFeesPaid, batchInvoiceId, subTotal, status, hasPaymentSchedule, hasPayments, amountRefundedWithProcessingFeesRefundedWithCurrency, sentAt, paymentUrl, updatedAt, balanceWithCurrency, title, balance, amountPaidWithProcessingFeesPaidWithCurrency, subTotalWithCurrency, amountPaidWithCurrency, totalWithCurrency, canPayByPaymentSchedule, linkInvoiceLineItems, linkInvoiceRecipients, linkTeam, linkBatchInvoice, linkInvoicePayments;

+ (NSString *)SDKType {
    return @"invoice";
}

- (CGFloat)percentPaid {
    CGFloat amountPaidFloat = (CGFloat)self.amountPaid;
    CGFloat amountTotal = (CGFloat)self.total;
    return amountPaidFloat/amountTotal;
}

@end
