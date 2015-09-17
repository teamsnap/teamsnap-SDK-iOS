//
//  TSDKForumPost.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 9/1/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKForumPost.h"

@implementation TSDKForumPost
@dynamic wasBroadcasted, createdAt, posterName, message, memberId, forumTopicId, divisionMemberId, updatedAt, linkMember, linkForumTopic, linkTeam, linkDivisionMember;

+ (NSString *)SDKType {
    return @"forum_post";
}

@end
