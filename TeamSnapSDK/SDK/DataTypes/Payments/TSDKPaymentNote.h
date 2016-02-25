//
//  TSDKPaymentNote.h
//  TeamSnapSDK
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKPaymentNote : TSDKCollectionObject

@property (nonatomic, weak) NSString *note; //Example:
@property (nonatomic, assign) NSInteger memberPaymentId; //Example: 1311716
@property (nonatomic, weak) NSString *teamFeeDescription; //Example: Team Fee ($30.00)
@property (nonatomic, weak) NSDate *createdAt; //Example: 2013-04-17T19:20:22Z
@property (nonatomic, weak) NSString *noteAuthor; //Example: Jason R
@property (nonatomic, assign) NSInteger memberId; //Example: 1282395
@property (nonatomic, weak) NSString *paymentNoteDescription; //Example: Applied payment of $30.00 resulting in a balance of $0.00
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, weak) NSURL *linkMember;
@property (nonatomic, weak) NSURL *linkMemberPayment;
@property (nonatomic, weak) NSURL *linkTeam;

@end

@interface TSDKPaymentNote (ForwardedMethods)

-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberArrayCompletionBlock)completion;
-(void)getMemberPaymentWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion;

@end
