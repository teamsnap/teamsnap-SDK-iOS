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

@end
