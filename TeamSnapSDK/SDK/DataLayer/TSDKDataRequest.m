//
//  TSDKDataRequest.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 1/9/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKDataRequest.h"
#import "NSHTTPURLResponse+convenience.h"
#import "TSDKCollectionJSON.h"
#import "NSMutableURLRequest+TSDKConveniences.h"
#import "TSDKCollectionObject.h"
#import "TSDKProfileTimer.h"

static NSString *baseURL = @"https://api.teamsnap.com/v3";
static NSString *OauthURL = @"https://cogsworth.teamsnap.com/oauth/token";
static NSString *clientId;
static NSString *clientSecret;

static NSMutableDictionary *requestHeaders = nil;
static NSString *OAuthToken = nil;

static NSRecursiveLock *accessDetailsLock = nil;

@implementation TSDKDataRequest

+(NSURL *)baseURL {
    return [NSURL URLWithString:baseURL];
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
    if (!requestHeaders) {
        requestHeaders = [[NSMutableDictionary alloc] init];
    }
    [requestHeaders setObject:value forKey:key];
}

+ (NSMutableDictionary *)requestHeaders {
    return requestHeaders;
}

+ (void)requestJSONObjectsForPath:(NSURL *)URL sendDataDictionary:(NSDictionary *)dataEnvelope method:(NSString *)method withCompletion:(TSDKJSONCompletionBlock)completionBlock {

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];

    for (NSString *headerKeys in requestHeaders) {
        [request setValue:[requestHeaders objectForKey:headerKeys] forHTTPHeaderField:headerKeys];
    }

    if (OAuthToken) {
        [request setValue:OAuthToken forHTTPHeaderField:@"X-TEAMSNAP-ACCESS-TOKEN"];
    }

    if (method) {
        [request setHTTPMethod:method];
    } else {
        [request setHTTPMethod:@"GET"];
    }

    if (([method isEqualToString:@"POST"] || [method isEqualToString:@"PUT"]) && dataEnvelope) {
        NSError *error = nil;
        //NSData *data = [NSJSONSerialization dataWithJSONObject:dataEnvelope options:(NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves | NSJSONReadingAllowFragments) error:&error];

        NSData *data = [NSJSONSerialization dataWithJSONObject:dataEnvelope options:0 error:&error];
        [request setHTTPBody:data];
        [request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    }

    NSLog(@"Curl:\n%@", [request getCurlEquivalent]);

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
        
        if (success) {
            [[TSDKProfileTimer sharedInstance] startTimeWithId:@"JSON"];
            JSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            [[TSDKProfileTimer sharedInstance] getElapsedTimeForId:@"JSON" logResult:YES];
        }

        if (completionBlock) {
            completionBlock(success, requestCompleted, JSON, error);
        }
    }];

    [remoteTask resume];
}

+ (void)requestObjectsForPath:(NSURL *)URL withCompletion:(TSDKCompletionBlock)completionBlock {
    [TSDKDataRequest requestObjectsForPath:URL sendDataDictionary:nil method:nil withCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
        if (completionBlock) {
            completionBlock(success, complete, objects, error);
        }
    }];
}

+ (void)requestObjectsForPath:(NSURL *)URL sendDataDictionary:(NSDictionary *)dataEnvelope method:(NSString *)method withCompletion:(TSDKCompletionBlock)completionBlock {
    [self requestJSONObjectsForPath:URL sendDataDictionary:dataEnvelope method:method withCompletion:^(BOOL success, BOOL complete, id objects, NSError *error) {
        TSDKCollectionJSON *containerCollection = nil;
        if ([objects isKindOfClass:[NSDictionary class]]) {
            containerCollection = [[TSDKCollectionJSON alloc] initWithJSON:(NSDictionary *)objects];
        }
        if (completionBlock) {
            completionBlock(success, complete, containerCollection, error);
        }
    }];
}


+ (void)asyncRequestObjectsForPaths:(NSArray *)paths withCompletion:(TSDKCompletionBlock)completionBlock {
    
}

+ (void)syncRequestObjectsForPaths:(NSArray *)paths withCompletion:(TSDKCompletionBlock)completionBlock {
    
}

+ (void)loginWithUser:(NSString *)aUsername password:(NSString *)aPassword onCompletion:(TSDKLoginCompletionBlock)completion {
     NSString *scopes = @"read write";
    
    NSDictionary *envelope = [NSDictionary dictionaryWithObjects:@[@"password", aUsername, aPassword, clientId, clientSecret, scopes] forKeys:@[@"grant_type", @"username", @"password", @"client_id", @"client_secret", @"scope"]];

    [TSDKDataRequest addRequestHeaderValue:@"application/json" forKey:@"Accept"];
    [TSDKDataRequest addRequestHeaderValue:@"iOS" forKey:@"X-Client-Source"];
    [TSDKDataRequest addRequestHeaderValue:@"TeamSnapSDK/1.0 (iPhone Simulator; iOS 8.1; Scale/2.00)" forKey:@"User-Agent"];
    
    NSMutableArray *acceptLanguagesComponents = [NSMutableArray array];
    [[NSLocale preferredLanguages] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        float q = 1.0f - (idx * 0.1f);
        [acceptLanguagesComponents addObject:[NSString stringWithFormat:@"%@;q=%0.1g", obj, q]];
        *stop = q <= 0.5f;
    }];
    [self addRequestHeaderValue:[acceptLanguagesComponents componentsJoinedByString:@", "] forKey:@"Accept-Language"];
    
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    [TSDKDataRequest addRequestHeaderValue:version forKey:@"X-Client-Version"];
    
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