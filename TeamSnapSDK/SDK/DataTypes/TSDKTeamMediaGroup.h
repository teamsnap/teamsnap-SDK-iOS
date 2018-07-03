//
//  TSDKTeamMediaGroup.h
//  TeamSnapSDK
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"


extern NSString * _Nonnull const TSDKTeamMediaGroupImageFormatString;
extern NSString * _Nonnull const TSDKTeamMediaGroupFileFormatString;

typedef enum {
    TSDKTeamMediaGroupUnknownFormat = 0,
    TSDKTeamMediaGroupImageFormat = 1,
    TSDKTeamMediaGroupFileFormat = 2
} TeamMediaGroupFormatType;

@interface TSDKTeamMediaGroup : TSDKCollectionObject

@property (nonatomic, assign) NSInteger position; //Example: 2
@property (nonatomic, assign) NSInteger lastTeamMediumPosition; //Example: 2
@property (nonatomic, assign) BOOL isPrivate; //Example: 0
@property (nonatomic, strong) NSString *_Nullable mediaFormat; //Example: image
@property (nonatomic, strong) NSString *_Nullable teamId; //Example: 71118
@property (nonatomic, assign) NSInteger countTeamMedia; //Example: 15
@property (nonatomic, strong) NSString *_Nullable name; //Example: Mobile Uploads
@property (nonatomic, strong) NSURL *_Nullable linkTeamMedia;
@property (nonatomic, strong) NSURL *_Nullable linkPreviewMedium;
@property (nonatomic, strong) NSURL *_Nullable linkTeam;
@property (nonatomic, strong) NSURL *_Nullable linkPreviewMediumThumbnail;

//+(void)actionFacebookShareTeamMediaGroupWithCompletion:(TSDKCompletionBlock)completion; //(null)
//+(void)actionReorderTeamMediaGroupsWithCompletion:(TSDKCompletionBlock)completion; //(null)

+ (TeamMediaGroupFormatType)mediaFormatForString:(NSString *_Nullable)mediaFormat;
+ (NSString *_Nullable)mediaFormatStringForMediaFormat:(TeamMediaGroupFormatType)fieldType;

- (TeamMediaGroupFormatType)mediaType;
- (void)setMediaType:(TeamMediaGroupFormatType)mediaType;

@end

@interface TSDKTeamMediaGroup (ForwardedMethods)

-(void)getTeamMediaWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getPreviewMediumWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;
-(void)getPreviewMediumThumbnailWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;

@end
