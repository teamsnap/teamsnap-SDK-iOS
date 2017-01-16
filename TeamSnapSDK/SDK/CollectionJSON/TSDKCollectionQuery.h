//
//  TSDKCollectionCommand.h
//  SDKPlayground
//
//  Created by Jason Rahaim on 3/7/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCompletionBlockTypes.h"
#import "TSDKMutableDictionary.h"

@interface TSDKCollectionQuery : NSObject <NSCopying, NSCoding>

@property (nonatomic, strong) TSDKMutableDictionary *_Nullable data;
@property (nonatomic, strong) NSString *_Nullable href;
@property (nonatomic, strong) NSString *_Nullable rel;
@property (nonatomic, strong) NSString *_Nullable prompt;

- (instancetype _Nullable)initWithJSONDict:(NSDictionary *_Nonnull)jsonDict;
-(void)executeWithCompletion:(TSDKCompletionBlock _Nullable)completion;

@end
