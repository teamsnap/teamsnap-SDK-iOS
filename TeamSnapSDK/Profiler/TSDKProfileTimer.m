//
//  TSDKProfileTimer.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 8/29/15.
//  Copyright © 2015 TeamSnap. All rights reserved.
//

#import "TSDKProfileTimer.h"
#import "TSDKLogging.h"
#import "TSDKMutableDictionary.h"

@interface TSDKProfileTimer()

@property (strong, nonatomic) TSDKMutableDictionary *timers;
@property (strong, nonatomic) TSDKMutableDictionary *totalTimes;

@end

@implementation TSDKProfileTimer

+ (instancetype) sharedInstance {
#ifdef DEBUG
    static TSDKProfileTimer *_sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[TSDKProfileTimer alloc] init];
    });
    
    return _sharedInstance;
#else
    return nil;
#endif
}

-(instancetype) init {
    self = [super init];
    if (self) {
        _timers = [[TSDKMutableDictionary alloc] init];
        _totalTimes = [[TSDKMutableDictionary alloc] init];
    }
    return self;
}

-(void) startTimeWithId:(id)timerId {
    if (timerId) {
        [self.timers setObject:[NSDate date] forKey:timerId];
    }
}

-(NSTimeInterval) getElapsedTimeForId:(id)timerId {
    if (timerId) {
        NSTimeInterval elapsedTime = [[NSDate date] timeIntervalSinceDate:[self.timers objectForKey:timerId]];
        [self addElapsedTime:elapsedTime toTotalForId:timerId];
        return elapsedTime;
    } else {
        return 0.00f;
    }
}

-(NSTimeInterval) getElapsedTimeForId:(id)timerId  logResult:(BOOL)logResult {
    if (timerId) {
        NSTimeInterval elepasedTime = [self getElapsedTimeForId:timerId];
        if (logResult) {
            DLog(@"Elapsed %@\n %f (%f)", timerId, elepasedTime, [self cumulativeTimeForId:timerId]);
        }
        return elepasedTime;
    } else {
        return 0.00f;
    }
}

-(void) addElapsedTime:(NSTimeInterval)elapsedTime toTotalForId:(id)timerId {
    if (timerId) {
        NSNumber *totalTimeNumber = [_totalTimes objectForKey:timerId];
        NSTimeInterval totalTime = elapsedTime;
        if (totalTimeNumber) {
            totalTime = elapsedTime + [totalTimeNumber floatValue];
        }
        NSNumber *ETN = [NSNumber numberWithFloat:totalTime];
        [_totalTimes setObject:ETN forKey:timerId];
    }
}

-(NSTimeInterval) cumulativeTimeForId:(id)timerId {
    if (timerId) {
        NSNumber *totalTimeNumber = [_totalTimes objectForKey:timerId];
        if (totalTimeNumber) {
            return [totalTimeNumber floatValue];
        } else {
            return 0.00f;
        }
    } else {
        return 0.00f;
    }
}

- (void)resetTimerWithId:(id)timerId {
    if (timerId) {
        [self.totalTimes removeObjectForKey:timerId];
        [self.timers removeObjectForKey:timerId];
    }
}

- (void)resetAllTimers {
    [self.totalTimes removeAllObjects];
    [self.timers removeAllObjects];
}

@end
