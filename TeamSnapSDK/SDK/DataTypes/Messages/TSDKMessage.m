//
//  TSDKMessage.m
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 3/9/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKMessage.h"
#import "TSDKMember.h"

@interface TSDKMessage()

@property (nonatomic, weak) NSString *messageType; //Example: Email

@end

@implementation TSDKMessage

@dynamic flags, messageSourceId, createdAt, messageType, senderName, teamId, lastReplySenderName, body, senderId, subject, isDraft, recipients, attachmentNames, recipientNames, divisionId, lastReplyRecipients, lastReplyRecipientNames, pushed, attachmentCount, messageId, threadUnreadCount, isReplyable, lastReplyCreatedAt, status, lastReplySenderId, userId, updatedAt, threadTotalCount, contactId, lastReplyBody, senderType, emailed, memberId, smsed, readAt, threadId, linkAttachments, linkMember, linkSender, linkDivision, linkTeam, linkUser;
+ (NSString *)SDKType {
    return @"message";
}

- (TSDKMessageType)messageTypeValue {
    if([[self.messageType lowercaseString] isEqualToString:[@"Alert" lowercaseString]]) {
        return TSDKMessageTypeAlert;
    } else if([[self.messageType lowercaseString] isEqualToString:[@"Email" lowercaseString]]) {
        return TSDKMessageTypeEmail;
    } else {
        return TSDKMessageTypeUnknown;
    }
}

- (NSInteger)threadTotalCount {
    if ((!self.collection.data[@"thread_unread_count"]) || ([self.collection.data[@"thread_unread_count"] isEqual:[NSNull null]])) {
        return 0;
    }
    NSNumber *value = self.collection.data[@"thread_unread_count"];
    return value.integerValue;
}

+ (void)actionMarkMessageAsRead:(TSDKMessage *)message completion:(TSDKCompletionBlock)completion {
    TSDKCollectionCommand *command = [[TSDKMessage commands] objectForKey:@"mark_message_as_read"];
    command.data[@"id"] = message.objectIdentifier;
    
    [command executeWithCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
        if (completion) {
            completion(success, complete, objects, error);
        }
    }];
}

+ (void)actionMarkMessagesAsRead:(NSArray <TSDKMessage *> *)messages completion:(TSDKCompletionBlock)completion {
    TSDKCollectionCommand *command = [[TSDKMessage commands] objectForKey:@"mark_message_as_read"];

    NSMutableString *commaSeparatedIds = [[NSMutableString alloc] init];
    for(TSDKMessage *message in messages) {
        if(message == [messages lastObject]) {
            [commaSeparatedIds appendString:message.objectIdentifier];
        } else {
            [commaSeparatedIds appendString:message.objectIdentifier];
        }
    }
    
    command.data[@"id"] = commaSeparatedIds;
    
    [command executeWithCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
        if (completion) {
            completion(success, complete, objects, error);
        }
    }];
}


- (void)markMessageAsReadWithCompletion:(TSDKCompletionBlock _Nullable)completion {
    [TSDKMessage actionMarkMessageAsRead:self completion:completion];
}

@end
