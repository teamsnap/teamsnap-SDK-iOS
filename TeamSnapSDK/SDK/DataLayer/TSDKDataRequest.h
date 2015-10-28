//
//  TSDKDataRequest.h
//  SDKPlayground
//
//  Created by Jason Rahaim on 1/9/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIkit/UIKit.h>

@class TSDKCollectionJSON, TSDKInviteStatus;

typedef void (^TSDKJSONCompletionBlock)(BOOL success, BOOL complete, id objects, NSError *error);
typedef void (^TSDKCompletionBlock)(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error);
typedef void (^TSDKInviteStatusCompletionBlock)(BOOL success, BOOL complete, TSDKInviteStatus *objects, NSError *error);
typedef void (^TSDKLoginCompletionBlock)(BOOL success, NSString *OAuthToken, NSError *error);
typedef void (^TSDKArrayCompletionBlock)(BOOL success, BOOL complete, NSArray *objects, NSError *error);
typedef void (^TSDKDictionaryCompletionBlock)(BOOL success, BOOL complete, NSDictionary *objects, NSError *error);
typedef void (^TSDKImageCompletionBlock)(UIImage *image);

@interface TSDKDataRequest : NSObject

+ (NSURL *)baseURL;
+ (NSURL *)appendPathToBaseURL:(NSString *)path;

+ (void)addRequestHeaderValue:(NSString *)value forKey:(NSString *)key;
+ (NSMutableDictionary *)requestHeaders;
+ (void)requestJSONObjectsForPath:(NSURL *)URL sendDataDictionary:(NSDictionary *)dataEnvelope method:(NSString *)method withCompletion:(TSDKJSONCompletionBlock)completionBlock;
+ (void)requestObjectsForPath:(NSURL *)URL withCompletion:(TSDKCompletionBlock)completionBlock;
+ (void)requestObjectsForPath:(NSURL *)URL sendDataDictionary:(NSDictionary *)dataEnvelope method:(NSString *)method withCompletion:(TSDKCompletionBlock)completionBlock;
+ (void)requestImageForPath:(NSURL *)URL withCompletion:(TSDKImageCompletionBlock)completion;

+ (void)asyncRequestObjectsForPaths:(NSArray *)paths withCompletion:(TSDKCompletionBlock)completionBlock;
+ (void)syncRequestObjectsForPaths:(NSArray *)paths withCompletion:(TSDKCompletionBlock)completionBlock;
+ (void)loginWithUser:(NSString *)aUsername password:(NSString *)aPassword onCompletion:(TSDKLoginCompletionBlock)completion;

+ (void)setClientId:(NSString *)clientId;
+ (void)setClientSecret:(NSString *)clientSecret;
+ (void)setOAuthToken:(NSString *)token;

@end
