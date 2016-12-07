//
//  TSDKTslPhotos.h
//  SDKDeveloperTools
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

typedef void (^ TSLImageUploadDetailsCompletionBlock)(BOOL success,NSURL *_Nullable imageURL, NSError *_Nullable error);

@interface TSDKTslPhotos : TSDKCollectionObject

@property (nonatomic, weak) NSString *_Nullable hostPrefix; //Example: https://7e7a37e9d371cdca79a5-2957068c55022fed6f3542268dd966e4.ssl.cf1.rackcdn.com
@property (nonatomic, weak) NSURL *_Nullable linkRoot;
@property (nonatomic, weak) NSURL *_Nullable linkSelf;

+(nonnull TSDKBackgroundUploadProgressMonitorDelegate *)uploadTSLImageURL:(nonnull NSURL *)photoFileURL team:(nonnull TSDKTeam *)team event:(nullable TSDKEvent *)event uploadDetailsCallback:(nullable TSLImageUploadDetailsCompletionBlock)uploadDetailsCallback progress:(nullable TSDKUploadProgressBlock)progressBloc;

@end
