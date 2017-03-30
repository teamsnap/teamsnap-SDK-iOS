//
//  TSDKMessage.h
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 3/9/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"
@protocol TSDKMessageRecipient;

typedef NS_ENUM(NSUInteger, TSDKMessageType) {
    TSDKMessageTypeAlert,
    TSDKMessageTypeEmail,
    TSDKMessageTypeUnknown
};

typedef NS_ENUM(NSUInteger, TSDKMessageTypeFilter) {
    TSDKMessageTypeFilterAll,
    TSDKMessageTypeFilterEmail,
    TSDKMessageTypeFilterAlert,
};

@interface TSDKMessage : TSDKCollectionObject

@property (nonatomic, assign) NSInteger flags; //Example: 128
@property (nonatomic, weak) NSString *_Nullable messageSourceId; //Example: 72
@property (nonatomic, weak) NSDate *_Nullable createdAt; //Example: 2017-02-27T17:52:28Z
@property (nonatomic, weak) NSString *_Nullable senderName; //Example: Manny Manager
@property (nonatomic, weak) NSString *_Nullable teamId; //Example: 5
@property (nonatomic, weak) NSString *_Nullable lastReplySenderName; //Example: **NULL**
@property (nonatomic, weak) NSString *_Nullable body; //Example: This is the 2nd message in the thread. It's a reply. This should be grouped.
@property (nonatomic, weak) NSString *_Nullable senderId; //Example: 131
@property (nonatomic, weak) NSString *_Nullable subject; //Example: The top-level message's subject
@property (nonatomic, assign) BOOL isDraft; //Example: 0
@property (nonatomic, weak) NSArray *_Nullable recipients;
@property (nonatomic, weak) NSString *_Nullable attachmentNames; //Example: **NULL**
@property (nonatomic, weak) NSString *_Nullable recipientNames; //Example: Ownie Owner,  , Plato Player, Player Labeled, Uninvited 0 Player, Uninvited 1 Player, Uninvited 2 Player, Invited 0 Player, Invited 1 Player, Invited 2 Player, FB User Scoreposter, FB User Wins ONLY Scoreposter, FB User NOT Scoreposter, Non Player, Test Player
@property (nonatomic, weak) NSString *_Nullable divisionId; //Example: <null>
@property (nonatomic, weak) NSString *_Nullable lastReplyRecipients; //Example: **NULL**
@property (nonatomic, weak) NSString *_Nullable lastReplyRecipientNames; //Example: **NULL**
@property (nonatomic, assign) NSInteger pushed; //Example: 0
@property (nonatomic, assign) NSInteger attachmentCount; //Example: **NULL**
@property (nonatomic, weak) NSString *_Nullable messageId; //Example: 72
@property (nonatomic, assign) NSInteger threadUnreadCount; //Example: **NULL**
@property (nonatomic, assign) NSInteger replyStatus; //Example: 0
@property (nonatomic, weak) NSDate *_Nullable lastReplyCreatedAt; //Example: <null>
@property (nonatomic, weak) NSString *_Nullable status; //Example: sent
@property (nonatomic, weak) NSString *_Nullable lastReplySenderId; //Example: <null>
@property (nonatomic, weak) NSString *_Nullable userId; //Example: 7
@property (nonatomic, weak) NSDate *_Nullable updatedAt; //Example: 2017-02-27T17:52:28Z
@property (nonatomic, assign) NSInteger threadTotalCount; //Example: **NULL**
@property (nonatomic, weak) NSString *_Nullable contactId; //Example: <null>
@property (nonatomic, weak) NSString *_Nullable lastReplyBody; //Example: **NULL**
@property (nonatomic, weak) NSString *_Nullable senderType; //Example: Member
@property (nonatomic, assign) NSInteger emailed; //Example: 0
@property (nonatomic, weak) NSString *_Nullable memberId; //Example: 131
@property (nonatomic, assign) NSInteger smsed; //Example: 0
@property (nonatomic, weak) NSDate *_Nullable readAt; //Example: 2017-02-27T17:52:28Z
@property (nonatomic, weak) NSString *_Nullable threadId; //Example: 71
@property (nonatomic, assign) BOOL isDirectlyReplyable;
@property (nonatomic, weak) NSURL *_Nullable linkMember;
@property (nonatomic, weak) NSURL *_Nullable linkSender;
@property (nonatomic, weak) NSURL *_Nullable linkDivision;
@property (nonatomic, weak) NSURL *_Nullable linkSenderPhotoFile;
@property (nonatomic, weak) NSURL *_Nullable linkLastReplySenderPhotoFile;
@property (nonatomic, weak) NSURL *_Nullable linkTeam;
@property (nonatomic, weak) NSURL *_Nullable linkAttachments;
@property (nonatomic, weak) NSURL *_Nullable linkMessageReplies;
@property (nonatomic, weak) NSURL *_Nullable linkUser;

//Delete several messages with a single command.
//+(void)actionBulkDeleteId:(NSString *_Nonnull)id WithCompletion:(TSDKCompletionBlock _Nullable)completion;

//Mark a message as read.
//+(void)actionMarkMessageAsReadId:(NSString *_Nonnull)id WithCompletion:(TSDKCompletionBlock _Nullable)completion;

// not auto generated
+ (void)actionMarkMessagesAsRead:(NSArray <TSDKMessage *> * _Nonnull)messages completion:(TSDKCompletionBlock _Nullable)completion;
+ (void)actionMarkMessageAsRead:(TSDKMessage * _Nonnull)message completion:(TSDKCompletionBlock _Nullable)completion;
- (void)markMessageAsReadWithCompletion:(TSDKCompletionBlock _Nullable)completion;
- (TSDKMessageType)messageTypeValue;
- (void)getMessageRepliesWithConfiguration:(TSDKRequestConfiguration * _Nullable)configuration messageRecipient:(id<TSDKMessageRecipient> _Nonnull)messageRecipient completion:(TSDKMessagesArrayCompletionBlock _Nonnull)completion;

@end

@interface TSDKMessage (ForwardedMethods)

-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberArrayCompletionBlock _Nonnull)completion;
-(void)getSenderWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getSenderPhotoFileWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getLastReplySenderPhotoFileWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nonnull)completion;
-(void)getAttachmentsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getUserWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKUserArrayCompletionBlock _Nonnull)completion;

@end
