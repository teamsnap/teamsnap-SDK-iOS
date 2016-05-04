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

extern NSString * const OAuthURL;

@interface TSDKDataRequest : NSObject

+ (NSURL *)baseURL;
+ (void)setBaseURL:(NSURL *)URL;

+ (NSURL *)appendPathToBaseURL:(NSString *)path;

+ (void)addRequestHeaderValue:(NSString *)value forKey:(NSString *)key;
+ (NSMutableDictionary *)requestHeaders;
+ (void)requestJSONObjectsForPath:(NSURL *)URL sendDataDictionary:(NSDictionary *)dataEnvelope method:(NSString *)method withCompletion:(TSDKJSONCompletionBlock)completionBlock;
+ (void)requestObjectsForPath:(NSURL *)URL withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKCompletionBlock)completionBlock;
+ (void)requestObjectsForPath:(NSURL *)URL sendDataDictionary:(NSDictionary *)dataEnvelope method:(NSString *)method withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKCompletionBlock)completionBlock;
+ (void)requestObjectsForPath:(NSURL *)URL searchParamaters:(NSDictionary *)searchParamaters sendDataDictionary:(NSDictionary *)dataEnvelope method:(NSString *)method withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKCompletionBlock)completionBlock;

#if TARGET_OS_IPHONE
+ (void)requestImageForPath:(NSURL *)URL withCompletion:(TSDKImageCompletionBlock)completion;
#endif

+ (void)setClientId:(NSString *)clientId;
+ (void)setClientSecret:(NSString *)clientSecret;
+ (void)setOAuthToken:(NSString *)token;

@end
