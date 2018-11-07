//
//  TSDKInvoicePayment.m
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 6/12/18.
//  Copyright © 2018 teamsnap. All rights reserved.
//

#import "TSDKInvoicePayment.h"

@implementation TSDKInvoicePayment

@dynamic detail, initialPaymentProviderName, isRefundable, initialPaymentProviderId, amount, amountWithCurrency, amountWithProcessingFeeWithCurrency, processingFeeWithCurrency, scheduledAt, createdAt, lastTransactedAt, updatedAt, invoiceId, status, amountWithProcessingFee, linkInvoice, linkTeam, linkInvoicePaymentTransactions;

+ (NSString *)SDKType {
    return @"invoice_payment";
}

- (void)refundAmount:(NSDecimalNumber *_Nonnull)amount refundMethod:(TSDKInvoiceOfflinePaymentMethod)refundMethod detail:(NSString *_Nonnull)detail WithCompletion:(TSDKCompletionBlock _Nullable)completion {
    TSDKCollectionCommand *refundCommand;
    switch (refundMethod) {
        case TSDKInvoiceOfflinePaymentMethodCash:
            refundCommand = [TSDKInvoicePayment commandForKey:@"refund_offline_cash"];
            break;
            
        case TSDKInvoiceOfflinePaymentMethodCheck:
            refundCommand = [TSDKInvoicePayment commandForKey:@"refund_offline_check"];
            break;
    }
    refundCommand.data[@"amount"] = [amount stringValue];
    refundCommand.data[@"detail"] = detail;
    refundCommand.data[@"invoice_payment_id"] = self.objectIdentifier;
    [refundCommand executeWithCompletion:completion];
}

@end
