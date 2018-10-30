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

@dynamic isPayableOffline, paymentAdjustmentsAmount, processingFeesCanceledWithCurrency, amountRefundedWithProcessingFeesRefunded, processingFeesCanceled, createdAt, processingFeesSubTotalWithCurrency, teamId, dueAt, invoiceFrom, isPayable, amountPaid, invoiceDescription, processingFeesBilledWithCurrency, divisionId, uuid, amountPaidWithProcessingFeesPaid, processingFeesSubTotal, paymentAdjustmentsAmountWithCurrency, processingFeesBilled, amountRefunded, isCancelable, amountRefundedWithCurrency, invoiceTo, total, processingFeesPaidWithCurrency, processingFeesPaid, batchInvoiceId, subTotal, status, hasPaymentSchedule, hasPayments, amountCollected, amountCollectedWithCurrency, amountRefundedWithProcessingFeesRefundedWithCurrency, sentAt, paymentUrl, updatedAt, balanceWithCurrency, title, balance, amountPaidWithProcessingFeesPaidWithCurrency, subTotalWithCurrency, amountPaidWithCurrency, totalWithCurrency, canPayByPaymentSchedule, linkInvoiceLineItems, linkInvoiceRecipients, linkTeam, linkBatchInvoice, linkInvoicePayments;

+ (NSString *)SDKType {
    return @"invoice";
}

- (CGFloat)percentPaid {
    if (self.total == nil || self.total.floatValue == 0.0) {
        return 0.0;
    }
    if (self.amountPaid == nil || self.amountPaid.floatValue == 0.0) {
        return 0.0;
    }
    CGFloat amountPaidFloat = [self.amountPaid floatValue] ;
    CGFloat totalFloat = [self.total floatValue];
    if (totalFloat <= 0.01) {
        return 100.0;
    }
    
    return amountPaidFloat/totalFloat;
}

+ (TSDKInvoiceStatus)invoiceStatusForStatusString:(NSString *)statusString {
    if([[statusString lowercaseString] isEqualToString:[@"open" lowercaseString]]) {
        return TSDKInvoiceStatusOpen;
    } else if([[statusString lowercaseString] isEqualToString:[@"paid" lowercaseString]]) {
        return TSDKInvoiceStatusPaid;
    } else if([[statusString lowercaseString] isEqualToString:[@"canceled" lowercaseString]]) {
        return TSDKInvoiceStatusCanceled;
    } else {
        return TSDKInvoiceStatusUnknown;
    }
}

+(NSString *_Nonnull)invoiceStatusStringForStatus:(TSDKInvoiceStatus)status {
    switch (status) {
        case TSDKInvoiceStatusOpen:
            return @"open";
        case TSDKInvoiceStatusPaid:
            return @"paid";
        case TSDKInvoiceStatusCanceled:
            return @"canceled";
        case TSDKInvoiceStatusUnknown:
            return @"";
    }
}

- (TSDKInvoiceStatus)invoiceStatus {
    return [TSDKInvoice invoiceStatusForStatusString:self.status];
}

- (void)makePayment:(NSDecimalNumber * _Nonnull)amount method:(TSDKInvoiceOfflinePaymentMethod)method note:(NSString * _Nullable)note completion:(TSDKSimpleCompletionBlock _Nullable)completion {
    TSDKCollectionCommand *command;
    switch (method) {
        case TSDKInvoiceOfflinePaymentMethodCash:
            command = [TSDKInvoicePayment commandForKey:@"pay_offline_cash"];
            break;
        case TSDKInvoiceOfflinePaymentMethodCheck:
            command =[TSDKInvoicePayment commandForKey:@"pay_offline_check"];
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

+ (void)createFromBatchInvoiceId:(NSString *_Nonnull)batchInvoiceId
                      forMembers:(NSArray <NSString *>*_Nonnull)memberIds
                  completion:(TSDKSimpleCompletionBlock _Nullable)completion {
    
    TSDKCollectionCommand *createInvoicesCommand = [self commandForKey:@"create_from_batch_invoice"];
    
    createInvoicesCommand.data[@"batch_invoice_id"] = batchInvoiceId;
    
    createInvoicesCommand.data[@"member_ids"] = memberIds;
    
    [createInvoicesCommand executeWithCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON * _Nullable objects, NSError * _Nullable error) {
        if (completion) {
            completion(success, error);
        }
    }];
}

+ (void)cancelInvoiceId:(NSString *_Nonnull)invoiceId WithCompletion:(TSDKSimpleCompletionBlock _Nullable)completion {
    
    TSDKCollectionCommand *cancelInvoiceCommand = [self commandForKey:@"cancel"];
    cancelInvoiceCommand.data[@"id"] = invoiceId;
    
    [cancelInvoiceCommand executeWithCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON * _Nullable objects, NSError * _Nullable error) {
        if (completion) {
            completion(success, error);
        }
    }];
}

- (void)cancelWithCompletion:(TSDKSimpleCompletionBlock)completion {
    [TSDKInvoice cancelInvoiceId:self.objectIdentifier WithCompletion:completion];
}

@end
