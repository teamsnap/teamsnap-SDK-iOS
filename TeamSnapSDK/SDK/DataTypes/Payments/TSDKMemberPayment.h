//
//  TSDKMemberPayment.h
//  TeamSnapSDK
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKMemberPayment : TSDKCollectionObject

@property (nonatomic, assign) BOOL isApplicable; //Example: 1
@property (nonatomic, weak) NSString *amountDue; //Example: 15.00
@property (nonatomic, weak) NSString *createdAt; //Example: 2015-02-27T14:58:37.000+00:00
@property (nonatomic, assign) NSInteger memberId; //Example: 993324
@property (nonatomic, assign) NSInteger teamFeeId; //Example: 398368
@property (nonatomic, weak) NSString *amountPaid; //Example: 0.00
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, weak) NSString *updatedAt; //Example: 2015-02-27T14:58:37.000+00:00
@property (nonatomic, weak) NSURL *linkMember;
@property (nonatomic, weak) NSURL *linkTeam;
@property (nonatomic, weak) NSURL *linkPaymentNotes;
@property (nonatomic, weak) NSURL *linkTeamFee;

//+(void)actionTransactionWithCompletion:(TSDKCompletionBlock)completion; //(null)

@end

@interface TSDKMemberPayment (ForwardedMethods)

-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberArrayCompletionBlock)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion;
-(void)getPaymentNotesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKPaymentNoteArrayCompletionBlock)completion;
-(void)getTeamFeeWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamFeeArrayCompletionBlock)completion;

@end
