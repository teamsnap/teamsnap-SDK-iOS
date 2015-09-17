// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKAssignment : TSDKCollectionObject



@property (nonatomic) NSInteger teamId; //Example: 71118
@property (nonatomic) NSInteger memberId; //Example: 1086731
@property (nonatomic, weak) NSString *assignmentDescription; //Example: Water or Gatorade
@property (nonatomic) NSInteger eventId; //Example: 2781974
@property (nonatomic, weak) NSURL *linkEvent;
@property (nonatomic, weak) NSURL *linkMember;
@property (nonatomic, weak) NSURL *linkTeam;

@end
