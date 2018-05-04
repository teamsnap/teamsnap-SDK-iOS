//
// Created by Jason Rahaim on 2/6/15.
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "NSDate+TSDKConveniences.h"
#import "NSDateFormatter+TSDKConvenience.h"

@implementation NSDate (TSDKConveniences)

- (NSString *)shortString {
    return [[NSDateFormatter monthDateYearFormatter] stringFromDate:self];
}

-(NSString *)YYYYMMDDString {
    return [[NSDateFormatter yearMonthDateFormatter] stringFromDate:self];
}

- (NSString *)RCF3339DateTimeString {
    return [[NSDateFormatter RCF3339Style1DateFormatter] stringFromDate:self];
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

- (NSInteger)age {
    NSDate* now = [NSDate date];
    NSDateComponents* ageComponents = [[NSCalendar currentCalendar]
                                       components:NSCalendarUnitYear
                                       fromDate:self
                                       toDate:now
                                       options:0];
    NSInteger age = [ageComponents year];
    return age;
}

@end
