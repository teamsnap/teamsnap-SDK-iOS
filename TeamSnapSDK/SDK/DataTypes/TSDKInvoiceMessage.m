//
//  TSDKInvoiceMessage.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 5/17/18.
//  Copyright © 2018 teamsnap. All rights reserved.
//

#import "TSDKInvoiceMessage.h"

@implementation TSDKInvoiceMessage

@dynamic status, batchInvoiceId, subject, body;

+ (NSString *)SDKType {
    return @"invoice_message";
}


- (void)actionPaymentRequestWithCompletion:(TSDKCompletionBlock _Nullable)completion {
     TSDKCollectionCommand *command = [[TSDKInvoiceMessage commandForKey:@"payment_request"] copy];
    for (NSString* key in self.collection.data) {
        command.data[key] = [self.collection.data objectForKey:key];
    }
    [command executeWithCompletion:completion];
}

@end
