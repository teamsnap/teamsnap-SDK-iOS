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
@property (nonatomic, weak) NSString *_Nullable mediaFormat; //Example: image
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, assign) NSInteger countTeamMedia; //Example: 15
@property (nonatomic, weak) NSString *_Nullable name; //Example: Mobile Uploads
@property (nonatomic, weak) NSURL *_Nullable linkTeamMedia;
@property (nonatomic, weak) NSURL *_Nullable linkPreviewMedium;
@property (nonatomic, weak) NSURL *_Nullable linkTeam;
@property (nonatomic, weak) NSURL *_Nullable linkPreviewMediumThumbnail;

//+(void)actionFacebookShareTeamMediaGroupWithCompletion:(TSDKCompletionBlock)completion; //(null)
//+(void)actionReorderTeamMediaGroupsWithCompletion:(TSDKCompletionBlock)completion; //(null)

@end

@interface TSDKTeamMediaGroup (ForwardedMethods)

-(void)getTeamMediaWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getPreviewMediumWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;
-(void)getPreviewMediumThumbnailWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;

@end
