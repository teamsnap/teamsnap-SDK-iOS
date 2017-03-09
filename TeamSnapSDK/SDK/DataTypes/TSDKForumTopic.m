//
//  TSDKForumTopic.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 9/1/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKForumTopic.h"
#import "TSDKTeamSnap.h"
#import "TSDKDataRequest.h"
#import "TSDKRootLinks.h"
#import "TSDKForumPost.h"

@implementation TSDKForumTopic
@dynamic title, isAnnouncement, teamId, linkForumSubscriptions, linkTeam, linkForumPosts;

+ (NSString *)SDKType {
    return @"forum_topic";
}

+(void)addNewTopicWithTitle:(NSString *)title isAnnouncement:(BOOL)isAnnouncement forTeamId:(NSString *_Nonnull)teamId withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKCompletionBlock)completion {
    NSMutableDictionary *data = [[NSMutableDictionary alloc] init];
    if (title && title.length>0) {
        [data setObject:title forKey:@"title"];
    }
    if (isAnnouncement) {
        [data setObject:@"true" forKey:@"is_announcement"];
    } else {
        [data setObject:@"false" forKey:@"is_announcement"];
    }
    
    [data setObject:teamId forKey:@"team_id"];
    NSDictionary *postObject = [TSDKCollectionJSON dictionaryToCollectionJSON:[data copy]];

    [TSDKDataRequest requestObjectsForPath:[[[TSDKTeamSnap sharedInstance] rootLinks] linkForumTopics] sendDataDictionary:postObject method:@"POST" withConfiguration:configuration completion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
        if (completion) {
            completion(success, complete, objects, error);
        }
    }];
}

@end
