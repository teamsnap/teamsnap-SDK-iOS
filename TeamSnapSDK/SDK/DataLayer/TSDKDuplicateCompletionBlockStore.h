//
//  TSDKDuplicateCompletionBlockStore.h
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 6/8/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCompletionBlockTypes.h"

@interface TSDKDuplicateCompletionBlockStore : NSObject

+ (instancetype _Nonnull)sharedInstance;

- (BOOL)existingRequestExistsMatchingRequest:(NSURLRequest *_Nonnull)request;
- (void)addCompletionBlock:(TSDKJSONCompletionBlock _Nonnull)completionBlock forRequest:(NSURLRequest *_Nonnull)request;
- (void)removeAllCompletionBlocksForRequest:(NSURLRequest *_Nonnull)request;
- (NSSet *_Nonnull)completionBlocksForRequest:(NSURLRequest *_Nonnull)request;

@end
