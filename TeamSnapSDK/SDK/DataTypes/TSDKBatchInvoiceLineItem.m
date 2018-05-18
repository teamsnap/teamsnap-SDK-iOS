//
//  TSDKBatchInvoiceLineItem.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 5/17/18.
//  Copyright © 2018 teamsnap. All rights reserved.
//

#import "TSDKBatchInvoiceLineItem.h"

@implementation TSDKBatchInvoiceLineItem

@dynamic batchInvoiceId, invoiceCategoryId, batchInvoiceLineItemDescription, quantity, amount, amountWithCurrency,
        createdAt, updatedAt, linkBatchInvoice, linkDivision, linkTeam;

+ (NSString *)SDKType {
    return @"batch_invoice_line_item";
}

@end
