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

@property (nonatomic, weak) NSString *_Nullable note; //Example:
@property (nonatomic, assign) NSInteger memberPaymentId; //Example: 1311716
@property (nonatomic, weak) NSString *_Nullable teamFeeDescription; //Example: Team Fee ($30.00)
@property (nonatomic, weak) NSDate *_Nullable createdAt; //Example: 2013-04-17T19:20:22Z
@property (nonatomic, weak) NSString *_Nullable noteAuthor; //Example: Jason R
@property (nonatomic, assign) NSInteger memberId; //Example: 1282395
@property (nonatomic, weak) NSString *_Nullable paymentNoteDescription; //Example: Applied payment of $30.00 resulting in a balance of $0.00
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, weak) NSURL *_Nullable linkMember;
@property (nonatomic, weak) NSURL *_Nullable linkMemberPayment;
@property (nonatomic, weak) NSURL *_Nullable linkTeam;

@end

@interface TSDKPaymentNote (ForwardedMethods)

-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberArrayCompletionBlock _Nullable)completion;
-(void)getMemberPaymentWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;

@end
