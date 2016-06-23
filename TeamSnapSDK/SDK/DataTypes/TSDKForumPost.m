//
//  TSDKForumPost.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 9/1/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKForumPost.h"
#import "TSDKTeamSnap.h"
#import "TSDKDataRequest.h"
#import "TSDKRootLinks.h"

@implementation TSDKForumPost
@dynamic wasBroadcasted, createdAt, posterName, message, memberId, forumTopicId, divisionMemberId, updatedAt, linkMember, linkForumTopic, linkTeam, linkDivisionMember, teamId;

+ (NSString *)SDKType {
    return @"forum_post";
}

+ (void)savePost:(TSDKForumPost *)post broadcastToTeam:(BOOL)broadcastToTeam completion:(TSDKSaveCompletionBlock)completion {
    [post setInteger:post.forumTopicId forKey:@"forum_topic_id"];
    [post setInteger:post.memberId forKey:@"member_id"];
    [post setString:post.message forKey:@"message"];
    [post setBool:broadcastToTeam forKey:@"broadcast_to_team"];
    [post saveWithCompletion:completion];
}

-(void)setMessage:(NSString *)message {
    NSError* error = NULL;
    NSString* pattern = @"<br ?/?>";
    NSRegularExpression* brExpression = [NSRegularExpression regularExpressionWithPattern:pattern
                                                                                  options:NSRegularExpressionCaseInsensitive
                                                                                    error:&error];
    NSUInteger matchCount = [brExpression numberOfMatchesInString:message options:0 range:NSMakeRange(0, [message length])];
    
    if(matchCount > 0) {
        [super setString:message forKey:@"message"];
    } else {
        [super setString:[message stringByReplacingOccurrencesOfString:@"\n" withString:@"<br/>"] forKey:@"message"];
    };
}

- (BOOL)isEqual:(id)anObject {
    if([anObject isKindOfClass:[TSDKForumPost class]]) {
        return self.objectIdentifier == ((TSDKForumPost *)anObject).objectIdentifier;
    } else {
        return [self isEqual:anObject];
    }
}

- (NSUInteger)hash {
    return self.objectIdentifier;
}

@end
