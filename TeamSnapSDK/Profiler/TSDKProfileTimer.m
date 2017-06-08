//
//  TSDKProfileTimer.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 8/29/15.
//  Copyright © 2015 TeamSnap. All rights reserved.
//

#import "TSDKProfileTimer.h"
#import "TSDKLogging.h"

@interface TSDKProfileTimer()

@property (strong, nonatomic) NSMutableDictionary <id<NSCoding>, NSDate *> *timers;
@property (strong, nonatomic) NSMutableDictionary <id<NSCoding>, NSNumber *> *totalTimes;
@property (strong, nonatomic) dispatch_queue_t accessQueue;

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
        _timers = [[NSMutableDictionary alloc] init];
        _totalTimes = [[NSMutableDictionary alloc] init];
        _accessQueue = dispatch_queue_create("com.teamsnap.perf.timer", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

-(void) startTimeWithId:(id)timerId {
    if (timerId) {
        NSDate *timerDate = [NSDate date];
        dispatch_sync(self.accessQueue, ^{
            [self.timers setObject:timerDate
                            forKey:timerId];
        });
    }
}

-(NSTimeInterval) getElapsedTimeForId:(id)timerId {
    if (timerId) {
        NSDate *__block currentDate;
        dispatch_sync(self.accessQueue, ^{
            currentDate = [self.timers objectForKey:timerId];
        });
        
        NSTimeInterval elapsedTime = [[NSDate date] timeIntervalSinceDate:currentDate];
        [self addElapsedTime:elapsedTime toTotalForId:timerId];
        
        return elapsedTime;
    } else {
        return 0.00f;
    }
}

-(void)logElapsedTimeForId:(id)timerId {
    if (timerId) {
        DLog(@"Elapsed %@\n %f (%f)", timerId, [self getElapsedTimeForId:timerId], [self cumulativeTimeForId:timerId]);
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
        
        dispatch_sync(self.accessQueue, ^{
            [self.totalTimes setObject:ETN forKey:timerId];
        });
    }
}

-(NSTimeInterval) cumulativeTimeForId:(id)timerId {
    if (timerId) {
        NSNumber *__block totalTimeNumber;
        dispatch_sync(self.accessQueue, ^{
            totalTimeNumber = [self.totalTimes objectForKey:timerId];
        });
        
        if (totalTimeNumber) {
            return [totalTimeNumber floatValue];
        } else {
            return 0.00f;
        }
    } else {
        return 0.00f;
    }
}

- (void)resetTimerWithId:(NSObject<NSCoding> *)timerId {
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
