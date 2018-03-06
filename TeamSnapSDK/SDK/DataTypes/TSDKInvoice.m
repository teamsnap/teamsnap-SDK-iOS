//
//  TSDKInvoice.m
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 3/6/18.
//  Copyright © 2018 teamsnap. All rights reserved.
//

#import "TSDKInvoice.h"

@implementation TSDKInvoice

@dynamic paymentAdjustmentsAmount, processingFeesCanceledWithCurrency, amountRefundedWithProcessingFeesRefunded, processingFeesCanceled, createdAt, processingFeesSubTotalWithCurrency, dueAt, invoiceFrom, amountPaid, divisionId, processingFeesBilledWithCurrency, invoiceDescription, uuid, amountPaidWithProcessingFeesPaid, processingFeesSubTotal, paymentAdjustmentsAmountWithCurrency, processingFeesBilled, amountRefunded, isCancelable, amountRefundedWithCurrency, invoiceTo, total, processingFeesPaidWithCurrency, processingFeesPaid, batchInvoiceId, subTotal, status, paymentUrl, amountRefundedWithProcessingFeesRefundedWithCurrency, sentAt, updatedAt, balanceWithCurrency, balance, amountPaidWithProcessingFeesPaidWithCurrency, title, subTotalWithCurrency, amountPaidWithCurrency, totalWithCurrency, linkDivision, linkInvoiceLineItems, linkInvoiceRecipients, linkBatchInvoice, linkInvoicePayments;

+ (NSString *)SDKType {
    return @"invoice";
}

@end
