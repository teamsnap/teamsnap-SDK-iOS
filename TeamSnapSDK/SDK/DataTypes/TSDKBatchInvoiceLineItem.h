//
//  TSDKBatchInvoiceLineItem.h
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 5/17/18.
//  Copyright © 2018 teamsnap. All rights reserved.
//

#import <TeamSnapSDK/TeamSnapSDK.h>

typedef NS_ENUM(NSUInteger, TSDKInvoiceCategory) {
    TSDKInvoiceCategoryFee = 1,
    TSDKInvoiceCategoryDues = 2,
    TSDKInvoiceCategoryTournament = 3,
    TSDKInvoiceCategoryUniform = 4,
    TSDKInvoiceCategoryTeamExpense = 5
};

@interface TSDKBatchInvoiceLineItem : TSDKCollectionObject

@property (nonatomic, weak, nullable) NSString * batchInvoiceId;
@property (nonatomic, weak, nullable) NSString * invoiceCategoryId;
@property (nonatomic, weak, nullable) NSString * batchInvoiceLineItemDescription;
@property (nonatomic, assign) NSInteger quantity;
@property (nonatomic, assign) CGFloat amount;
@property (nonatomic, weak, nullable) NSString * amountWithCurrency;
@property (nonatomic, weak, nullable) NSDate * createdAt;
@property (nonatomic, weak, nullable) NSDate * updatedAt;
@property (nonatomic, weak, nullable) NSURL * linkBatchInvoice;
@property (nonatomic, weak, nullable) NSURL * linkDivision;
@property (nonatomic, weak, nullable) NSURL * linkTeam;

@end
