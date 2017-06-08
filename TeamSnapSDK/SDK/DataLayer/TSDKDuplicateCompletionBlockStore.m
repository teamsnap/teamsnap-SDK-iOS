//
//  TSDKDuplicateCompletionBlockStore.m
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 6/8/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKDuplicateCompletionBlockStore.h"

@interface TSDKDuplicateCompletionBlockStore()

@property (strong, nonatomic) NSMutableDictionary* completionBlocksKeyedByRequest;
@property (strong, nonatomic) dispatch_queue_t accessQueue;

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

- (instancetype)init {
    if ( (self = [super init]) ) {
        
        _completionBlocksKeyedByRequest = [[NSMutableDictionary alloc] init];
        _accessQueue = dispatch_queue_create("com.teamsnap.completion-block-access", DISPATCH_QUEUE_SERIAL);
        
        return self;
    }
    
    return nil;
}

- (BOOL)existingRequestExistsMatchingRequest:(NSURLRequest *)request {
    if (request == nil) {
        return NO;
    }
    
    NSString *key = [TSDKDuplicateCompletionBlockStore identifierFromRequest:request];
    
    BOOL __block hasExisting;
    dispatch_sync(self.accessQueue, ^{
        hasExisting = [self.completionBlocksKeyedByRequest.allKeys containsObject:key];
    });
    
    return hasExisting;
}

- (void)addCompletionBlock:(TSDKJSONCompletionBlock)completionBlock forRequest:(NSURLRequest *)request {
    
    if (request == nil) {
        return;
    }
    
    NSString *requestKey = [TSDKDuplicateCompletionBlockStore identifierFromRequest:request];
    
    dispatch_sync(self.accessQueue, ^{
        id existingCompletion = [self.completionBlocksKeyedByRequest objectForKey:requestKey];
        if([existingCompletion isKindOfClass:[NSMutableSet class]]) {
            NSMutableSet* set = existingCompletion;
            [set addObject:completionBlock];
            
        } else {
            NSMutableSet *set = [NSMutableSet setWithObject:completionBlock];
            [self.completionBlocksKeyedByRequest setObject:set forKey:requestKey];
        }
    });
}

- (NSSet *)completionBlocksForRequest:(NSURLRequest *)request {
    if (request == nil) {
        return [[NSSet alloc] init];
    }
    
    NSString *requestKey = [TSDKDuplicateCompletionBlockStore identifierFromRequest:request];
    
    NSSet *__block completions;
    dispatch_sync(self.accessQueue, ^{
        completions = [self.completionBlocksKeyedByRequest objectForKey:requestKey];
    });
    return completions;
}

- (void)removeAllCompletionBlocksForRequest:(NSURLRequest *)request {
    if (request == nil) {
        return;
    }
    
    NSString *requestKey = [TSDKDuplicateCompletionBlockStore identifierFromRequest:request];
    dispatch_async(self.accessQueue, ^{
        [self.completionBlocksKeyedByRequest removeObjectForKey:requestKey];
    });
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
