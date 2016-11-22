// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKApnDevices : TSDKCollectionObject

@property (nonatomic, weak) NSString *_Nullable token;
@property (nonatomic, weak) NSString *_Nullable appVersion;
@property (nonatomic, weak) NSURL *_Nullable linkSelf;
@property (nonatomic, weak) NSURL *_Nullable linkUser;
@property (nonatomic, weak) NSURL *_Nullable linkRoot;

@end

@interface TSDKApnDevices (ForwardedMethods)

-(void)getSelfWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getUserWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKUserArrayCompletionBlock _Nonnull)completion;
-(void)getRootWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;


@end
