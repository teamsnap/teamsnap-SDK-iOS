// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKBroadcastSms : TSDKCollectionObject

@property (nonatomic, weak) NSDate *updatedAt; //Example: 2012-05-25T18:16:56Z
@property (nonatomic) BOOL isDraft; //Example: 0
@property (nonatomic, weak) NSDate *createdAt; //Example: 2012-05-25T18:16:56Z
@property (nonatomic) NSInteger memberId; //Example: 993324
@property (nonatomic, weak) NSString *recipientNames; //Example: Aiden R
@property (nonatomic) NSInteger teamId; //Example: 71118
@property (nonatomic, weak) NSString *body; //Example: Test of SMS message
@property (nonatomic) NSInteger recipientCount; //Example: 1
@property (nonatomic, weak) NSURL *linkTeam;
@property (nonatomic, weak) NSURL *linkMember;

@end
