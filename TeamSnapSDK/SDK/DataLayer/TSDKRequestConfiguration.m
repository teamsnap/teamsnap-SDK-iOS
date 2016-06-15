//
//  TSDKRequestConfiguration.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 2/22/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKRequestConfiguration.h"

@implementation TSDKRequestConfiguration

+ (instancetype)defaultRequestConfiguration {
    TSDKRequestConfiguration *configuration = [[TSDKRequestConfiguration alloc] init];
    return configuration;
}

+ (instancetype)requestConfigurationWithForceReload:(BOOL)forceReload {
    TSDKRequestConfiguration *configuration = [[TSDKRequestConfiguration alloc] init];
    [configuration setForceReload:forceReload];
    return configuration;
}

+ (instancetype)requestConfigurationWithForceReload:(BOOL)forceReload withPriority:(CGFloat)priority;{
    TSDKRequestConfiguration *configuration = [[TSDKRequestConfiguration alloc] init];
    [configuration setForceReload:forceReload];
    [configuration setPriority:priority];
    return configuration;
}


- (instancetype)init {
    self = [super init];
    if (self) {
        _forceReload = NO;
        _priority = NSURLSessionTaskPriorityDefault;
    }
    return self;
}

@end
