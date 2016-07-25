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
#import "TSDKNetworkActivityIndicator.h"
#endif
#import "NSHTTPURLResponse+convenience.h"
#import "TSDKCollectionJSON.h"
#import "NSMutableURLRequest+TSDKConveniences.h"
#import "TSDKCollectionObject.h"
#import "TSDKProfileTimer.h"
#import "TSDKTeamSnap.h"
#import "TSDKConstants.h"
#import "NSString+TSDKConveniences.h"
#import "TSDKBackgroundUploadProgressMonitorDelegate.h"
#import "TSDKDuplicateCompletionBlockStore.h"

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
        if (version) {
            [_requestHeaders setObject:version forKey:@"X-Client-Version"];
        }
    }
    return _requestHeaders;
}

+ (void)requestJSONObjectsForPath:(NSURL *)URL sendDataDictionary:(NSDictionary *)dataEnvelope method:(NSString *)method configuration:(TSDKRequestConfiguration *)configuration withCompletion:(TSDKJSONCompletionBlock)completionBlock {
    if ([URL isFileURL]) {
        NSLog(@"File URL");
        NSData *data = [NSData dataWithContentsOfURL:URL];
        BOOL success = NO;
        id JSON = nil;
        NSError *error;
        if (data) {
            success = YES;
            JSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        }
        completionBlock(success, NO, JSON, error);
    } else {
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
        
        if (([method isEqualToString:@"POST"] || [method isEqualToString:@"PUT"] || [method isEqualToString:@"PATCH"] || [method isEqualToString:@"DELETE"]) && dataEnvelope) {
            NSError *error = nil;
            //NSData *data = [NSJSONSerialization dataWithJSONObject:dataEnvelope options:(NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves | NSJSONReadingAllowFragments) error:&error];
            
            NSData *data = [NSJSONSerialization dataWithJSONObject:dataEnvelope options:0 error:&error];
            [request setHTTPBody:data];
            [request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        }
        
        DLog(@"Curl:\n%@", [request getCurlEquivalent]);
        
        if([[TSDKDuplicateCompletionBlockStore sharedInstance] existingRequestExistsMatchingRequest:request]) {
            [[TSDKDuplicateCompletionBlockStore sharedInstance] addCompletionBlock:completionBlock forRequest:request];
        } else {
            [[TSDKDuplicateCompletionBlockStore sharedInstance] addCompletionBlock:completionBlock forRequest:request];
            
            [[TSDKProfileTimer sharedInstance] startTimeWithId:URL];
#if TARGET_OS_IPHONE
            [[TSDKNetworkActivityIndicator sharedInstance] startActivity];
#endif
            NSURLSessionDataTask *remoteTask = [[TSDKDataRequest session] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
#if TARGET_OS_IPHONE
                [[TSDKNetworkActivityIndicator sharedInstance] stopActivity];
#endif
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
                
                for(TSDKJSONCompletionBlock completionBlock in [[TSDKDuplicateCompletionBlockStore sharedInstance] completionBlocksForRequest:request].allObjects) {
                    completionBlock(success, requestCompleted, JSON, error);
                }
                [[TSDKDuplicateCompletionBlockStore sharedInstance] removeAllCompletionBlocksForRequest:request];
            }];
            remoteTask.priority = configuration.priority;
            [remoteTask resume];
        }
    }
}

+ (void)requestObjectsForPath:(NSURL *)URL withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKCompletionBlock)completionBlock {
    [TSDKDataRequest requestObjectsForPath:URL sendDataDictionary:nil method:nil withConfiguration:configuration completion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
        if (completionBlock) {
            completionBlock(success, complete, objects, error);
        }
    }];
}

