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

NS_ASSUME_NONNULL_BEGIN

@class TSDKCollectionJSON, TSDKInvitationFinder;

@interface TSDKDataRequest : NSObject

+ (NSURL *)baseURL;
+ (void)setBaseURL:(NSURL *)URL;

+ (NSURL *)appendPathToBaseURL:(NSString *)path;

+ (void)addRequestHeaderValue:(NSString *)value forKey:(NSString *)key;
+ (NSDictionary *)requestHeaders;
+ (void)requestJSONObjectsForPath:(NSURL *)URL sendDataDictionary:(NSDictionary *_Nullable)dataEnvelope method:(NSString *_Nullable)method configuration:(TSDKRequestConfiguration *_Nullable)configuration withCompletion:(TSDKJSONCompletionBlock _Nullable)completionBlock;
+ (void)requestObjectsForPath:(NSURL *)URL withConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKCompletionBlock _Nullable)completionBlock;
+ (void)requestObjectsForPath:(NSURL *)URL sendDataDictionary:(NSDictionary *_Nullable)dataEnvelope method:(NSString *_Nullable)method withConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKCompletionBlock _Nullable)completionBlock;
+ (void)requestObjectsForPath:(NSURL *)URL searchParamaters:(NSDictionary <NSString *, id> *_Nullable)searchParamaters sendDataDictionary:(NSDictionary *_Nullable)dataEnvelope method:(NSString *_Nullable)method withConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKCompletionBlock _Nullable)completionBlock;
+ (void)postDictionary:(NSDictionary *)postDictionary toURL:(NSURL *)url delegate:(id<NSURLSessionDataDelegate>_Nullable)delegate;

#if TARGET_OS_IPHONE
+ (void)requestImageForPath:(NSURL *)URL configuration:(TSDKRequestConfiguration *_Nullable)configuration withCompletion:(TSDKImageCompletionBlock _Nullable)completionBlock;
#endif

+ (void)setClientId:(NSString *)clientId;
+ (void)setClientSecret:(NSString *)clientSecret;
+ (void)setOAuthToken:(NSString *_Nullable)token;

@end

NS_ASSUME_NONNULL_END
