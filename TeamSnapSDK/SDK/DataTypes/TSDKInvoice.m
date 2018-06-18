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
    if (self.total == nil) {
        return 100.0;
    }
    if (self.amountPaid == nil) {
        return 0.0;
    }
    CGFloat amountPaidFloat = [self.amountPaid floatValue] ;
    CGFloat totalFloat = [self.total floatValue];
    if (totalFloat <= 0.01) {
        return 100.0;
    }
    
    return amountPaidFloat/totalFloat;
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
