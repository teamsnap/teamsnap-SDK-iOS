// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKBatchInvoice.h"
#import "TSDKBatchInvoiceLineItem.h"
#import "NSDictionary+TSDKCollectionJSON.h"
#import "TSDKInvoice.h"
#import "TSDKMember.h"
#import "NSDate+TSDKConveniences.h"

@implementation TSDKBatchInvoice

@dynamic isRecipientPayingTransactionFees, teamId, amountInvoicedWithCurrency, status, title, isCancelable, paymentAdjustmentsAmount, updatedAt, paymentAdjustmentsAmountWithCurrency, invoicesPastDueCount, isDeletable, invoicesCount, amountPaid, amountInvoiced, amountPaidWithCurrency, invoicesUnpaidCount, amountDueWithCurrency, amountDue, invoicesPaidCount, createdAt, divisionId, dueAt, batchInvoiceDescription, amountCollectedWithCurrency, linkInvoices, linkInvoiceRecipients, linkTeam, linkBatchInvoiceLineItems;

+ (NSString *)SDKType {
    return @"batch_invoice";
}

- (CGFloat)percentPaid {
    if (self.amountInvoiced == nil || self.amountInvoiced.floatValue == 0.0) {
        return 0.0;
    }
    if (self.amountPaid == nil || self.amountPaid.floatValue == 0.0) {
        return 0.0;
    }
    CGFloat amountPaidFloat = [self.amountPaid floatValue] ;
    CGFloat amountInvoicedFloat = [self.amountInvoiced floatValue];
    if (amountInvoicedFloat <= 0.01) {
        return 100.0;
    }
    
    return amountPaidFloat/amountInvoicedFloat;
}

- (TSDKInvoiceStatus)invoiceStatus {
    return [TSDKInvoice invoiceStatusForStatusString:self.status];
}

+ (void)createInvoicesWithDueDate:(NSDate *_Nonnull)dueDate
                           teamId:(NSString *_Nonnull)teamId
                            title:(NSString *_Nonnull)title
                      description:(NSString *_Nullable)description
                 invoiceLineItems:(NSArray *_Nonnull)invoiceLineItems
                          members:(NSArray<TSDKMember *> *)members
            processingFeesPaidBy:(TSDKBatchInvoiceFeesPaidBy)processingFeesPaidBy
                       completion:(TSDKBatchInvoiceCreatedBlock _Nullable)completion {
    
    TSDKCollectionCommand *createInvoiceCommand = [[self commandForKey:@"create_with_invoices"] copy];

    if (createInvoiceCommand) {
        createInvoiceCommand.data[@"due_at"] = [dueDate RCF3339DateTimeString];
        createInvoiceCommand.data[@"title"] = title;
        
        createInvoiceCommand.data[@"processing_fee_paid_by"] = [TSDKBatchInvoice stringForFeesPaidBy:processingFeesPaidBy];
        
        createInvoiceCommand.data[@"team_id"] = teamId;
        [createInvoiceCommand.data removeObjectForKey:@"division_id"];
        if (description) {
            createInvoiceCommand.data[@"description"] = description;
        } else {
            [createInvoiceCommand.data removeObjectForKey:@"description"];
        }
        
        // this was depricated before it was implemented but is still in the command payload.
        [createInvoiceCommand.data removeObjectForKey:@"is_recipient_paying_transaction_fees"];

                
        NSMutableArray<NSDictionary *> *lineItemArray = [[NSMutableArray alloc] init];
        for (TSDKBatchInvoiceLineItem *lineItem in invoiceLineItems) {
            NSDictionary *dataToSave = @{@"amount": lineItem.amount,
                                         @"invoice_category_id": [NSNumber numberWithInteger:lineItem.invoiceCategoryId],
                                         @"quantity": [NSNumber numberWithInteger:lineItem.quantity]
                                         };
            [lineItemArray addObject: [dataToSave collectionJSONTemplate]];
        }
        
        createInvoiceCommand.data[@"batch_invoice_line_items"] = lineItemArray;
        
        NSMutableArray<NSString *> *membersStrings = [[NSMutableArray alloc] init];
        for (TSDKMember *member in members) {
            [membersStrings addObject:member.objectIdentifier];
        }
        createInvoiceCommand.data[@"member_ids"] = membersStrings;
        [createInvoiceCommand executeCollectionJSONTemplateWithCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON * _Nullable objects, NSError * _Nullable error) {
            
            TSDKBatchInvoice *batchInvoice = nil;
            NSMutableArray <TSDKBatchInvoiceLineItem *> *batchInvoiceLineItems = [[NSMutableArray alloc] init];
            NSMutableArray <TSDKInvoice *> *invoices = [[NSMutableArray alloc] init];
            
            if (success && ([[objects collection] isKindOfClass:[NSArray class]])) {
                // This currently returns a mixed bag of batch_invoice, batch_invoice_line
                NSArray<TSDKCollectionObject *> *results = [TSDKObjectsRequest SDKObjectsFromCollection:objects];
                
                for (TSDKCollectionObject *resultObject in results) {
                    if ([resultObject isKindOfClass:[TSDKBatchInvoice class]]) {
                        batchInvoice = (TSDKBatchInvoice *)resultObject;
                    } else if ([resultObject isKindOfClass:[TSDKBatchInvoiceLineItem class]]) {
                        [batchInvoiceLineItems addObject:(TSDKBatchInvoiceLineItem *)resultObject];
                    } else if ([resultObject isKindOfClass:[TSDKInvoice class]]) {
                        [invoices addObject:(TSDKInvoice *)resultObject];
                    }
                }
            }
            
            completion(success, complete, batchInvoice, [NSArray arrayWithArray: batchInvoiceLineItems], [NSArray arrayWithArray:invoices], error);
        }];
    }
}

+ (void)cancelInvoiceId:(NSString *)invoiceId completon:(TSDKSimpleCompletionBlock)completion {
    TSDKCollectionCommand *cancelInvoiceCommand = [self commandForKey:@"cancel"];
    cancelInvoiceCommand.data[@"id"] = invoiceId;
    
    [cancelInvoiceCommand executeWithCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON * _Nullable objects, NSError * _Nullable error) {
        if (completion) {
            completion(success, error);
        }
    }];
    
}

- (void)cancelWithCompletion:(TSDKSimpleCompletionBlock)completion {
    [TSDKBatchInvoice cancelInvoiceId:self.objectIdentifier completon:completion];
}

- (void)addRecipientsWithMembers:(NSArray <NSString *> *_Nonnull)memberIds
                      completion:(TSDKSimpleCompletionBlock _Nullable)completion {
    // This is a convienence method for 'TSDKInvoice createFromBatchInvoiceId' which seems misplaced and misnamed.
    
    [TSDKInvoice createFromBatchInvoiceId:self.objectIdentifier
                             forMembers:memberIds
                               completion:completion];
}

+(NSString *_Nonnull)stringForFeesPaidBy:(TSDKBatchInvoiceFeesPaidBy)feesPaidBy {
    switch (feesPaidBy) {
        case TSDKBatchInvoiceFeesPaidByPayer:
            return @"payer";
        case TSDKBatchInvoiceFeesPaidByPayee:
            return @"payee";
    }
}

@end
