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

@property (nonatomic, weak) NSString *_Nullable label; //Example: Cell
@property (nonatomic, assign) BOOL isPreferred; //Example: 1
@property (nonatomic, weak) NSString *_Nullable phoneNumber; //Example: 9192475214
@property (nonatomic, assign) BOOL isHidden; //Example: 0
@property (nonatomic, assign) BOOL smsEnabled; //Example: 1
@property (nonatomic, weak) NSString *_Nullable smsEmailAddress; //Example: 9192475214@txt.att.net
@property (nonatomic, weak) NSDate *_Nullable createdAt; //Example: 2012-11-09T18:39:40.000+00:00
@property (nonatomic, weak) NSDate *_Nullable updatedAt; //Example: 2012-11-09T18:39:40.000+00:00
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, weak) NSString *_Nullable smsGatewayId; //Example: at&t
@property (nonatomic, assign) NSInteger memberId; //Example: 993324
@property (nonatomic, weak) NSURL *_Nullable linkMember;
@property (nonatomic, weak) NSURL *_Nullable linkSmsGateway;
@property (nonatomic, weak) NSURL *_Nullable linkTeam;

@end

@interface TSDKMemberPhoneNumber (ForwardedMethods)

-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberArrayCompletionBlock _Nullable)completion;
-(void)getSmsGatewayWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;


@end
