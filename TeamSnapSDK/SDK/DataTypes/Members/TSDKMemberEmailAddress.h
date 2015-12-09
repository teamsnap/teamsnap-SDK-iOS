//
//  TSDKMemberEmailAddress.h
//  TeamSnapSDK
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKMemberEmailAddress : TSDKCollectionObject

@property (nonatomic) NSInteger teamId; //Example: 153832
@property (nonatomic, weak) NSDate *updatedAt; //Example: 2015-06-22T15:03:54Z
@property (nonatomic) NSInteger receivesTeamEmails; //Example: 1
@property (nonatomic, weak) NSDate *createdAt; //Example: 2013-03-19T22:36:41Z
@property (nonatomic, weak) NSString *email; //Example: Jason@jasonr.com
@property (nonatomic) BOOL isHidden; //Example: 0
@property (nonatomic, weak) NSString *label; //Example:
@property (nonatomic) NSInteger memberId; //Example: 1943020
@property (nonatomic) BOOL isInvited; //Example: 0
@property (nonatomic, weak) NSURL *linkMember;
@property (nonatomic, weak) NSURL *linkTeam;


-(void)getMemberWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getTeamWithCompletion:(TSDKArrayCompletionBlock)completion;

@end
