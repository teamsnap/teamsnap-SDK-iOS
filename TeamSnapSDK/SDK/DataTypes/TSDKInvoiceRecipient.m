//
//  TSDKInvoiceRecipient.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 5/17/18.
//  Copyright © 2018 teamsnap. All rights reserved.
//

#import "TSDKInvoiceRecipient.h"

@implementation TSDKInvoiceRecipient

@dynamic batchInvoiceId, invoiceId, invoiceableId, invoiceableType, invoiceTo, createdAt, updatedAt, linkInvoice,
        linkBatchInvoice, linkMember, linkDivision, linkTeam;

+ (NSString *)SDKType {
    return @"invoice_recipient";
}

@end
