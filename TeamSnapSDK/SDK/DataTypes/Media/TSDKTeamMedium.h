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

@property (nonatomic, weak) NSString *teamMediumDescription; //Example: Ball
@property (nonatomic, assign) NSInteger position; //Example: 1
@property (nonatomic, weak) NSURL *mediumUrl; //Example:
@property (nonatomic, weak) NSDate *createdAt; //Example: 2012-03-31T01:27:34Z
@property (nonatomic, assign) NSInteger teamMediaGroupId; //Example: 56194
@property (nonatomic, weak) NSString *mediaFormat; //Example: image
@property (nonatomic, weak) NSDate *updatedAt; //Example: 2012-06-01T09:09:20Z
@property (nonatomic, assign) BOOL isPrivate; //Example: 0
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, assign) NSInteger memberId; //Example: 993324
@property (nonatomic, weak) NSURL *linkMember;
@property (nonatomic, weak) NSURL *linkMedium;
@property (nonatomic, weak) NSURL *linkMediumThumbnail;
@property (nonatomic, weak) NSURL *linkTeamMediumComments;
@property (nonatomic, weak) NSURL *linkMediumMidsizeThumbnail;
@property (nonatomic, weak) NSURL *linkTeam;
@property (nonatomic, weak) NSURL *linkMediumSmallThumbnail;
@property (nonatomic, weak) NSURL *linkTeamMediaGroup;
@property (nonatomic, weak) NSURL *linkMediumMidsize;

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

-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberArrayCompletionBlock)completion;
-(void)getMediumWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getMediumThumbnailWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getTeamMediumCommentsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamMediumCommentArrayCompletionBlock)completion;
-(void)getMediumMidsizeThumbnailWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion;
-(void)getMediumSmallThumbnailWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getTeamMediaGroupWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamMediaGroupArrayCompletionBlock)completion;
-(void)getMediumMidsizeWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;


@end
