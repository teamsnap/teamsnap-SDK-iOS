//
//  TSDKInvoiceMessage.h
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 5/17/18.
//  Copyright © 2018 teamsnap. All rights reserved.
//

#import <TeamSnapSDK/TeamSnapSDK.h>

@interface TSDKInvoiceMessage : TSDKCollectionObject

@property (nonatomic, weak) NSString * _Nullable status;// open, paid, not sent, archived, canceled, and All,
@property (nonatomic, weak) NSString * _Nullable batchInvoiceId;
@property (nonatomic, weak) NSString * _Nullable subject;
@property (nonatomic, weak) NSString * _Nullable body;

- (void)actionPaymentRequestWithCompletion:(TSDKCompletionBlock _Nullable)completion;
// command
//  "href": "https://api.teamsnap.com/v3/invoice_messages/payment_request",
// "rel": "payment_request"

@end
