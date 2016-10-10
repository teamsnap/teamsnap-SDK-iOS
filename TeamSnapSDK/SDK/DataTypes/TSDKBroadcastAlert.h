// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"
#import "TSDKMessageSender.h"

@interface TSDKBroadcastAlert : TSDKCollectionObject

@property (nonatomic, weak) NSDate *_Nullable updatedAt; //Example: 2012-05-25T18:16:56Z
@property (nonatomic, assign) BOOL isDraft; //Example: 0
@property (nonatomic, weak) NSDate *_Nullable createdAt; //Example: 2012-05-25T18:16:56Z
@property (nonatomic, assign) NSInteger memberId; //Example: 993324
@property (nonatomic, weak) NSString *_Nullable recipientNames; //Example: Aiden R
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, weak) NSString *_Nullable body; //Example: Test of SMS message
@property (nonatomic, assign) NSInteger recipientCount; //Example: 1
@property (nonatomic, weak) NSURL *_Nullable linkTeam;
@property (nonatomic, weak) NSURL *_Nullable linkMember;

- (instancetype _Nullable)initWithBody:(NSString *_Nonnull)body teamId:(NSInteger)teamId recipients:(NSArray <TSDKMember *>*_Nonnull)recipients sender:(id<TSDKMessageSender>_Nonnull)sender;

@end

@interface TSDKBroadcastAlert (ForwardedMethods)

-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;
-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberArrayCompletionBlock _Nullable)completion;


@end
