//
//  TSDKCollectionCommand.h
//  SDKPlayground
//
//  Created by Jason Rahaim on 3/7/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSDKCollectionCommand : NSObject

@property (nonatomic, strong) NSMutableDictionary *data;
@property (nonatomic, strong) NSString *href;
@property (nonatomic, strong) NSString *rel;
@property (nonatomic, strong) NSString *prompt;

- (instancetype)initWithJSONDict:(NSDictionary *)jsonDict;

@end