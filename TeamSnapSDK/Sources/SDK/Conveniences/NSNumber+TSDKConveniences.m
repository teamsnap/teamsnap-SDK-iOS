//
//  NSNumber+TSDKConveniences.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 3/17/17.
//  Copyright © 2017 teamsnap. All rights reserved.
//

#import "NSNumber+TSDKConveniences.h"

@implementation NSNumber (TSDKConveniences)

- (BOOL)isWholeNumber {
    double dValue = [self doubleValue];
    if (dValue < 0.0) {
        return (dValue == ceil(dValue));
    } else {
        return (dValue == floor(dValue));
    }
}

@end
