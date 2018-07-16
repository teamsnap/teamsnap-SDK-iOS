// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKInvoicePaymentTransaction : TSDKCollectionObject

@property (nonatomic, strong, nullable) NSString * detail; //Example: **NULL**
@property (nonatomic, assign) NSDecimalNumber * processingFee; //Example: 0
@property (nonatomic, assign) NSDecimalNumber * amountWithProcessingFee; //Example: 25
@property (nonatomic, strong, nullable) NSString * amountWithCurrency; //Example: $25.00
@property (nonatomic, strong, nullable) NSString * paymentType; //Example: Cash
@property (nonatomic, assign) NSDecimalNumber * amount; //Example: 25
@property (nonatomic, strong, nullable) NSString * paymentProviderId; //Example: 8
@property (nonatomic, strong, nullable) NSString * amountWithProcessingFeeWithCurrency; //Example: $25.00
@property (nonatomic, strong, nullable) NSDate * transactedAt; //Example: 2018-05-14T15:45:35Z
@property (nonatomic, strong, nullable) NSDate * scheduledAt; //Example: <null>
@property (nonatomic, strong, nullable) NSString * processingFeeWithCurrency; //Example: $0.00
@property (nonatomic, strong, nullable) NSDate * createdAt; //Example: 2018-05-14T15:45:35Z
@property (nonatomic, strong, nullable) NSDate * updatedAt; //Example: 2018-05-14T15:45:35Z
@property (nonatomic, strong, nullable) NSString * invoiceId; //Example: 51664
@property (nonatomic, strong, nullable) NSString * status; //Example: paid
@property (nonatomic, strong, nullable) NSString * invoicePaymentId; //Example: 23408
@property (nonatomic, strong, nullable) NSURL * linkInvoicePayment;
@property (nonatomic, strong, nullable) NSURL * linkInvoice;
@property (nonatomic, strong, nullable) NSURL * linkTeam;

//+(void)querySearchId:(NSString *_Nonnull)id invoiceId:(NSString *_Nonnull)invoiceId pageNumber:(NSString *_Nonnull)pageNumber invoicePaymentId:(NSString *_Nonnull)invoicePaymentId pageSize:(NSString *_Nonnull)pageSize WithCompletion:(TSDKCompletionBlock _Nullable)completion;

@end

@interface TSDKInvoicePaymentTransaction (ForwardedMethods)

-(void)getInvoicePaymentWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKInvoicePaymentsArrayCompletionBlock _Nonnull)completion;
-(void)getInvoiceWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKInvoicesArrayCompletionBlock _Nonnull)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nonnull)completion;

@end
