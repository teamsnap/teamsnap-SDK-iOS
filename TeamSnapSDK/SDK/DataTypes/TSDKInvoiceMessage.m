//
//  TSDKInvoiceMessage.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 6/8/18.
//  Copyright © 2018 teamsnap. All rights reserved.
//

#import "TSDKInvoiceMessage.h"

@implementation TSDKInvoiceMessage

+ (NSString *)SDKType {
    return @"invoice_message";
}

+(void)actionPaymentRequestForBatchId:(NSString *_Nonnull)batchId MemberIds:(NSArray<NSString *> *_Nonnull)memberIds subject:(NSString *_Nullable)subject body:(NSString *_Nullable)body completion:(TSDKCompletionBlock _Nullable)completion {
    TSDKCollectionCommand *paymentRequestCommand = [[self commandForKey:@"payment_request"] copy];
    paymentRequestCommand.data[@"member_ids"] = memberIds;
    [paymentRequestCommand.data removeObjectForKey:@"status"];
    paymentRequestCommand.data[@"batch_invoice_id"] = batchId;
    
    if (subject) {
        paymentRequestCommand.data[@"subject"] = subject;
    } else {
        [paymentRequestCommand.data removeObjectForKey:@"subject"];
    }
    
    if (body) {
        paymentRequestCommand.data[@"body"] = body;
    } else {
        [paymentRequestCommand.data removeObjectForKey:@"body"];
    }
    
    [paymentRequestCommand executeWithCompletion:completion];
}

+(void)actionPaymentRequestForBatchId:(NSString *_Nonnull)batchId status:(NSString *_Nonnull)status subject:(NSString *_Nullable)subject body:(NSString *_Nullable)body completion:(TSDKCompletionBlock _Nullable)completion {
    
    TSDKCollectionCommand *paymentRequestCommand = [[self commandForKey:@"payment_request"] copy];
    
    paymentRequestCommand.data[@"status"] = status;
    [paymentRequestCommand.data removeObjectForKey:@"member_ids"];
    
    paymentRequestCommand.data[@"batch_invoice_id"] = batchId;
    
    if (subject) {
        paymentRequestCommand.data[@"subject"] = subject;
    } else {
        [paymentRequestCommand.data removeObjectForKey:@"subject"];
    }
    
    if (body) {
        paymentRequestCommand.data[@"body"] = body;
    } else {
        [paymentRequestCommand.data removeObjectForKey:@"body"];
    }
    
    [paymentRequestCommand executeWithCompletion:completion];
}

@end
