//
//  TSDKDataRequest.h
//  SDKPlayground
//
//  Created by Jason Rahaim on 1/9/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCompletionBlockTypes.h"

@class TSDKCollectionJSON, TSDKinvitationFinder;

@interface TSDKDataRequest : NSObject

+ (NSURL *)baseURL;
+ (void)setBaseURL:(NSURL *)URL;

+ (NSURL *)appendPathToBaseURL:(NSString *)path;

+ (void)addRequestHeaderValue:(NSString *)value forKey:(NSString *)key;
+ (NSMutableDictionary *)requestHeaders;
+ (void)requestJSONObjectsForPath:(NSURL *)URL sendDataDictionary:(NSDictionary *)dataEnvelope method:(NSString *)method withCompletion:(TSDKJSONCompletionBlock)completionBlock;
+ (void)requestObjectsForPath:(NSURL *)URL withCompletion:(TSDKCompletionBlock)completionBlock;
+ (void)requestObjectsForPath:(NSURL *)URL sendDataDictionary:(NSDictionary *)dataEnvelope method:(NSString *)method withCompletion:(TSDKCompletionBlock)completionBlock;

#if TARGET_OS_IPHONE
+ (void)requestImageForPath:(NSURL *)URL withCompletion:(TSDKImageCompletionBlock)completion;
#endif

//+ (void)asyncRequestObjectsForPaths:(NSArray *)paths withCompletion:(TSDKCompletionBlock)completionBlock;
//+ (void)syncRequestObjectsForPaths:(NSArray *)paths withCompletion:(TSDKCompletionBlock)completionBlock;
+ (void)loginWithUser:(NSString *)aUsername password:(NSString *)aPassword onCompletion:(TSDKLoginCompletionBlock)completion;

+ (void)setClientId:(NSString *)clientId;
+ (void)setClientSecret:(NSString *)clientSecret;
+ (void)setOAuthToken:(NSString *)token;

@end
