//
//  TSDKMemberPhoneNumber.h
//  TeamSnapSDK
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKMemberPhoneNumber : TSDKCollectionObject

@property (nonatomic, weak) NSString *label; //Example: Cell
@property (nonatomic, assign) BOOL isPreferred; //Example: 1
@property (nonatomic, weak) NSString *phoneNumber; //Example: 9192475214
@property (nonatomic, assign) BOOL isHidden; //Example: 0
@property (nonatomic, assign) NSInteger smsEnabled; //Example: 1
@property (nonatomic, assign) NSInteger preferred; //Example: 1
@property (nonatomic, weak) NSString *smsEmailAddress; //Example: 9192475214@txt.att.net
@property (nonatomic, weak) NSString *createdAt; //Example: 2012-11-09T18:39:40.000+00:00
@property (nonatomic, weak) NSString *updatedAt; //Example: 2012-11-09T18:39:40.000+00:00
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, weak) NSString *smsGatewayId; //Example: at&t
@property (nonatomic, assign) NSInteger memberId; //Example: 993324
@property (nonatomic, weak) NSURL *linkMember;
@property (nonatomic, weak) NSURL *linkSmsGateway;
@property (nonatomic, weak) NSURL *linkTeam;

@end

@interface TSDKMemberPhoneNumber (ForwardedMethods)

-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberArrayCompletionBlock)completion;
-(void)getSmsGatewayWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion;


@end
