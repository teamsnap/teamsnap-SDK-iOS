//
//  TSDKInvoice.m
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 3/6/18.
//  Copyright © 2018 teamsnap. All rights reserved.
//

#import "TSDKInvoice.h"
#import "TSDKInvoicePayment.h"

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

- (void)makePayment:(NSDecimalNumber * _Nonnull)amount method:(TSDKInvoiceOfflinePaymentMethod)method note:(NSString * _Nullable)note completion:(TSDKSimpleCompletionBlock _Nullable)completion {
    TSDKCollectionCommand *command;
    switch (method) {
        case TSDKInvoiceOfflinePaymentMethodCash:
            command = [TSDKInvoicePayment commandForKey:@"pay_offline_cash"];
            break;
        case TSDKInvoiceOfflinePaymentMethodCheck:
            command =[TSDKInvoicePayment commandForKey:@"pay_offline_cash"];
            break;
    }
    
    command.data[@"invoice_id"] = self.objectIdentifier;
    command.data[@"amount"] = [amount stringValue];
    command.data[@"detail"] = note;
    [command executeWithCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
        if (completion) {
            completion(success, error);
        }
    }];
}

@end
