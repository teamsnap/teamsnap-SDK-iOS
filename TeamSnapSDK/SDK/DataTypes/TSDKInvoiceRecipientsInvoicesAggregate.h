// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKInvoiceRecipientsInvoicesAggregate : TSDKCollectionObject

@property (nonatomic, strong, nullable) NSString * invoiceTo; //Example:
@property (nonatomic, strong, nullable) NSString * amountCollectedWithCurrency; //Example: $0.00
@property (nonatomic, strong, nullable) NSDecimalNumber * amountCollected; //Example: 0
@property (nonatomic, strong, nullable) NSDecimalNumber * amountInvoiced; //Example: 0
@property (nonatomic, strong, nullable) NSDecimalNumber * amountDue; //Example: 0
@property (nonatomic, assign) NSInteger invoicesCount; //Example: 0
@property (nonatomic, strong, nullable) NSString * amountInvoicedWithCurrency; //Example: $0.00
@property (nonatomic, strong, nullable) NSString * amountDueWithCurrency; //Example: $0.00
@property (nonatomic, assign) NSInteger paidInvoicesCount; //Example: 0
@property (nonatomic, assign) NSInteger openInvoicesCount; //Example: 0
@property (nonatomic, strong, nullable) NSString * memberId; //Example: 33734521
@property (nonatomic, strong, nullable) NSURL * invoiceToPhotoOriginalUrl; //Example: **NULL** 
@property (nonatomic, strong, nullable) NSURL * linkMember;
@property (nonatomic, strong, nullable) NSURL * linkTeam;
@property (nonatomic, strong, nullable) NSURL * linkInvoices;

- (CGFloat)percentPaid;

@end

@interface TSDKInvoiceRecipientsInvoicesAggregate (ForwardedMethods)

-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberArrayCompletionBlock _Nonnull)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nonnull)completion;
-(void)getInvoicesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKInvoicesArrayCompletionBlock _Nonnull)completion;

@end
