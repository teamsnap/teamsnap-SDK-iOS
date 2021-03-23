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

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-implementations"
@implementation TSDKNetworkActivityIndicator
#pragma clang diagnostic pop

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
    [self setActivityIndicatorVisible:YES];
}

- (void)stopActivity {
    
    BOOL showIndicator;
    @synchronized(self) {
        if (_numberOfActivities) {
            _numberOfActivities--;
        }
        showIndicator = (_numberOfActivities > 0);
    }
    [self setActivityIndicatorVisible:showIndicator];
}


- (void)setActivityIndicatorVisible:(BOOL)visible {
    Class UIApplicationClass = NSClassFromString(@"UIApplication");
    BOOL hasApplication = UIApplicationClass && [UIApplicationClass respondsToSelector:@selector(sharedApplication)];
    if (hasApplication) {
        UIApplication *app = [UIApplicationClass performSelector:@selector(sharedApplication)];
        dispatch_async(dispatch_get_main_queue(), ^{
            app.networkActivityIndicatorVisible = visible;
        });
    }
}

@end
