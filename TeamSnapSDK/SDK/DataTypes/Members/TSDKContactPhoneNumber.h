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

@property (nonatomic, weak) NSString *label; //Example: Cell
@property (nonatomic, weak) NSString *phoneNumber; //Example: 9192475214
@property (nonatomic) BOOL isHidden; //Example: 0
@property (nonatomic) NSInteger preferred; //Example: 0
@property (nonatomic) NSInteger smsEnabled; //Example: 1
@property (nonatomic, weak) NSString *smsEmailAddress; //Example: 9192475214@tmomail.net
@property (nonatomic, weak) NSDate *createdAt; //Example: 2013-03-19T22:43:00Z
@property (nonatomic) NSInteger contactId; //Example: 261839
@property (nonatomic, weak) NSDate *updatedAt; //Example: 2015-11-09T15:08:09Z
@property (nonatomic) NSInteger teamId; //Example: 153832
@property (nonatomic, weak) NSString *smsGatewayId; //Example: t-mobile
@property (nonatomic) NSInteger memberId; //Example: 1943020
@property (nonatomic, weak) NSURL *linkSmsGateway;
@property (nonatomic, weak) NSURL *linkMember;
@property (nonatomic, weak) NSURL *linkTeam;
@property (nonatomic, weak) NSURL *linkContact;


-(void)getSmsGatewayWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getMemberWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getTeamWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getContactWithCompletion:(TSDKArrayCompletionBlock)completion;

@end
