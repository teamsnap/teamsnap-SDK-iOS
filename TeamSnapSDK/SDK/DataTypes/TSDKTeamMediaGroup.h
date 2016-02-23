//
//  TSDKTeamMediaGroup.h
//  TeamSnapSDK
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKTeamMediaGroup : TSDKCollectionObject

@property (nonatomic, assign) NSInteger position; //Example: 2
@property (nonatomic, assign) NSInteger lastTeamMediumPosition; //Example: 2
@property (nonatomic, assign) BOOL isPrivate; //Example: 0
@property (nonatomic, weak) NSString *mediaFormat; //Example: image
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, assign) NSInteger countTeamMedia; //Example: 15
@property (nonatomic, weak) NSString *name; //Example: Mobile Uploads
@property (nonatomic, weak) NSURL *linkTeamMedia;
@property (nonatomic, weak) NSURL *linkPreviewMedium;
@property (nonatomic, weak) NSURL *linkTeam;
@property (nonatomic, weak) NSURL *linkPreviewMediumThumbnail;

//+(void)actionFacebookShareTeamMediaGroupWithCompletion:(TSDKCompletionBlock)completion; //(null)
//+(void)actionReorderTeamMediaGroupsWithCompletion:(TSDKCompletionBlock)completion; //(null)

@end

@interface TSDKTeamMediaGroup (ForwardedMethods)

-(void)getTeamMediaWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getPreviewMediumWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion;
-(void)getPreviewMediumThumbnailWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;

@end