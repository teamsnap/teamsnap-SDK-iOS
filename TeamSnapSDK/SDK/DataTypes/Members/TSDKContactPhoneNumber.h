//
//  TSDKContactPhoneNumber.h
//  TeamSnapSDK
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKContactPhoneNumber : TSDKCollectionObject

@property (nonatomic, weak) NSString *label; //Example: Dad Cell
@property (nonatomic, assign) BOOL isPreferred; //Example: 0
@property (nonatomic, weak) NSString *phoneNumber; //Example: 9195528298
@property (nonatomic, assign) BOOL isHidden; //Example: 0
@property (nonatomic, assign) NSInteger preferred; //Example: 0
@property (nonatomic, assign) NSInteger smsEnabled; //Example: 0
@property (nonatomic, weak) NSString *smsEmailAddress; //Example: 9195528298@txt.att.net
@property (nonatomic, weak) NSDate *createdAt; //Example: 2012-07-30T18:45:54Z
@property (nonatomic, assign) NSInteger contactId; //Example: 127451
@property (nonatomic, weak) NSDate *updatedAt; //Example: 2012-10-10T23:21:34Z
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, weak) NSString *smsGatewayId; //Example: at&t
@property (nonatomic, assign) NSInteger memberId; //Example: 993324
@property (nonatomic, weak) NSURL *linkSmsGateway;
@property (nonatomic, weak) NSURL *linkMember;
@property (nonatomic, weak) NSURL *linkTeam;
@property (nonatomic, weak) NSURL *linkContact;

@end

@interface TSDKContactPhoneNumber (ForwardedMethods)

-(void)getSmsGatewayWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberArrayCompletionBlock)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion;
-(void)getContactWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKContactArrayCompletionBlock)completion;

@end

