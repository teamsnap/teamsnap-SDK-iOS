// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKInvoiceRecipient : TSDKCollectionObject

@property (nonatomic, strong, nullable) NSString * invoiceableId; //Example: 1454532
@property (nonatomic, strong, nullable) NSString * invoiceId; //Example: 41417
@property (nonatomic, strong, nullable) NSString * invoiceableType; //Example: member
@property (nonatomic, strong, nullable) NSDate * createdAt; //Example: 2018-04-25T20:28:43Z
@property (nonatomic, strong, nullable) NSString * batchInvoiceId; //Example: 7034
@property (nonatomic, strong, nullable) NSString * invoiceTo; //Example: Morgan Ziegler
@property (nonatomic, strong, nullable) NSDate * updatedAt; //Example: 2018-04-25T20:28:43Z
@property (nonatomic, strong, nullable) NSURL * linkMember;
@property (nonatomic, strong, nullable) NSURL * linkInvoice;
@property (nonatomic, strong, nullable) NSURL * linkTeam;
@property (nonatomic, strong, nullable) NSURL * linkBatchInvoice;

//+(void)querySearchPagesize:(NSString *_Nonnull)pageSize id:(NSString *_Nonnull)id invoiceId:(NSString *_Nonnull)invoiceId pageNumber:(NSString *_Nonnull)pageNumber batchInvoiceId:(NSString *_Nonnull)batchInvoiceId WithCompletion:(TSDKCompletionBlock _Nullable)completion;

@end

@interface TSDKInvoiceRecipient (ForwardedMethods)

-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberArrayCompletionBlock _Nonnull)completion;
-(void)getInvoiceWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKInvoicesArrayCompletionBlock _Nonnull)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nonnull)completion;
-(void)getBatchInvoiceWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKBatchInvoicesArrayCompletionBlock _Nonnull)completion;

@end

