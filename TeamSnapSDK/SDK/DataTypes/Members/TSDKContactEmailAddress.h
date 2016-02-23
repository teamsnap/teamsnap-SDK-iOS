//
//  TSDKContactEmailAddress.h
//  TeamSnapSDK
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKContactEmailAddress : TSDKCollectionObject

@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, weak) NSDate *updatedAt; //Example: 2015-12-10T13:18:44Z
@property (nonatomic, assign) NSInteger receivesTeamEmails; //Example: 0
@property (nonatomic, weak) NSDate *createdAt; //Example: 2012-09-03T14:42:19Z
@property (nonatomic, weak) NSString *email; //Example: jason@jasonr.com
@property (nonatomic, assign) BOOL isHidden; //Example: 1
@property (nonatomic, weak) NSString *label; //Example: Home
@property (nonatomic, assign) NSInteger contactId; //Example: 150647
@property (nonatomic, assign) NSInteger memberId; //Example: 1086731
@property (nonatomic, weak) NSURL *linkContact;
@property (nonatomic, weak) NSURL *linkMember;
@property (nonatomic, weak) NSURL *linkTeam;

@end

@interface TSDKContactEmailAddress (ForwardedMethods)

-(void)getContactWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKContactArrayCompletionBlock)completion;
-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberArrayCompletionBlock)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion;


@end