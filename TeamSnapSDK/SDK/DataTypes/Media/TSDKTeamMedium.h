//
//  TSDKTeamMedium.h
//  TeamSnapSDK
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKTeamMedium : TSDKCollectionObject

@property (nonatomic, weak) NSString *_Nullable teamMediumDescription; //Example: Ball
@property (nonatomic, assign) NSInteger position; //Example: 1
@property (nonatomic, weak) NSURL *_Nullable mediumUrl; //Example:
@property (nonatomic, weak) NSDate *_Nullable createdAt; //Example: 2012-03-31T01:27:34Z
@property (nonatomic, assign) NSInteger teamMediaGroupId; //Example: 56194
@property (nonatomic, weak) NSString *_Nullable mediaFormat; //Example: image
@property (nonatomic, weak) NSDate *_Nullable updatedAt; //Example: 2012-06-01T09:09:20Z
@property (nonatomic, assign) BOOL isPrivate; //Example: 0
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, assign) NSInteger memberId; //Example: 993324
@property (nonatomic, weak) NSURL *_Nullable linkMember;
@property (nonatomic, weak) NSURL *_Nullable linkMedium;
@property (nonatomic, weak) NSURL *_Nullable linkMediumThumbnail;
@property (nonatomic, weak) NSURL *_Nullable linkTeamMediumComments;
@property (nonatomic, weak) NSURL *_Nullable linkMediumMidsizeThumbnail;
@property (nonatomic, weak) NSURL *_Nullable linkTeam;
@property (nonatomic, weak) NSURL *_Nullable linkMediumSmallThumbnail;
@property (nonatomic, weak) NSURL *_Nullable linkTeamMediaGroup;
@property (nonatomic, weak) NSURL *_Nullable linkMediumMidsize;

//+(void)actionBulkDeleteTeamMediaWithCompletion:(TSDKCompletionBlock)completion; //(null)
//+(void)actionSetMediumAsTeamPhotoWithCompletion:(TSDKCompletionBlock)completion; //(null)
//+(void)actionCreateTeamVideoLinkWithCompletion:(TSDKCompletionBlock)completion; //(null)
//+(void)actionFacebookShareTeamMediumWithCompletion:(TSDKCompletionBlock)completion; //(null)
//+(void)actionAssignMediaToGroupWithCompletion:(TSDKCompletionBlock)completion; //(null)
//+(void)actionReorderTeamMediaWithCompletion:(TSDKCompletionBlock)completion; //(null)
//+(void)actionRotateTeamMediumImageWithCompletion:(TSDKCompletionBlock)completion; //(null)
//+(void)actionSetMediumAsMemberPhotoWithCompletion:(TSDKCompletionBlock)completion; //(null)
//+(void)actionUploadTeamMediumWithCompletion:(TSDKCompletionBlock)completion; //(null)

@end

@interface TSDKTeamMedium (ForwardedMethods)

-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberArrayCompletionBlock _Nullable)completion;
-(void)getMediumWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getMediumThumbnailWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getTeamMediumCommentsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamMediumCommentArrayCompletionBlock _Nullable)completion;
-(void)getMediumMidsizeThumbnailWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;
-(void)getMediumSmallThumbnailWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getTeamMediaGroupWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamMediaGroupArrayCompletionBlock _Nullable)completion;
-(void)getMediumMidsizeWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;


@end
