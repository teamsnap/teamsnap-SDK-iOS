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
@property (nonatomic, assign) CGFloat amountDue; //Example: 15.00
@property (nonatomic, strong) NSDate *_Nullable createdAt; //Example: 2015-02-27T14:58:37.000+00:00
@property (nonatomic, strong) NSString *_Nullable memberId; //Example: 993324
@property (nonatomic, strong) NSString *_Nullable teamFeeId; //Example: 398368
@property (nonatomic, assign) CGFloat amountPaid; //Example: 0.00
@property (nonatomic, strong) NSString *_Nullable teamId; //Example: 71118
@property (nonatomic, strong) NSDate *_Nullable updatedAt; //Example: 2015-02-27T14:58:37.000+00:00
@property (nonatomic, strong) NSURL *_Nullable linkMember;
@property (nonatomic, strong) NSURL *_Nullable linkTeam;
@property (nonatomic, strong) NSURL *_Nullable linkPaymentNotes;
@property (nonatomic, strong) NSURL *_Nullable linkTeamFee;

//+(void)actionTransactionWithCompletion:(TSDKCompletionBlock)completion; //(null)

@end

@interface TSDKMemberPayment (ForwardedMethods)

-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberArrayCompletionBlock _Nullable)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;
-(void)getPaymentNotesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKPaymentNoteArrayCompletionBlock _Nullable)completion;
-(void)getTeamFeeWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamFeeArrayCompletionBlock _Nullable)completion;

@end
