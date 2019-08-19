//
//  TSDKInvoicePayment.m
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 6/12/18.
//  Copyright © 2018 teamsnap. All rights reserved.
//

#import "TSDKInvoicePayment.h"

@implementation TSDKInvoicePayment

@dynamic detail, initialPaymentProviderName, isRefundable, isRefundableOnline, initialPaymentProviderId, amount, amountWithCurrency, amountWithProcessingFeeWithCurrency, processingFeeWithCurrency, scheduledAt, createdAt, lastTransactedAt, updatedAt, invoiceId, status, amountWithProcessingFee, linkInvoice, linkTeam, linkInvoicePaymentTransactions;

+ (NSString *)SDKType {
    return @"invoice_payment";
}

- (void)refundAmount:(NSDecimalNumber *_Nonnull)amount refundMethod:(TSDKInvoiceRefundMethod)refundMethod detail:(NSString *_Nonnull)detail WithCompletion:(TSDKCompletionBlock _Nullable)completion {
    TSDKCollectionCommand *refundCommand;
    switch (refundMethod) {
        case TSDKInvoiceRefundMethodCash:
            refundCommand = [TSDKInvoicePayment commandForKey:@"refund_offline_cash"];
            refundCommand.data[@"amount"] = [amount stringValue];
            break;
            
        case TSDKInvoiceRefundMethodCheck:
            refundCommand = [TSDKInvoicePayment commandForKey:@"refund_offline_check"];
            refundCommand.data[@"amount"] = [amount stringValue];
            break;
        
        case TSDKInvoiceRefundMethodCard:
            refundCommand = [TSDKInvoicePayment commandForKey:@"refund_online_payment"];
            // refund on-line payment doesn't take an amount. It's full refunds only as of 8/19
            //TODO: Refund Card
            break;
    }
    refundCommand.data[@"detail"] = detail;
    refundCommand.data[@"invoice_payment_id"] = self.objectIdentifier;
    [refundCommand executeWithCompletion:completion];
}

@end
