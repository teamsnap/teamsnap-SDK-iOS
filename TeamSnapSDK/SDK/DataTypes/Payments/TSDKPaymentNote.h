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

@property (nonatomic, strong) NSString *_Nullable note; //Example:
@property (nonatomic, strong) NSString *_Nullable memberPaymentId; //Example: 1311716
@property (nonatomic, strong) NSString *_Nullable teamFeeDescription; //Example: Team Fee ($30.00)
@property (nonatomic, strong) NSDate *_Nullable createdAt; //Example: 2013-04-17T19:20:22Z
@property (nonatomic, strong) NSString *_Nullable noteAuthor; //Example: Jason R
@property (nonatomic, strong) NSString *_Nullable memberId; //Example: 1282395
@property (nonatomic, strong) NSString *_Nullable paymentNoteDescription; //Example: Applied payment of $30.00 resulting in a balance of $0.00
@property (nonatomic, strong) NSString *_Nullable teamId; //Example: 71118
@property (nonatomic, strong) NSURL *_Nullable linkMember;
@property (nonatomic, strong) NSURL *_Nullable linkMemberPayment;
@property (nonatomic, strong) NSURL *_Nullable linkTeam;

@end

@interface TSDKPaymentNote (ForwardedMethods)

-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberArrayCompletionBlock _Nullable)completion;
-(void)getMemberPaymentWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;

@end
