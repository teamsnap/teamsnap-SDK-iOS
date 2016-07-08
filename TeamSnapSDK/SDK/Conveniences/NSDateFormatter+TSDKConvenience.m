//
//  NSDateFormatter+TSDKConvenience.m
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 6/24/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "NSDateFormatter+TSDKConvenience.h"

@implementation NSDateFormatter (TSDKConvenience)

+ (NSDateFormatter *)RCF3339Style1DateFormatter {
    static NSDateFormatter *dateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        NSLocale *enUSPOSIXLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        
        [dateFormatter setLocale:enUSPOSIXLocale];
        [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
        
        [dateFormatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"];
    });
    
    return dateFormatter;
}
+ (NSDateFormatter *)RCF3339Style2DateFormatter {
    static NSDateFormatter *dateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        NSLocale *enUSPOSIXLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        
        [dateFormatter setLocale:enUSPOSIXLocale];
        [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
        
        [dateFormatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"];
    });
    
    return dateFormatter;
}
+ (NSDateFormatter *)RCF3339Style3DateFormatter {
    static NSDateFormatter *dateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        NSLocale *enUSPOSIXLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        
        [dateFormatter setLocale:enUSPOSIXLocale];
        [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
        
        [dateFormatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'SSSZZZ"];
    });
    
    return dateFormatter;

}
+ (NSDateFormatter *)yearMonthDateFormatter {
    static NSDateFormatter *dateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    });
    
    return dateFormatter;

}
+ (NSDateFormatter *)monthDateYearFormatter {
    static NSDateFormatter *dateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        
        [dateFormatter setDateFormat:@"MMM d, yyyy"];
    });
    
    return dateFormatter;

}

@end
