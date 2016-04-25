//
// Created by Jason Rahaim on 2/6/15.
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "NSDate+TSDKConveniences.h"


@implementation NSDate (TSDKConveniences)

- (NSString *)stringWithFormat:(NSString *)format {
    NSString *result = @"";
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];

    NSLocale *enUSPOSIXLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    
    [dateFormatter setLocale:enUSPOSIXLocale];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    
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
    NSString *dateFormat = @"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'";
    return [self stringWithFormat:dateFormat];
}

- (BOOL)isSameDayAs:(NSDate *)dateToCompare {
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
    NSDateComponents* comp1 = [calendar components:unitFlags fromDate:self];
    NSDateComponents* comp2 = [calendar components:unitFlags fromDate:dateToCompare];
    
    return [comp1 day]   == [comp2 day] &&
    [comp1 month] == [comp2 month] &&
    [comp1 year]  == [comp2 year];
}

@end