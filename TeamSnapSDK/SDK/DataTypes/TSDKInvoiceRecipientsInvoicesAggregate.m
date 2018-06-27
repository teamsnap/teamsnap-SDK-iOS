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

@end
