//
//  TSDKInvoiceRecipientsInvoicesAggregate.m
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 6/27/18.
//  Copyright © 2018 teamsnap. All rights reserved.
//

#import "TSDKInvoiceRecipientsInvoicesAggregate.h"

@implementation TSDKInvoiceRecipientsInvoicesAggregate

 @dynamic invoiceTo, amountCollectedWithCurrency, amountCollected, amountInvoiced, amountDue, invoicesCount, amountInvoicedWithCurrency, amountDueWithCurrency, paidInvoicesCount, openInvoicesCount, memberId, linkMember, linkTeam, linkInvoices;
 
 + (NSString *)SDKType {
     return @"invoice_recipients_invoices_aggregate";
 }

- (CGFloat)percentPaid {
    if (self.amountInvoiced == nil) {
        return 100.0;
    }
    if (self.amountCollected == nil) {
        return 0.0;
    }
    CGFloat amountPaidFloat = [self.amountCollected floatValue] ;
    CGFloat totalFloat = [self.amountInvoiced floatValue];
    if (totalFloat <= 0.01) {
        return 100.0;
    }
    
    return amountPaidFloat/totalFloat;
}

@end
