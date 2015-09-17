// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKBroadcastEmail : TSDKCollectionObject



@property (nonatomic, weak) NSString *attachmentCount; //Example: **NULL**
@property (nonatomic, weak) NSString *body; //Example: <p>Test Email!</p>
@property (nonatomic, weak) NSString *subject; //Example: Email #1
@property (nonatomic, weak) NSDate *createdAt; //Example: 2012-05-25T18:18:54Z
@property (nonatomic) NSInteger recipientCount; //Example: 1
@property (nonatomic, weak) NSString *recipientNames; //Example: Aiden R
@property (nonatomic) BOOL isDraft; //Example: 0
@property (nonatomic, weak) NSDate *updatedAt; //Example: 2012-05-25T18:18:54Z
@property (nonatomic, weak) NSString *attachmentNames; //Example:
@property (nonatomic) NSInteger teamId; //Example: 71118
@property (nonatomic) BOOL isSms; //Example: 0
@property (nonatomic) NSInteger memberId; //Example: 993324
@property (nonatomic, weak) NSURL *linkBroadcastEmailAttachments;
@property (nonatomic, weak) NSURL *linkTeam;
@property (nonatomic, weak) NSURL *linkMember;

@end
