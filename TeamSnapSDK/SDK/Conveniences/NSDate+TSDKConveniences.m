//
// Created by Jason Rahaim on 2/6/15.
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "NSDate+TSDKConveniences.h"


@implementation NSDate (TSDKConveniences)

- (NSString *)stringWithFormat:(NSString *)format {
    NSString *result = @"";
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];

    // Sun, Feb 3, 2012
    [dateFormatter setDateFormat:format];

    // [dateFormatter setDateStyle:NSDateFormatterLongStyle];
    // [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    result = [dateFormatter stringFromDate:self];
    return result;
}

- (NSString *)shortString {
    return [self stringWithFormat:@"MMM d, yyyy"];
}

-(NSString *)YYYYMMDDString {
    return [self stringWithFormat:@"yyyy-MM-dd"];
}

- (NSString *)RCF3339DateTimeString {
    NSString *dateFormat = @"yyyy'-'MM'-'dd'T'HH':'mm':'ss.SSSz";
    return [self stringWithFormat:dateFormat];
}

@end