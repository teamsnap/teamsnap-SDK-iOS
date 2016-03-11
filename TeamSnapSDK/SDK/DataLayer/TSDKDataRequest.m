//
//  TSDKDataRequest.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 1/9/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKDataRequest.h"
#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#endif
#import "NSHTTPURLResponse+convenience.h"
#import "TSDKCollectionJSON.h"
#import "NSMutableURLRequest+TSDKConveniences.h"
#import "TSDKCollectionObject.h"
#import "TSDKProfileTimer.h"
#import "TSDKTeamSnap.h"
#import "TSDKConstants.h"

static NSString *baseURL = @"https://api.teamsnap.com/v3/";
static NSString *OauthURL = @"https://cogsworth.teamsnap.com/oauth/token";
static NSString *clientId;
static NSString *clientSecret;

static NSMutableDictionary *_requestHeaders = nil;
static NSString *OAuthToken = nil;

static NSRecursiveLock *accessDetailsLock = nil;

@implementation TSDKDataRequest

+(NSURL *)baseURL {
    return [NSURL URLWithString:baseURL];
}

+ (void)setBaseURL:(NSURL *)URL {
    baseURL = [URL absoluteString];
}

+(NSURL *)appendPathToBaseURL:(NSString *)path {
    NSURL *url =[NSURL URLWithString:path relativeToURL:[NSURL URLWithString:baseURL]];
    return url;
}

+ (NSURLSession *)session {
    static NSURLSession *session;
    if (!session) {
        NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
        session = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate:nil delegateQueue: [NSOperationQueue mainQueue]];
    }
    return session;
}

+ (void)addRequestHeaderValue:(NSString *)value forKey:(NSString *)key {
    [self.requestHeaders setObject:value forKey:key];
}

+ (NSMutableDictionary *)requestHeaders {
    if (!_requestHeaders) {
        _requestHeaders = [[NSMutableDictionary alloc] init];
        [_requestHeaders setObject:@"application/json" forKey:@"Accept"];
        [_requestHeaders setObject:@"iOS" forKey:@"X-Client-Source"];
        [_requestHeaders setObject:@"TeamSnapSDK/1.0 (iPhone Simulator; iOS 8.1; Scale/2.00)" forKey:@"User-Agent"];
        //[_requestHeaders setObject:@"gzip" forKey:@"Accept-Encoding"];
        
        NSMutableArray *acceptLanguagesComponents = [NSMutableArray array];
        [[NSLocale preferredLanguages] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            float q = 1.0f - (idx * 0.1f);
            [acceptLanguagesComponents addObject:[NSString stringWithFormat:@"%@;q=%0.1g", obj, q]];
            *stop = q <= 0.5f;
        }];
        [_requestHeaders setObject:[acceptLanguagesComponents componentsJoinedByString:@", "] forKey:@"Accept-Language"];
        
        NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
        [_requestHeaders setObject:version forKey:@"X-Client-Version"];
    }
    return _requestHeaders;
}

+ (void)requestJSONObjectsForPath:(NSURL *)URL sendDataDictionary:(NSDictionary *)dataEnvelope method:(NSString *)method withCompletion:(TSDKJSONCompletionBlock)completionBlock {

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];

    for (NSString *headerKeys in self.requestHeaders) {
        [request setValue:[self.requestHeaders objectForKey:headerKeys] forHTTPHeaderField:headerKeys];
    }

    if (OAuthToken) {
        [request setValue:OAuthToken forHTTPHeaderField:@"X-TEAMSNAP-ACCESS-TOKEN"];
    }

    if (method) {
        [request setHTTPMethod:method];
    } else {
        [request setHTTPMethod:@"GET"];
    }

    if (([method isEqualToString:@"POST"] || [method isEqualToString:@"PUT"] || [method isEqualToString:@"PATCH"]) && dataEnvelope) {
        NSError *error = nil;
        //NSData *data = [NSJSONSerialization dataWithJSONObject:dataEnvelope options:(NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves | NSJSONReadingAllowFragments) error:&error];

        NSData *data = [NSJSONSerialization dataWithJSONObject:dataEnvelope options:0 error:&error];
        [request setHTTPBody:data];
        [request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    }

    DLog(@"Curl:\n%@", [request getCurlEquivalent]);

    [[TSDKProfileTimer sharedInstance] startTimeWithId:URL];
    NSURLSessionDataTask *remoteTask = [[TSDKDataRequest session] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        [[TSDKProfileTimer sharedInstance] getElapsedTimeForId:URL logResult:YES];
        
        BOOL success = NO;
        BOOL requestCompleted = NO;
        if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
            success = [httpResponse wasSuccess];
        }
        id JSON = nil;
        
        requestCompleted = success;
        
        if (success) {
            [[TSDKProfileTimer sharedInstance] startTimeWithId:@"JSON"];
            if (data) {
                JSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            }
            [[TSDKProfileTimer sharedInstance] getElapsedTimeForId:@"JSON" logResult:YES];
        } else {
            NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] init];
            
            if (data) {
                JSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
                TSDKCollectionJSON *errorJSON = [[TSDKCollectionJSON alloc] initWithJSON:JSON];
                if (errorJSON.errorTitle) {
                    userInfo[NSLocalizedFailureReasonErrorKey] = errorJSON.errorTitle;
                }
                if (errorJSON.errorMessage) {
                    userInfo[NSLocalizedDescriptionKey] = errorJSON.errorMessage;
                }
                NSInteger errorCode = 0;
                if (errorJSON.errorCode != NSNotFound) {
                    errorCode = [userInfo[@"errorCode"] integerValue];
                }
                
                if([response isKindOfClass:[NSHTTPURLResponse class]]) {
                    userInfo[TSDKTeamSnapSDKHTTPResponseCodeKey] = [NSNumber numberWithInteger:((NSHTTPURLResponse *)response).statusCode];
                }
                
                error = [[NSError alloc] initWithDomain:TSDKTeamSnapSDKErrorDomainKey code:errorCode userInfo:userInfo];
            }
        }

        if (completionBlock) {
            completionBlock(success, requestCompleted, JSON, error);
        }
    }];

    [remoteTask resume];
}

