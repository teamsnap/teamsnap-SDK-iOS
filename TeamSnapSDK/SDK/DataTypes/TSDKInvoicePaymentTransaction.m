//
//  TSDKInvoicePaymentTransaction.m
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 6/14/18.
//  Copyright © 2018 teamsnap. All rights reserved.
//

#import "TSDKInvoicePaymentTransaction.h"

@implementation TSDKInvoicePaymentTransaction

@dynamic detail, processingFee, amountWithProcessingFee, amountWithCurrency, paymentType, amount, paymentProviderId, amountWithProcessingFeeWithCurrency, transactedAt, scheduledAt, processingFeeWithCurrency, createdAt, updatedAt, invoiceId, status, invoicePaymentId, linkInvoicePayment, linkInvoice, linkTeam;

+ (NSString *)SDKType {
    return @"invoice_payment_transaction";
}

@end
