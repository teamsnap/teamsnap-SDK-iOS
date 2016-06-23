//
//  TSDKRequestConfiguration.h
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 2/22/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface TSDKRequestConfiguration : NSObject

/**
 *  Initializes a standard request configuration with priority of 0.5 and forceReload = NO
 *
 *  @return An initialized request configuration
 */
+ (instancetype)defaultRequestConfiguration;

/**
 *  Initializes a request configuration with priority of 0.5
 *
 *  @param forceReload Specifies if cache will be used if available
 *
 *  @return An initialized request configuration
 */
+ (instancetype)requestConfigurationWithForceReload:(BOOL)forceReload;

/**
 *  Initializes a standard request configuration
 *
 *  @param forceReload Specifies if cache will be used if available
 *  @param priority    The relative priority at which you’d like a host to handle the task, specified as a floating point value between 0.0 (lowest priority) and 1.0 (highest priority). There are three named priorities you can employ, described in NSURLSessionTask Priority.
 *
 *  @return An initialized request configuration
 */
+ (instancetype)requestConfigurationWithForceReload:(BOOL)forceReload withPriority:(CGFloat)priority;

/**
 *  Specifies if cache will be used if available
 */
@property (nonatomic, assign) BOOL forceReload;

/**
 *  The relative priority at which you’d like a host to handle the task, specified as a floating point value between 0.0 (lowest priority) and 1.0 (highest priority).
 */
@property (nonatomic, assign) CGFloat priority;

@end
