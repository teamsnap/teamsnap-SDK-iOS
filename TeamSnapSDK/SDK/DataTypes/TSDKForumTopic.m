//
//  TSDKForumTopic.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 9/1/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKForumTopic.h"

@implementation TSDKForumTopic
@dynamic title, isAnnouncement, teamId, linkForumSubscriptions, linkTeam, linkForumPosts;

+ (NSString *)SDKType {
    return @"forum_topic";
}

@end