+ (void)requestObjectsForPath:(NSURL *)URL withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKCompletionBlock)completionBlock {
    [TSDKDataRequest requestObjectsForPath:URL sendDataDictionary:nil method:nil withConfiguration:configuration completion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
        if (completionBlock) {
            completionBlock(success, complete, objects, error);
        }
    }];
}

+ (void)requestObjectsForPath:(NSURL *)URL searchParamaters:(NSDictionary *)searchParamaters sendDataDictionary:(NSDictionary *)dataEnvelope method:(NSString *)method withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKCompletionBlock)completionBlock {
    NSMutableString *URLPath = [NSMutableString stringWithString:[URL absoluteString]];

    if (searchParamaters) {
        NSMutableArray *searchParamaterArray = [[NSMutableArray alloc] init];
        for (NSString *key in searchParamaters) {
            [searchParamaterArray addObject:[NSString stringWithFormat:@"%@=%@",key, [searchParamaters objectForKey:key]]];
        }
        NSString *separator = @"&";
        if ([URLPath rangeOfString:@"?"].location == NSNotFound) {
            separator = @"?";
        }
        [URLPath appendFormat:@"%@%@", separator, [searchParamaterArray componentsJoinedByString:@"&"]];
    }
    
    [self requestJSONObjectsForPath:[NSURL URLWithString:URLPath] sendDataDictionary:dataEnvelope method:method withCompletion:^(BOOL success, BOOL complete, id objects, NSError *error) {
        TSDKCollectionJSON *containerCollection = nil;
        if ([objects isKindOfClass:[NSDictionary class]]) {
            containerCollection = [[TSDKCollectionJSON alloc] initWithJSON:(NSDictionary *)objects];
        }
        if (completionBlock) {
            completionBlock(success, complete, containerCollection, error);
        }
    }];
}

+ (void)requestObjectsForPath:(NSURL *)URL sendDataDictionary:(NSDictionary *)dataEnvelope method:(NSString *)method withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKCompletionBlock)completionBlock {
    [self requestObjectsForPath:URL searchParamaters:nil sendDataDictionary:dataEnvelope method:method withConfiguration:configuration completion:completionBlock];
}

#if TARGET_OS_IPHONE
+ (void)requestImageForPath:(NSURL *)URL withCompletion:(TSDKImageCompletionBlock)completionBlock {
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    
    for (NSString *headerKeys in self.requestHeaders) {
        [request setValue:[self.requestHeaders objectForKey:headerKeys] forHTTPHeaderField:headerKeys];
    }
    
    if (OAuthToken) {
        [request setValue:OAuthToken forHTTPHeaderField:@"X-TEAMSNAP-ACCESS-TOKEN"];
    }
    
    [request setHTTPMethod:@"GET"];
    [request setCachePolicy:NSURLRequestReturnCacheDataElseLoad];
    
    DLog(@"Curl:\n%@", [request getCurlEquivalent]);
    
    [[TSDKProfileTimer sharedInstance] startTimeWithId:URL];
    NSURLSessionDataTask *remoteTask = [[TSDKDataRequest session] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        [[TSDKProfileTimer sharedInstance] getElapsedTimeForId:URL logResult:YES];
        
        BOOL success = NO;
        if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
            success = [httpResponse wasSuccess];
        }
        UIImage *image = nil;
        if (success) {
            image = [UIImage imageWithData:data];
        }
        
        if (completionBlock) {
            completionBlock(image);
        }
    }];
    
    [remoteTask resume];
}
#endif

/*
+ (void)asyncRequestObjectsForPaths:(NSArray *)paths withCompletion:(TSDKCompletionBlock)completionBlock {
    
}

+ (void)syncRequestObjectsForPaths:(NSArray *)paths withCompletion:(TSDKCompletionBlock)completionBlock {
    
}
 */

+ (void)loginWithUser:(NSString *)aUsername password:(NSString *)aPassword onCompletion:(TSDKLoginCompletionBlock)completion {
     NSString *scopes = @"read write";
    
    NSDictionary *envelope = [NSDictionary dictionaryWithObjects:@[@"password", aUsername, aPassword, clientId, clientSecret, scopes] forKeys:@[@"grant_type", @"username", @"password", @"client_id", @"client_secret", @"scope"]];
    
    [TSDKDataRequest requestJSONObjectsForPath:[NSURL URLWithString:OauthURL] sendDataDictionary:envelope method:@"POST" withCompletion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
        NSString *OAuthToken = nil;
        if ([objects isKindOfClass:[NSDictionary class]]) {
            if ([(NSDictionary *)objects objectForKey:@"access_token"]) {
                OAuthToken = [(NSDictionary *)objects objectForKey:@"access_token"];
                [TSDKDataRequest setOAuthToken:OAuthToken];
            }
        }
        if (completion) {
            completion(success, OAuthToken, error);
        }
    }];
}

+ (void)setClientId:(NSString *)theClientId {
    clientId = theClientId;
}

+ (void)setClientSecret:(NSString *)theClientSecret {
    clientSecret = theClientSecret;
}

+ (void)setOAuthToken:(NSString *)token {
    [accessDetailsLock lock];
    OAuthToken = token;
    [accessDetailsLock unlock];
}

@end
