//
//  TSDKInvoiceRecipient.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 6/1/18.
//  Copyright © 2018 teamsnap. All rights reserved.
//

#import "TSDKInvoiceRecipient.h"

@implementation TSDKInvoiceRecipient

@dynamic invoiceableId, invoiceId, invoiceableType, createdAt, batchInvoiceId, invoiceTo, updatedAt, linkMember, linkInvoice, linkTeam, linkBatchInvoice;

+ (NSString *)SDKType {
    return @"invoice_recipient";
}

@end
