//
//  TSDKProfileTimer.h
//  SDKPlayground
//
//  Created by Jason Rahaim on 8/29/15.
//  Copyright © 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSDKProfileTimer : NSObject

+ (instancetype)sharedInstance;

-(void)startTimeWithId:(id)timerId;
-(NSTimeInterval)getElapsedTimeForId:(id)timerId;
-(NSTimeInterval)getElapsedTimeForId:(id)timerId logResult:(BOOL)logResult;
-(NSTimeInterval)cumulativeTimeForId:(id)timerId;
- (void)resetTimerWithId:(id)timerId;
- (void)resetAllTimers;

@end
