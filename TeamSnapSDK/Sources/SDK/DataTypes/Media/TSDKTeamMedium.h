//
//  TSDKTeamMedium.h
//  TeamSnapSDK
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"
#import "TSDKTeamMediaGroup.h"

@interface TSDKTeamMedium : TSDKCollectionObject

@property (nonatomic, strong) NSString *_Nullable teamMediumDescription; //Example: Ball
@property (nonatomic, assign) NSInteger originalFileSize; //Example: 5176834
@property (nonatomic, assign) NSInteger position; //Example: 1
@property (nonatomic, strong) NSURL *_Nullable mediumUrl; //Example: https://storage.googleapis.com/ts_assets_prod-user_files/3263711/original/upload_133315715520120601-24224-1knpgia-0.jpg
@property (nonatomic, strong) NSDate *_Nullable createdAt; //Example: 2012-03-31T01:27:34Z
@property (nonatomic, strong) NSString *_Nullable teamMediaGroupId; //Example: 56194
@property (nonatomic, strong) NSString *_Nullable mediaFormat; //Example: image
@property (nonatomic, strong) NSDate *_Nullable updatedAt; //Example: 2012-06-01T09:09:20Z
@property (nonatomic, assign) BOOL isPrivate; //Example: 0
@property (nonatomic, strong) NSString *_Nullable teamId; //Example: 71118
@property (nonatomic, strong) NSString *_Nullable memberId; //Example: 993324
@property (nonatomic, strong) NSURL *_Nullable linkMember;
@property (nonatomic, strong) NSURL *_Nullable linkMedium;
@property (nonatomic, strong) NSURL *_Nullable linkMediumThumbnail;
@property (nonatomic, strong) NSURL *_Nullable linkTeamMediumPhotoFile;
@property (nonatomic, strong) NSURL *_Nullable linkTeamMediumComments;
@property (nonatomic, strong) NSURL *_Nullable linkImageUrl;
@property (nonatomic, strong) NSURL *_Nullable linkMediumMidsizeThumbnail;
@property (nonatomic, strong) NSURL *_Nullable linkTeam;
@property (nonatomic, strong) NSURL *_Nullable linkMediumSmallThumbnail;
@property (nonatomic, strong) NSURL *_Nullable linkTeamMediaGroup;
@property (nonatomic, strong) NSURL *_Nullable linkMediumMidsize;


- (TSDKTeamMediaGroupFormatType)mediaType;
- (void)setMediaType:(TSDKTeamMediaGroupFormatType)mediaType;
- (NSURL *_Nullable)linkForImageWithHeight:(NSInteger)height width:(NSInteger)width;
- (NSURL *_Nullable)linkForImageWithHeight:(NSInteger)height;
- (NSURL *_Nullable)linkForImageWithWidth:(NSInteger)width;
//Deletes the specified team_medium_ids
//+(void)actionBulkDeleteTeamMediaTeammediumids:(NSString *_Nonnull)teamMediumIds WithCompletion:(TSDKCompletionBlock _Nullable)completion;

//Set the specified team medium image as the team photo
//+(void)actionSetMediumAsTeamPhotoTeammediumid:(NSString *_Nonnull)teamMediumId WithCompletion:(TSDKCompletionBlock _Nullable)completion;

//Add a link to a YouTube or Vimeo video.
//+(void)actionCreateTeamVideoLinkVideourl:(NSString *_Nonnull)videoUrl memberId:(NSString *_Nonnull)memberId teamMediaGroupId:(NSString *_Nonnull)teamMediaGroupId description:(NSString *_Nonnull)description teamId:(NSString *_Nonnull)teamId position:(NSString *_Nonnull)position WithCompletion:(TSDKCompletionBlock _Nullable)completion;

//Share a specified image or video type medium on facebook.
//+(void)actionFacebookShareTeamMediumTeammediumid:(NSString *_Nonnull)teamMediumId caption:(NSString *_Nonnull)caption facebookPageId:(NSString *_Nonnull)facebookPageId isSuppressedFromFeed:(NSString *_Nonnull)isSuppressedFromFeed WithCompletion:(TSDKCompletionBlock _Nullable)completion;

//Assign the specified team_medium_ids to the team_media_group_id
//+(void)actionAssignMediaToGroupTeammediumids:(NSString *_Nonnull)teamMediumIds teamMediaGroupId:(NSString *_Nonnull)teamMediaGroupId WithCompletion:(TSDKCompletionBlock _Nullable)completion;

//Reorder the team media based on the sorted_ids provided.
//+(void)actionReorderTeamMediaTeamid:(NSString *_Nonnull)teamId sortedIds:(NSString *_Nonnull)sortedIds WithCompletion:(TSDKCompletionBlock _Nullable)completion;

//Rotate an image with specified team_medium_id in the specified rotate_direction
//+(void)actionRotateTeamMediumImageRotatedirection:(NSString *_Nonnull)rotateDirection teamMediumId:(NSString *_Nonnull)teamMediumId WithCompletion:(TSDKCompletionBlock _Nullable)completion;

//Set the specified team medium image as the specified member_id's  photo
//+(void)actionSetMediumAsMemberPhotoMemberid:(NSString *_Nonnull)memberId teamMediumId:(NSString *_Nonnull)teamMediumId WithCompletion:(TSDKCompletionBlock _Nullable)completion;

//Upload a team media file. This must be a multi-part POST.
#if TARGET_OS_IPHONE
+(nonnull TSDKBackgroundUploadProgressMonitorDelegate *)uploadPhotoFileURL:(nonnull NSURL *)photoFileURL  groupid:(NSString *_Nonnull)teamMediaGroupId position:(NSInteger)position memberId:(NSString *_Nonnull)memberId teamId:(NSString *_Nonnull)teamId description:(NSString *_Nonnull)description progress:(TSDKUploadProgressBlock _Nullable)progressBlock;

-(nonnull TSDKBackgroundUploadProgressMonitorDelegate *)uploadPhotoFileURL:(nonnull NSURL *)photoFileURL position:(NSInteger)position progress:(TSDKUploadProgressBlock _Nullable)progressBlock;

#endif

//+(void)querySearchId:(NSString *_Nonnull)id memberId:(NSString *_Nonnull)memberId teamMediaGroupId:(NSString *_Nonnull)teamMediaGroupId pageNumber:(NSString *_Nonnull)pageNumber teamId:(NSString *_Nonnull)teamId pageSize:(NSString *_Nonnull)pageSize WithCompletion:(TSDKCompletionBlock _Nullable)completion;

@end

@interface TSDKTeamMedium (ForwardedMethods)

-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberArrayCompletionBlock _Nonnull)completion;
-(void)getMediumWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getMediumThumbnailWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getTeamMediumPhotoFileWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getTeamMediumCommentsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamMediumCommentArrayCompletionBlock _Nonnull)completion;
-(void)getImageUrlWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getMediumMidsizeThumbnailWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nonnull)completion;
-(void)getMediumSmallThumbnailWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getTeamMediaGroupWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamMediaGroupArrayCompletionBlock _Nonnull)completion;
-(void)getMediumMidsizeWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;


@end
