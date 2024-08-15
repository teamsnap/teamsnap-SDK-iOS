//
// Created by Jason Rahaim on 1/29/15.
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "NSObject+TSDKIntegerOtNotFound.h"


@implementation NSObject (TSDKIntegerOtNotFound)

- (NSInteger)integerValueOrNotFound {
    if ([self isEqual:[NSNull null]]) {
        return NSNotFound;
    } else if ([self isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *) self integerValue];
    } else if ([self isKindOfClass:[NSString class]] && ([(NSString *)self isEqual:@""] == NO)) {
        return [(NSString *) self integerValue];
    } else {
        return NSNotFound;
    }
}

@end