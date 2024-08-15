//
//  TSDKInvoicesAggregate.m
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 3/6/18.
//  Copyright © 2018 teamsnap. All rights reserved.
//

#import "TSDKInvoicesAggregate.h"

@implementation TSDKInvoicesAggregate

@dynamic openInvoicesBalance, openInvoicesBalanceWithCurrency, userId, linkUsers;

+ (NSString *)SDKType {
    return @"invoices_aggregate";
}

@end
