//
//  TSDKDuplicateCompletionBlockStore.m
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 6/8/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKDuplicateCompletionBlockStore.h"
#import "TSDKMutableDictionary.h"

@interface TSDKDuplicateCompletionBlockStore()

@property (strong, nonatomic) TSDKMutableDictionary* completionBlocksKeyedByRequest;

@end

@implementation TSDKDuplicateCompletionBlockStore

+ (instancetype)sharedInstance {
    static id sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[[self class] alloc] init];
    });
    
    return sharedInstance;
}

- (TSDKMutableDictionary *)completionBlocksKeyedByRequest {
    if(!_completionBlocksKeyedByRequest) {
        _completionBlocksKeyedByRequest = [[TSDKMutableDictionary alloc] init];
    }
    return _completionBlocksKeyedByRequest;
}

- (BOOL)existingRequestExistsMatchingRequest:(NSURLRequest *)request {
    if (request == nil) {
        return NO;
    }
    
    if([self.completionBlocksKeyedByRequest objectForKey:[TSDKDuplicateCompletionBlockStore identifierFromRequest:request]] != nil) {
        return YES;
    }
    return NO;
}

- (void)addCompletionBlock:(TSDKJSONCompletionBlock)completionBlock forRequest:(NSURLRequest *)request {
    
    if (request == nil) {
        return;
    }
    
    if([[self.completionBlocksKeyedByRequest objectForKey:[TSDKDuplicateCompletionBlockStore identifierFromRequest:request]] isKindOfClass:[NSMutableSet class]]) {
        NSMutableSet* set = [self.completionBlocksKeyedByRequest objectForKey:[TSDKDuplicateCompletionBlockStore identifierFromRequest:request]];
        [set addObject:completionBlock];
        
    } else {
        NSMutableSet *set = [NSMutableSet setWithObject:completionBlock];
        [self.completionBlocksKeyedByRequest setObject:set forKey:[TSDKDuplicateCompletionBlockStore identifierFromRequest:request]];
    }
}

- (NSSet *)completionBlocksForRequest:(NSURLRequest *)request {
    if (request == nil) {
        return [[NSSet alloc] init];
    }
    
    return [self.completionBlocksKeyedByRequest objectForKey:[TSDKDuplicateCompletionBlockStore identifierFromRequest:request]];
}

- (void)removeAllCompletionBlocksForRequest:(NSURLRequest *)request {
    if (request == nil) {
        return;
    }
    
    [self.completionBlocksKeyedByRequest removeObjectForKey:[TSDKDuplicateCompletionBlockStore identifierFromRequest:request]];
}

+ (NSString *)identifierFromRequest:(NSURLRequest *)request {
    NSMutableString *identifierString = [[NSMutableString alloc] initWithString:request.URL.absoluteString];
    
    [identifierString appendString:request.HTTPMethod];
    
    for(NSString *key in [[request.allHTTPHeaderFields allKeys] sortedArrayUsingSelector:@selector(compare:)]) {    // preseving the order of the dictionary
        [identifierString appendString:key.description];
        [identifierString appendString:[[request.allHTTPHeaderFields objectForKey:key] description]];
    }
    
    if(request.HTTPBody) {
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:request.HTTPBody options:0 error:nil];
        if(json) {
            for(NSString *key in [[json allKeys] sortedArrayUsingSelector:@selector(compare:)]) {    // preseving the order of the dictionary
                [identifierString appendString:key.description];
                [identifierString appendString:[[json objectForKey:key] description]];
            }
        }
    }
    
    return identifierString;
}
@end
