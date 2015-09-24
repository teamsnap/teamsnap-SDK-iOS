//
//  TSDKForumPost.h
//  SDKPlayground
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKForumPost : TSDKCollectionObject

@property (nonatomic, weak) NSString *wasBroadcasted; //Example: **NULL**
@property (nonatomic, weak) NSDate *createdAt; //Example: 2012-05-25T18:19:51Z
@property (nonatomic, weak) NSString *posterName; //Example: Jason R
@property (nonatomic, weak) NSString *message; //Example: <p>This is a test post!</p>
@property (nonatomic) NSInteger memberId; //Example: 993324
@property (nonatomic) NSInteger forumTopicId; //Example: 611875
@property (nonatomic, weak) NSString *divisionMemberId; //Example: **NULL**
@property (nonatomic, weak) NSDate *updatedAt; //Example: 2013-02-08T18:22:04Z
@property (nonatomic, weak) NSURL *linkMember;
@property (nonatomic, weak) NSURL *linkForumTopic;
@property (nonatomic, weak) NSURL *linkTeam;
@property (nonatomic, weak) NSURL *linkDivisionMember;

@end