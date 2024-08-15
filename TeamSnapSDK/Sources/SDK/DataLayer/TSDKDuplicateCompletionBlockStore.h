//
//  TSDKDuplicateCompletionBlockStore.h
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 6/8/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCompletionBlockTypes.h"

NS_ASSUME_NONNULL_BEGIN

@interface TSDKDuplicateCompletionBlockStore : NSObject

+ (instancetype)sharedInstance;

- (BOOL)existingRequestExistsMatchingRequest:(NSURLRequest *)request;
- (void)addCompletionBlock:(TSDKJSONCompletionBlock)completionBlock forRequest:(NSURLRequest *)request;
- (void)removeAllCompletionBlocksForRequest:(NSURLRequest *)request;
- (NSSet *)completionBlocksForRequest:(NSURLRequest *)request;

@end

NS_ASSUME_NONNULL_END
