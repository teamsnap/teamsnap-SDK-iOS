// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKBatchInvoice.h"
#import "TSDKBatchInvoiceLineItem.h"
#import "TSDKMember.h"
#import "NSDate+TSDKConveniences.h"

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

+ (void)test {
    NSLog(@"Tested");
}

+ (void)createInvoicesWithDueDate:(NSDate *_Nonnull)dueDate teamId:(NSString *_Nonnull)teamId title:(NSString *_Nonnull)title description:(NSString *_Nullable)description invoiceType:(TSDKInvoiceCategory)invoiceType invoiceLineItems:(NSArray *_Nonnull)invoiceLineItems members:(NSArray<TSDKMember *> *)members isRecipientPayingTransactionFees:(BOOL)isRecipientPayingTransactionFees completion:(TSDKBatchInvoiceCreatedBlock _Nullable)completion {
    
    TSDKCollectionCommand *createInvoiceCommand = [[self commandForKey:@"create_with_invoices"] copy];
    
    // Hacky hack: Do not merge
    if ([createInvoiceCommand.href containsString:@"create_with_invoices"] == NO) {
        createInvoiceCommand.href = [createInvoiceCommand.href stringByAppendingPathComponent:@"create_with_invoices"];
    }

    if (createInvoiceCommand) {
        createInvoiceCommand.data[@"due_at"] = [dueDate RCF3339DateTimeString];
        createInvoiceCommand.data[@"title"] = title;
        createInvoiceCommand.data[@"is_recipient_paying_transaction_fees"] = [NSNumber numberWithBool:isRecipientPayingTransactionFees];
        
        createInvoiceCommand.data[@"team_id"] = teamId;
        [createInvoiceCommand.data removeObjectForKey:@"division_id"];
        if (description) {
            createInvoiceCommand.data[@"description"] = description;
        } else {
            [createInvoiceCommand.data removeObjectForKey:@"description"];
        }
        
        createInvoiceCommand.data[@"type"] = [NSNumber numberWithInteger:invoiceType];
        
        NSMutableArray<NSDictionary *> *lineItemArray = [[NSMutableArray alloc] init];
        for (TSDKBatchInvoiceLineItem *lineItem in invoiceLineItems) {
            NSDictionary *dataToSave = @{@"amount": [NSNumber numberWithFloat:lineItem.amount],
                                         @"invoice_category_id": [NSNumber numberWithInteger:lineItem.invoiceCategoryId],
                                         @"quantity": [NSNumber numberWithInteger:lineItem.quantity]
                                         };
            [lineItemArray addObject: [TSDKCollectionJSON dictionaryToCollectionJSON:dataToSave]];
        }
        
        createInvoiceCommand.data[@"batch_invoice_line_items"] = lineItemArray;
        
        NSMutableArray<NSString *> *membersStrings = [[NSMutableArray alloc] init];
        for (TSDKMember *member in members) {
            [membersStrings addObject:member.objectIdentifier];
        }
        createInvoiceCommand.data[@"member_ids"] = membersStrings;
        [createInvoiceCommand executeCollectionJSONWithCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON * _Nullable objects, NSError * _Nullable error) {
            
            TSDKBatchInvoice *batchInvoice;
            if (success) {
                batchInvoice = [[TSDKBatchInvoice alloc] initWithCollection:objects.collection.firstObject];
            }
            completion(success, complete, batchInvoice, error);
        }];
    }
}

@end
