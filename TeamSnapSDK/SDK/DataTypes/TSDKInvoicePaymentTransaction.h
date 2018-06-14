// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKInvoicePaymentTransaction : TSDKCollectionObject

@property (nonatomic, weak, nullable) NSString * detail; //Example: **NULL**
@property (nonatomic, assign) NSInteger processingFee; //Example: 0
@property (nonatomic, assign) NSInteger amountWithProcessingFee; //Example: 25
@property (nonatomic, weak, nullable) NSString * amountWithCurrency; //Example: $25.00
@property (nonatomic, weak, nullable) NSString * paymentType; //Example: Cash
@property (nonatomic, assign) NSInteger amount; //Example: 25
@property (nonatomic, weak, nullable) NSString * paymentProviderId; //Example: 8
@property (nonatomic, weak, nullable) NSString * amountWithProcessingFeeWithCurrency; //Example: $25.00
@property (nonatomic, weak, nullable) NSDate * transactedAt; //Example: 2018-05-14T15:45:35Z
@property (nonatomic, weak, nullable) NSDate * scheduledAt; //Example: <null>
@property (nonatomic, weak, nullable) NSString * processingFeeWithCurrency; //Example: $0.00
@property (nonatomic, weak, nullable) NSDate * createdAt; //Example: 2018-05-14T15:45:35Z
@property (nonatomic, weak, nullable) NSDate * updatedAt; //Example: 2018-05-14T15:45:35Z
@property (nonatomic, weak, nullable) NSString * invoiceId; //Example: 51664
@property (nonatomic, weak, nullable) NSString * status; //Example: paid
@property (nonatomic, weak, nullable) NSString * invoicePaymentId; //Example: 23408
@property (nonatomic, weak, nullable) NSURL * linkInvoicePayment;
@property (nonatomic, weak, nullable) NSURL * linkInvoice;
@property (nonatomic, weak, nullable) NSURL * linkTeam;

//+(void)querySearchId:(NSString *_Nonnull)id invoiceId:(NSString *_Nonnull)invoiceId pageNumber:(NSString *_Nonnull)pageNumber invoicePaymentId:(NSString *_Nonnull)invoicePaymentId pageSize:(NSString *_Nonnull)pageSize WithCompletion:(TSDKCompletionBlock _Nullable)completion;

@end

@interface TSDKInvoicePaymentTransaction (ForwardedMethods)

-(void)getInvoicePaymentWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKInvoicePaymentsArrayCompletionBlock _Nonnull)completion;
-(void)getInvoiceWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKInvoicesArrayCompletionBlock _Nonnull)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nonnull)completion;

@end
