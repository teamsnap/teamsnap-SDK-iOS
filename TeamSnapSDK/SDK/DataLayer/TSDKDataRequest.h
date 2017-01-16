//
//  TSDKDataRequest.h
//  SDKPlayground
//
//  Created by Jason Rahaim on 1/9/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKRequestConfiguration.h"
#import "TSDKCompletionBlockTypes.h"

@class TSDKCollectionJSON, TSDKinvitationFinder;

@interface TSDKDataRequest : NSObject

+ (NSURL *_Nonnull)baseURL;
+ (void)setBaseURL:(NSURL *_Nonnull)URL;

+ (NSURL *_Nonnull)appendPathToBaseURL:(NSString *_Nonnull)path;

+ (void)addRequestHeaderValue:(NSString *_Nonnull)value forKey:(NSString *_Nonnull)key;
+ (NSDictionary *_Nonnull)requestHeaders;
+ (void)requestJSONObjectsForPath:(NSURL *_Nonnull)URL sendDataDictionary:(NSDictionary *_Nullable)dataEnvelope method:(NSString *_Nullable)method configuration:(TSDKRequestConfiguration *_Nullable)configuration withCompletion:(TSDKJSONCompletionBlock _Nullable)completionBlock;
+ (void)requestObjectsForPath:(NSURL *_Nonnull)URL withConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKCompletionBlock _Nullable)completionBlock;
+ (void)requestObjectsForPath:(NSURL *_Nonnull)URL sendDataDictionary:(NSDictionary *_Nullable)dataEnvelope method:(NSString *_Nullable)method withConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKCompletionBlock _Nullable)completionBlock;
+ (void)requestObjectsForPath:(NSURL *_Nonnull)URL searchParamaters:(NSDictionary *_Nullable)searchParamaters sendDataDictionary:(NSDictionary *_Nullable)dataEnvelope method:(NSString *_Nullable)method withConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKCompletionBlock _Nullable)completionBlock;
+ (void)postDictionary:(NSDictionary *_Nonnull)postDictionary toURL:(NSURL *_Nonnull)url delegate:(id<NSURLSessionDataDelegate>_Nullable)delegate;

#if TARGET_OS_IPHONE
+ (void)requestImageForPath:(NSURL *_Nonnull)URL configuration:(TSDKRequestConfiguration *_Nullable)configuration withCompletion:(TSDKImageCompletionBlock _Nullable)completionBlock;
#endif

+ (void)setClientId:(NSString *_Nonnull)clientId;
+ (void)setClientSecret:(NSString *_Nonnull)clientSecret;
+ (void)setOAuthToken:(NSString *_Nullable)token;

@end
