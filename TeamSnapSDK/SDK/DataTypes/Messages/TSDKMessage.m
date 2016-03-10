//
//  TSDKMessage.m
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 3/9/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKMessage.h"
#import "TSDKMember.h"

@implementation TSDKMessage

@dynamic body, recipients, recipientNames, subject, memberId, smsed, emailed, readAt, createdAt, userId, pushed, contactId, updatedAt, teamId, senderId, status, flags, linkMember, linkSender, linkTeam, linkUser;

+ (NSString *)SDKType {
    return @"message";
}

+ (void)actionMarkMessageAsRead:(TSDKMessage *)message completion:(TSDKCompletionBlock)completion {    
    TSDKCollectionCommand *command = [[TSDKMessage commands] objectForKey:@"mark_message_as_read"];
    command.data[@"id"] = [NSNumber numberWithInteger:message.objectIdentifier];
    
    [command executeWithCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
        if (completion) {
            completion(success, complete, objects, error);
        }
    }];
}

@end
