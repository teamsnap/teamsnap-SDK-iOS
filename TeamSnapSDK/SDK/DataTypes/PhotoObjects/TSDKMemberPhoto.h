//
//  TSDKMemberPhoto.h
//  TeamSnapSDK
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKMemberPhoto : TSDKCollectionObject

@property (nonatomic, assign) NSInteger memberId; //Example: 993324
@property (nonatomic, assign) NSInteger originalFileSize; //Example: 1901963
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, weak) NSDate *updatedAt; //Example: 2014-09-19T23:32:39.000+00:00
@property (nonatomic, weak) NSURL *linkMember;
@property (nonatomic, weak) NSURL *linkImageUrl;
@property (nonatomic, weak) NSURL *linkTeam;
@property (nonatomic, weak) NSURL *linkUser;




@end

@interface TSDKMemberPhoto (ForwardedMethods)

-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberArrayCompletionBlock)completion;
-(void)getImageUrlWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion;
-(void)getUserWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKUserArrayCompletionBlock)completion;


@end
