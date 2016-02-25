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
@dynamic wasBroadcasted, createdAt, posterName, message, memberId, forumTopicId, divisionMemberId, updatedAt, linkMember, linkForumTopic, linkTeam, linkDivisionMember;

+ (NSString *)SDKType {
    return @"forum_post";
}

+(void)addPost:(TSDKForumPost *)post withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKCompletionBlock)completion {
    NSMutableDictionary *data = [[NSMutableDictionary alloc] init];
    [data setObject:[NSNumber numberWithInteger:post.forumTopicId] forKey:@"forum_topic_id"];
    //[data setObject:[NSNumber numberWithInteger:post.divisionMemberId] forKey:@"division_member_id"];
    [data setObject:[NSNumber numberWithInteger:post.memberId] forKey:@"member_id"];
    [data setObject:post.message forKey:@"message"];
    [data setObject:[NSNumber numberWithBool:post.wasBroadcasted] forKey:@"broadcast_to_team"];
    NSDictionary *postObject = [TSDKCollectionJSON dictionaryToCollectionJSON:data];
    
    [TSDKDataRequest requestObjectsForPath:[[[TSDKTeamSnap sharedInstance] rootLinks] linkForumPosts] sendDataDictionary:postObject method:@"POST" withCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
        if (completion) {
            completion(success, complete, objects, error);
        }
    }];
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

@end
