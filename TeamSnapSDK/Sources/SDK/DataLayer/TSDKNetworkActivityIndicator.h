//
//  TSDKNetworkActivityIndicator.h
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 6/29/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_CLASS_DEPRECATED_IOS(3_0, 13_0, "Functionality removed in iOS 13+")
@interface TSDKNetworkActivityIndicator : NSObject

+ (instancetype _Nonnull)sharedInstance;
- (void)startActivity;
- (void)stopActivity;

@end
