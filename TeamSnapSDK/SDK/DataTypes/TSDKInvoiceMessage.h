//
//  TSDKInvoiceMessage.h
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 6/8/18.
//  Copyright © 2018 teamsnap. All rights reserved.
//

#import <TeamSnapSDK/TeamSnapSDK.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"
#import "TSDKBatchInvoice.h"

typedef NS_ENUM(NSUInteger, TSDKInvoiceFilter) {
    TSDKInvoiceFilterOpen,
    TSDKInvoiceFilterPaid,
    TSDKInvoiceFilterCanceled,
    TSDKInvoiceFilterSubmitted,
    TSDKInvoiceFilterPending,
    TSDKInvoiceFilterAll,
    TSDKInvoiceFilterUnknown
};

@interface TSDKInvoiceMessage : TSDKCollectionObject

+(void)actionPaymentRequestForBatchId:(NSString *_Nonnull)batchId MemberIds:(NSArray<NSString *> *_Nonnull)memberIds subject:(NSString *_Nullable)subject body:(NSString *_Nullable)body completion:(TSDKCompletionBlock _Nullable)completion;
+(void)actionPaymentRequestForBatchId:(NSString *_Nonnull)batchId status:(TSDKInvoiceFilter)status subject:(NSString *_Nullable)subject body:(NSString *_Nullable)body completion:(TSDKCompletionBlock _Nullable)completion;
@end
