//
//  TSDKProfileTimer.h
//  SDKPlayground
//
//  Created by Jason Rahaim on 8/29/15.
//  Copyright © 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TSDKProfileTimer : NSObject

+ (instancetype)sharedInstance;

/**
 Marks a point in time for a task with a unique identifier.
 
 @warning ⚠️ Do not use this for performance-sensitive, high-resolution timing. The number returned
 here should be considered an approximation for general timing of long-running tasks (like
 network requests).
 
 @param timerId A unique ID used to identify a timed task
 */
-(void)startTimeWithId:(id)timerId;

/**
 Logs the current elapsed time for a task marked by a unique identifier.
 
 @warning ⚠️ Do not use this for performance-sensitive, high-resolution timing. The number returned
 here should be considered an approximation for general timing of long-running tasks (like
 network requests).
 
 @param timerId A unique ID used to identify a timed task
 */
-(void)logElapsedTimeForId:(id)timerId;
-(NSTimeInterval)cumulativeTimeForId:(id)timerId;
- (void)resetTimerWithId:(id)timerId;
- (void)resetAllTimers;

@end

NS_ASSUME_NONNULL_END
