//
//  TSDKBatchInvoiceLineItem.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 6/1/18.
//  Copyright © 2018 teamsnap. All rights reserved.
//

#import "TSDKBatchInvoiceLineItem.h"

@implementation TSDKBatchInvoiceLineItem
@dynamic amount, quantity, amountWithCurrency, createdAt, batchInvoiceId, batchInvoiceLineItemDescription, updatedAt, linkTeam, linkBatchInvoice;

+ (NSString *)SDKType {
    return @"batch_invoice_line_item";
}

- (void)setInvoiceCategoryId:(TSDKInvoiceCategory)category {
    [self setInteger:category forKey:@"invoice_category_id"];
}

- (TSDKInvoiceCategory)invoiceCategoryId {
    return [self getInteger:@"invoice_category_id"];
}

@end
