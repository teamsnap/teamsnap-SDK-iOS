// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKBatchInvoice.h"
#import "TSDKBatchInvoiceLineItem.h"
#import "TSDKMember.h"

@implementation TSDKBatchInvoice

@dynamic isRecipientPayingTransactionFees, teamId, amountInvoicedWithCurrency, status, title, isCancelable, paymentAdjustmentsAmount, updatedAt, paymentAdjustmentsAmountWithCurrency, invoicesPastDueCount, isDeletable, invoicesCount, amountPaid, amountInvoiced, amountPaidWithCurrency, invoicesUnpaidCount, amountDueWithCurrency, amountDue, invoicesPaidCount, createdAt, divisionId, dueAt, batchInvoiceDescription, linkInvoices, linkInvoiceRecipients, linkTeam, linkBatchInvoiceLineItems;

+ (NSString *)SDKType {
    return @"batch_invoice";
}

- (CGFloat)percentPaid {
    CGFloat amountPaidFloat = (CGFloat)self.amountPaid;
    CGFloat amountInvoicedFloat = (CGFloat)self.amountInvoiced;
    return amountPaidFloat/amountInvoicedFloat;
}

- (TSDKBatchInvoiceStatus)invoiceStatus {
    if([[self.status lowercaseString] isEqualToString:[@"open" lowercaseString]]) {
        return TSDKBatchInvoiceStatusOpen;
    } else if([[self.status lowercaseString] isEqualToString:[@"paid" lowercaseString]]) {
        return TSDKBatchInvoiceStatusPaid;
    } else if([[self.status lowercaseString] isEqualToString:[@"canceled" lowercaseString]]) {
        return TSDKBatchInvoiceStatusCanceled;
    } else {
        return TSDKBatchInvoiceStatusUnknown;
    }
}

/*
+(void)actionCreateWithInvoicesDueat:(NSString *_Nonnull)dueAt divisionId:(NSString *_Nullable)divisionId title:(NSString *_Nonnull)title isRecipientPayingTransactionFees:(NSString *_Nonnull)isRecipientPayingTransactionFees teamId:(NSString *_Nonnull)teamId description:(NSString *_Nullable)description type:(NSString *_Nonnull)type batchInvoiceLineItems:(NSString *_Nonnull)batchInvoiceLineItems members:(NSArray<TSDKMember *> *)members WithCompletion:(TSDKCompletionBlock _Nullable)completion {

}
*/

+(void)actionCreateWithInvoicesDueat:(NSString *_Nonnull)dueAt teamId:(NSString *_Nonnull)teamId title:(NSString *_Nonnull)title description:(NSString *_Nullable)description type:(NSString *_Nonnull)type invoiceLineItems:(NSArray<TSDKBacthInvoiceLineItem *> *)invoiceLineItems members:(NSArray<TSDKMember *> *)members isRecipientPayingTransactionFees:(NSString *_Nonnull)isRecipientPayingTransactionFees completion:(TSDKCompletionBlock _Nullable)completion {
    
    TSDKCollectionCommand *createInvoiceCommand = [[self commandForKey:@"create_invoice"] copy];

    if (createInvoiceCommand) {
        createInvoiceCommand.data[@"due_at"] = dueAt;
        createInvoiceCommand.data[@"title"] = title;
        createInvoiceCommand.data[@"is_recipient_paying_transaction_fees"] = isRecipientPayingTransactionFees;
        createInvoiceCommand.data[@"team_id"] = teamId;
        if (description) {
            createInvoiceCommand.data[@"description"] = description;
        }
        createInvoiceCommand.data[@"type"] = type;
        NSMutableArray<NSDictionary *> *lineItemArray = [[NSMutableArray alloc] init];
        for (TSDKBatchInvoiceLineItem *lineItem in invoiceLineItems) {
            NSDictionary *dataToSave = @{@"amount": [NSNumber numberWithFloat:lineItem.amount],
                                         @"invoice_category_id": [NSNumber numberWithInteger:lineItem.invoiceCategoryId],
                                         @"quantity": [NSNumber numberWithInteger:lineItem.quantity],
                                         @"batch_invoice_line_item_description": lineItem.batchInvoiceLineItemDescription
                                         };
            [lineItemArray addObject:dataToSave];
        }
        createInvoiceCommand.data[@"batch_invoice_line_items"] = lineItemArray;
        
        NSMutableArray<NSString *> *membersStrings = [[NSMutableArray alloc] init];
        for (TSDKMember *member in members) {
            [membersStrings addObject:member.objectIdentifier];
        }
        [createInvoiceCommand executeWithCompletion:completion];
    }
}

@end
