//
//  TSDKMessage.m
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 3/9/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKMessage.h"
#import "TSDKMember.h"
#import "TSDKContact.h"

@interface TSDKMessage()

@property (nonatomic, weak) NSString *messageType; //Example: Email

@end

@implementation TSDKMessage

@dynamic flags, messageSourceId, createdAt, messageType, senderName, teamId, lastReplySenderName, body, senderId, subject, isDraft, recipients, attachmentNames, recipientNames, divisionId, lastReplyRecipients, lastReplyRecipientNames, pushed, attachmentCount, messageId, threadUnreadCount, replyStatus, lastReplyCreatedAt, status, lastReplySenderId, userId, updatedAt, threadTotalCount, contactId, lastReplyBody, senderType, emailed, directReplyStatus, memberId, smsed, readAt, threadId, linkAttachments, linkMember, linkSender, linkDivision, linkTeam, linkUser, linkMessageReplies, linkSenderPhotoFile, linkLastReplySenderPhotoFile;

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

- (TSDKMessageReplyStatus)replyStatus {
    NSNumber *value = [[self.collection data] objectForKey:@"reply_status"];
    switch (value.integerValue) {
        case 0:
            return TSDKMessageReplyStatusReplyable;
            break;
        case 1:
            return TSDKMessageReplyStatusNotReplyableLimitReached;
            break;
        case 2:
            return TSDKMessageReplyStatusNotReplyableCommissionerSent;
            break;
        case  3:
            return TSDKMessageReplyStatusNotReplyableSenderNotEmailable;
        default:
            return TSDKMessageReplyStatusReplyable;
            break;
    }
}

- (TSDKMessageReplyStatus)directReplyStatus {
    NSNumber *value = [[self.collection data] objectForKey:@"direct_Reply_Status"];
    switch (value.integerValue) {
        case 0:
            return TSDKMessageReplyStatusReplyable;
            break;
        case 1:
            return TSDKMessageReplyStatusNotReplyableLimitReached;
            break;
        case 2:
            return TSDKMessageReplyStatusNotReplyableCommissionerSent;
            break;
        case  3:
            return TSDKMessageReplyStatusNotReplyableSenderNotEmailable;
        default:
            return TSDKMessageReplyStatusReplyable;
            break;
    }
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

- (void)getMessageRepliesWithConfiguration:(TSDKRequestConfiguration * _Nullable)configuration messageRecipient:(id<TSDKMessageRecipient> _Nonnull)messageRecipient completion:(TSDKMessagesArrayCompletionBlock _Nonnull)completion {
    NSDictionary *searchParams;
    
    if([messageRecipient isKindOfClass:[TSDKMember class]]) {
        searchParams = @{@"member_id": messageRecipient.objectIdentifier};
    } else if([messageRecipient isKindOfClass:[TSDKContact class]]) {
        searchParams = @{@"contact_id": messageRecipient.objectIdentifier};
    }
    
    [self arrayFromLink:self.linkMessageReplies searchParams:searchParams withConfiguration:configuration completion:completion];
}


@end
