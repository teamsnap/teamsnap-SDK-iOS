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

@interface TSDKMessage : TSDKCollectionObject

@property (nonatomic, weak) NSString *status; //Example: sent
@property (nonatomic, assign) NSInteger memberId; //Example: 166
@property (nonatomic, assign) NSInteger userId; //Example: 7
@property (nonatomic, weak) NSDate *updatedAt; //Example: 2016-03-09T18:41:43Z
@property (nonatomic, weak) NSString *subject; //Example: **NULL**
@property (nonatomic, weak) NSString *senderType; //Example: **NULL**
@property (nonatomic, weak) NSString *recipientNames; //Example: **NULL**
@property (nonatomic, assign) NSInteger flags; //Example: 0
@property (nonatomic, weak) NSString *body; //Example: Test!
@property (nonatomic, assign) NSInteger pushed; //Example: 0
@property (nonatomic, weak) NSString *contactId; //Example: **NULL**
@property (nonatomic, assign) NSInteger messageId; //Example: 2
@property (nonatomic, assign) NSInteger emailed; //Example: 0
@property (nonatomic, weak) NSDate *readAt; //Example: 2016-03-09T18:41:43Z
@property (nonatomic, weak) NSArray *recipients;
@property (nonatomic, weak) NSDate *createdAt; //Example: 2016-03-09T18:41:43Z
@property (nonatomic, assign) NSInteger smsed; //Example: 0
@property (nonatomic, weak) NSString *divisionId; //Example: **NULL**
@property (nonatomic, assign) NSInteger senderId; //Example: 166
@property (nonatomic, assign) NSInteger teamId; //Example: 11
@property (nonatomic, weak) NSURL *linkMember;
@property (nonatomic, weak) NSURL *linkDivision;
@property (nonatomic, weak) NSURL *linkTeam;
@property (nonatomic, weak) NSURL *linkUser;

+ (void)actionMarkMessageAsRead:(TSDKMessage * _Nonnull)message completion:(TSDKCompletionBlock _Nullable)completion;

@end

@interface TSDKMessage (ForwardedMethods)

- (void)getMemberWithConfiguration:(TSDKRequestConfiguration * _Nullable)configuration completion:(TSDKMemberArrayCompletionBlock _Nullable)completion;
- (void)getSenderWithConfiguration:(TSDKRequestConfiguration * _Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
- (void)getTeamWithConfiguration:(TSDKRequestConfiguration * _Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;
- (void)getUserWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKUserArrayCompletionBlock _Nullable)completion;


@end