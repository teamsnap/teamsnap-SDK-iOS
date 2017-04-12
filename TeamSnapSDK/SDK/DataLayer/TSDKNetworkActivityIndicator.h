//
//  TSDKNetworkActivityIndicator.h
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 6/29/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSDKNetworkActivityIndicator : NSObject

+ (instancetype _Nonnull)sharedInstance;
- (void)startActivity;
- (void)stopActivity;

@end
