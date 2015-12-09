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

@property (nonatomic) NSInteger teamId; //Example: 153832
@property (nonatomic, weak) NSDate *updatedAt; //Example: 2015-06-22T15:04:04Z
@property (nonatomic) NSInteger receivesTeamEmails; //Example: 1
@property (nonatomic, weak) NSDate *createdAt; //Example: 2013-03-19T22:43:00Z
@property (nonatomic, weak) NSString *email; //Example: jason@jasonr.com
@property (nonatomic) BOOL isHidden; //Example: 0
@property (nonatomic, weak) NSString *label; //Example: Home
@property (nonatomic) NSInteger contactId; //Example: 261839
@property (nonatomic) NSInteger memberId; //Example: 1943020
@property (nonatomic, weak) NSURL *linkContact;
@property (nonatomic, weak) NSURL *linkMember;
@property (nonatomic, weak) NSURL *linkTeam;

@end
