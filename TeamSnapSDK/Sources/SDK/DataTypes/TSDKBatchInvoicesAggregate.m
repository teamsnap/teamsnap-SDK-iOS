//
//  TSDKBatchInvoicesAggregate.m
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 6/1/18.
//  Copyright © 2018 teamsnap. All rights reserved.
//

#import "TSDKBatchInvoicesAggregate.h"

@implementation TSDKBatchInvoicesAggregate

@dynamic divisionId, amountDueWithCurrency, openBatchInvoicesCount, amountDue, amountInvoicedWithCurrency, teamId, amountCollectedWithCurrency, amountCollected, amountInvoiced, linkTeam;

+ (NSString *)SDKType {
    return @"batch_invoices_aggregate";
}


@end
