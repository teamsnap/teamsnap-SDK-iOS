//
//  TSDKTeamFee.h
//  SDKPlayground
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKTeamFee : TSDKCollectionObject

@property (nonatomic, weak) NSString *_Nullable amount; //Example: 15.00
@property (nonatomic, weak) NSString *_Nullable notes; //Example: asldkjakl;dsj ;lkasj d;klajs d;lkaj d;lkja;lksdj ;kja d;lkj a;skdj ;alksjd ;aklsjd ;alksjd ;lkajsd;lkj aslk;dj a;lksdj ;alskjdalkjdkjsdkj askdj akjdksjf sdfkj sdfh sdjfh sjdfhsdjfh sjdfhjshf sdfklj sdfljhskdfhljshf's sdljfhsdlfjh skjdfh skjldhf qwiehjahf
@property (nonatomic, weak) NSString *_Nullable createdAt; //Example: 2015-02-27T14:58:37.000+00:00
@property (nonatomic, weak) NSString *_Nullable teamId; //Example: 71118
@property (nonatomic, weak) NSString *_Nullable teamFeeDescription; //Example: Hat
@property (nonatomic, weak) NSString *_Nullable balance; //Example: 740.01
@property (nonatomic, weak) NSString *_Nullable updatedAt; //Example: 2015-06-22T19:25:34.000+00:00
@property (nonatomic, weak) NSURL *_Nullable linkTeam;
@property (nonatomic, weak) NSURL *_Nullable linkMemberPayments;

@end

@interface TSDKTeamFee (ForwardedMethods)

-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;
-(void)getMemberPaymentsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberPaymentArrayCompletionBlock _Nullable)completion;


@end
