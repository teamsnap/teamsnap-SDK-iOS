//
//  TSDKForumSubscription.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 2/23/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKForumSubscription.h"

@implementation TSDKForumSubscription

@dynamic memberId, updatedAt, forumTopicId, linkTeam, linkMember, linkForumTopic;

+ (NSString *)SDKType {
    return @"forum_subscription";
}

@end
