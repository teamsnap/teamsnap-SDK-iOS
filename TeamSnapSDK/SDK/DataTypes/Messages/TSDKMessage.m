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

@dynamic status, memberId, userId, updatedAt, subject, senderType, recipientNames, flags, body, pushed, contactId, messageId, emailed, readAt, recipients, createdAt, smsed, divisionId, senderId, teamId, linkMember, linkDivision, linkTeam, linkUser;

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
