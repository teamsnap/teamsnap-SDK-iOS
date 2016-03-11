// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKMessageDatum : TSDKCollectionObject

@property (nonatomic, assign) NSInteger unreadCount; //Example: 0
@property (nonatomic, assign) NSInteger memberId; //Example: 102
@property (nonatomic, assign) NSInteger userId; //Example: 7
@property (nonatomic, assign) NSInteger teamId; //Example: 7
@property (nonatomic, weak) NSString *contactId; //Example: **NULL**
@property (nonatomic, weak) NSURL *linkTeam;
@property (nonatomic, weak) NSURL *linkUser;
@property (nonatomic, weak) NSURL *linkMember;

@end

@interface TSDKMessageDatum (ForwardedMethods)

-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion;
-(void)getUserWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKUserArrayCompletionBlock)completion;
-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberArrayCompletionBlock)completion;

@end
