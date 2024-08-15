// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKApnDevice : TSDKCollectionObject

@property (nonatomic, strong) NSString *_Nullable token;
@property (nonatomic, strong) NSString *_Nullable appVersion;
@property (nonatomic, strong) NSURL *_Nullable linkSelf;
@property (nonatomic, strong) NSURL *_Nullable linkUser;
@property (nonatomic, strong) NSURL *_Nullable linkRoot;

@end

@interface TSDKApnDevice (ForwardedMethods)

-(void)getSelfWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getUserWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKUserArrayCompletionBlock _Nonnull)completion;
-(void)getRootWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;


@end
