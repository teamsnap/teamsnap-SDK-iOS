//
//  TSDKNetworkActivityIndicator.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 6/29/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKNetworkActivityIndicator.h"

@interface TSDKNetworkActivityIndicator()

@property NSUInteger numberOfActivities;

@end

@implementation TSDKNetworkActivityIndicator

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static TSDKNetworkActivityIndicator *_defaultIndicator;
    dispatch_once(&onceToken, ^{
        _defaultIndicator = [[TSDKNetworkActivityIndicator alloc] init];
        _defaultIndicator.numberOfActivities = 0;
    });
    return _defaultIndicator;
}

- (void)startActivity {
    @synchronized(self) {
        _numberOfActivities++;
    }
    #if !defined(TSDK_TARGET_APP_EXTENSIONS)
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    });
    #endif
}

- (void)stopActivity {
    
    BOOL showIndicator;
    @synchronized(self) {
        if (_numberOfActivities) {
            _numberOfActivities--;
        }
        showIndicator = (_numberOfActivities > 0);
    }
    #if !defined(TSDK_TARGET_APP_EXTENSIONS)
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIApplication sharedApplication].networkActivityIndicatorVisible = showIndicator;
    });
    #endif
}

@end
