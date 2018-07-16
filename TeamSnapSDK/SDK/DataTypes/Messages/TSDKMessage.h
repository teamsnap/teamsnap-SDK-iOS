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

typedef NS_ENUM(NSUInteger, TSDKMessageType) {
    TSDKMessageTypeAlert,
    TSDKMessageTypeEmail,
    TSDKMessageTypeUnknown
};

@interface TSDKMessage : TSDKCollectionObject

@property (nonatomic, strong) NSString * _Nullable status; //Example: received
@property (nonatomic, strong) NSString *_Nullable memberId; //Example: 230
@property (nonatomic, strong) NSString *_Nullable userId; //Example: 11
@property (nonatomic, strong) NSDate * _Nullable updatedAt; //Example: 2016-03-15T21:53:00Z
@property (nonatomic, strong) NSString * _Nullable subject; //Example: **NULL**
@property (nonatomic, strong) NSString * _Nullable senderType; //Example: Member
@property (nonatomic, strong) NSString * _Nullable recipientNames; //Example:
@property (nonatomic, assign) NSInteger flags; //Example: 4
@property (nonatomic, strong) NSString * _Nullable body; //Example: Test
@property (nonatomic, assign) NSInteger pushed; //Example: 0
@property (nonatomic, strong) NSString * _Nullable contactId; //Example: **NULL**
@property (nonatomic, strong) NSString *_Nullable messageId; //Example: 4
@property (nonatomic, assign) NSInteger emailed; //Example: 1
@property (nonatomic, strong) NSDate * _Nullable readAt; //Example: 2016-03-15T21:53:00Z
@property (nonatomic, strong) NSString * _Nullable senderName; //Example: Manny Manager
@property (nonatomic, strong) NSArray * _Nullable recipients;
@property (nonatomic, strong) NSDate * _Nullable createdAt; //Example: 2016-03-15T18:40:09Z
@property (nonatomic, assign) NSInteger smsed; //Example: 0
@property (nonatomic, strong) NSString * _Nullable divisionId; //Example: **NULL**
@property (nonatomic, strong) NSString *_Nullable senderId; //Example: 166
@property (nonatomic, strong) NSString *_Nullable teamId; //Example: 11
@property (nonatomic, strong) NSURL * _Nullable linkMember;
@property (nonatomic, strong) NSURL * _Nullable linkSender;
@property (nonatomic, strong) NSURL * _Nullable linkDivision;
@property (nonatomic, strong) NSURL * _Nullable linkTeam;
@property (nonatomic, strong) NSURL * _Nullable linkUser;

// not auto generated
+ (void)actionMarkMessagesAsRead:(NSArray <TSDKMessage *> * _Nonnull)messages completion:(TSDKCompletionBlock _Nullable)completion;
+ (void)actionMarkMessageAsRead:(TSDKMessage * _Nonnull)message completion:(TSDKCompletionBlock _Nullable)completion;
- (void)markMessageAsReadWithCompletion:(TSDKCompletionBlock _Nullable)completion;
- (TSDKMessageType)messageTypeValue;

@end

@interface TSDKMessage (ForwardedMethods)

- (void)getMemberWithConfiguration:(TSDKRequestConfiguration * _Nullable)configuration completion:(TSDKMemberArrayCompletionBlock _Nullable)completion;
- (void)getSenderWithConfiguration:(TSDKRequestConfiguration * _Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
- (void)getTeamWithConfiguration:(TSDKRequestConfiguration * _Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;
- (void)getUserWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKUserArrayCompletionBlock _Nullable)completion;


@end