+ (void)requestObjectsForPath:(NSURL *)URL searchParamaters:(NSDictionary *)searchParamaters sendDataDictionary:(NSDictionary *)dataEnvelope method:(NSString *)method withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKCompletionBlock)completionBlock {
    
    if (!URL) {
        completionBlock(NO, NO, nil, nil);
        return;
    }
    
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
    
    [self requestJSONObjectsForPath:[NSURL URLWithString:URLPath] sendDataDictionary:dataEnvelope method:method configuration:configuration withCompletion:^(BOOL success, BOOL complete, id objects, NSError *error) {
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

# pragma mark - Multipart uploads

+ (NSString *)mimeTypeForData:(NSData *)data {
    uint8_t c;
    [data getBytes:&c length:1];
    
    switch (c) {
        case 0xFF:
            return @"image/jpeg";
            break;
        case 0x89:
            return @"image/png";
            break;
        case 0x47:
            return @"image/gif";
            break;
        case 0x49:
        case 0x4D:
            return @"image/tiff";
            break;
        case 0x25:
            return @"application/pdf";
            break;
        case 0xD0:
            return @"application/vnd";
            break;
        case 0x46:
            return @"text/plain";
            break;
        default:
            return @"application/octet-stream";
    }
    return nil;
}

+ (NSMutableData *)multiPartPostDataFromDictionary:(NSDictionary *)postDictionary parentKeys:(NSArray *)parentKeys boundaryConstant:(NSString *)boundaryConstant {
    NSMutableData *postData = [[NSMutableData alloc] init];
    
    NSMutableData *binaryPartData = [[NSMutableData alloc] init];
    
    for (NSString *key in postDictionary.allKeys) {
        if ([key isEqualToString:@"supressed_file_name"]) {
            continue;
        }

        NSObject *value = [postDictionary objectForKey:key];
        if (!value || [value isEqual:[NSNull null]]) {
            continue;
        }
        if ([value isKindOfClass:[NSString class]] && [(NSString *)value length]==0) {
            continue;
        }
        NSMutableString *multipartKey = [NSMutableString stringWithString:key];
        if (parentKeys.count>0) {
            multipartKey = [NSMutableString stringWithString:[parentKeys objectAtIndex:0]];
            for (NSInteger nLoop = 1; nLoop < parentKeys.count; nLoop++) {
                [multipartKey appendString:[NSString stringWithFormat:@"[%@]", [parentKeys objectAtIndex:nLoop]]];
            }
            [multipartKey appendString:[NSString stringWithFormat:@"[%@]", key]];
        }
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            [postData appendData:[self multiPartPostDataFromDictionary:(NSDictionary *)value parentKeys:[parentKeys arrayByAddingObjectsFromArray:@[key]] boundaryConstant:boundaryConstant]];
        } else if ([value isKindOfClass:[NSString class]]) {
            [postData appendData:[[NSString stringWithFormat:@"--%@\r\n", boundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
            [postData appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n%@\r\n", multipartKey, value] dataUsingEncoding:NSUTF8StringEncoding]];
        } else if ([value isKindOfClass:[NSNumber class]]) {
            [postData appendData:[[NSString stringWithFormat:@"--%@\r\n", boundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
            [postData appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n%@\r\n", multipartKey, value] dataUsingEncoding:NSUTF8StringEncoding]];
        } else if ([value isKindOfClass:[NSData class]]) {
            NSString *fileName = [postDictionary objectForKey:@"file_name"];
            if (!fileName) {
                fileName = [postDictionary objectForKey:@"supressed_file_name"];
            }
            [binaryPartData appendData:[[NSString stringWithFormat:@"--%@\r\n", boundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
            
            [binaryPartData appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\nContent-Type: %@\r\n\r\n", multipartKey , fileName, [self mimeTypeForData:(NSData *)value]] dataUsingEncoding:NSUTF8StringEncoding]];
            [binaryPartData appendData:(NSData *)value];
            [binaryPartData appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        }
    }
    
    [postData appendData:binaryPartData];
    return postData;
}

+ (NSData *)multiPartPostDataFromDictionary:(NSDictionary *)postDictionary request:(NSMutableURLRequest *)request {
    NSString *boundaryConstant = [NSString stringWithFormat:@"__TeamSnapMultiPart%@__", [NSString GUID]];
    NSMutableData *postData = [self multiPartPostDataFromDictionary:postDictionary parentKeys:[[NSArray alloc] init] boundaryConstant:boundaryConstant];
    [postData appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSString *postLength = [NSString stringWithFormat:@"%zu", (unsigned long)[postData length]];

    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"close" forHTTPHeaderField:@"Connection"];
    
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundaryConstant];
    [request setValue:contentType forHTTPHeaderField:@"Content-Type"];
    return postData;
}

+ (void)postDictionary:(NSDictionary *)postDictionary toURL:(NSURL *)url delegate:(id<NSURLSessionDataDelegate>)delegate {
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    
    for (NSString *headerKeys in self.requestHeaders) {
        [request setValue:[self.requestHeaders objectForKey:headerKeys] forHTTPHeaderField:headerKeys];
    }
    
    if (OAuthToken) {
        [request setValue:OAuthToken forHTTPHeaderField:@"X-TEAMSNAP-ACCESS-TOKEN"];
    }
    
    NSString *cacheDirectory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSURL *uploadCacheFile = [NSURL fileURLWithPath:[cacheDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.jpg", [NSString GUID]]]];
    
    [[self multiPartPostDataFromDictionary:postDictionary request:request] writeToURL:uploadCacheFile atomically:YES];
    
    NSURLSessionConfiguration *uploadConfigObject = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:[NSString GUID]];
    uploadConfigObject.allowsCellularAccess = YES;
    
    NSURLSession *uploadsession = [NSURLSession sessionWithConfiguration:uploadConfigObject delegate:delegate delegateQueue:nil];
    
    NSURLSessionDataTask *remoteTask = [uploadsession uploadTaskWithRequest:request fromFile:uploadCacheFile];

    
    [remoteTask resume];
}

#if TARGET_OS_IPHONE
+ (void)requestImageForPath:(NSURL *)URL configuration:(TSDKRequestConfiguration *)configuration withCompletion:(TSDKImageCompletionBlock)completionBlock {
    
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
#if TARGET_OS_IPHONE
    [[TSDKNetworkActivityIndicator sharedInstance] startActivity];
#endif
    NSURLSessionDataTask *remoteTask = [[TSDKDataRequest session] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
#if TARGET_OS_IPHONE
        [[TSDKNetworkActivityIndicator sharedInstance] stopActivity];
#endif
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
    remoteTask.priority = configuration.priority;
    [remoteTask resume];
}
#endif

+ (void)loginWithUser:(NSString *)aUsername password:(NSString *)aPassword onCompletion:(TSDKLoginCompletionBlock)completion {
     NSString *scopes = @"read write";
    
    NSDictionary *envelope = [NSDictionary dictionaryWithObjects:@[@"password", aUsername, aPassword, clientId, clientSecret, scopes] forKeys:@[@"grant_type", @"username", @"password", @"client_id", @"client_secret", @"scope"]];
    
    [TSDKDataRequest requestJSONObjectsForPath:[NSURL URLWithString:OauthURL] sendDataDictionary:envelope method:@"POST" configuration:[TSDKRequestConfiguration defaultRequestConfiguration] withCompletion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
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
