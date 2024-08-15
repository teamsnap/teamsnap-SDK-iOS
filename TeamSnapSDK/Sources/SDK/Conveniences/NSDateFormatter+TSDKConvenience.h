//
//  NSDateFormatter+TSDKConvenience.h
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 6/24/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDateFormatter (TSDKConvenience)

/**
 *  Creates a singleton date formatter with format yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'
 *
 *  @return A date formatter with format yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'
 */
+ (NSDateFormatter *_Nonnull)RCF3339Style1DateFormatter;
/**
 *  yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ
 *
 *  @return yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ
 */
+ (NSDateFormatter *_Nonnull)RCF3339Style2DateFormatter;
/**
 *  yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'SSSZZZ
 *
 *  @return yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'SSSZZZ
 */
+ (NSDateFormatter *_Nonnull)RCF3339Style3DateFormatter;
/**
 *  Creates a singleton date formatter with format yyyy-MM-dd
 *
 *  @return A date formatter with format yyyy-MM-dd
 */
+ (NSDateFormatter *_Nonnull)yearMonthDateFormatter;
/**
 *  Creates a singleton date formatter with format yyyy-MM-dd forced to the Gregorian calendar
 *
 *  @return A date formatter with format yyyy-MM-dd
 */
+ (NSDateFormatter *_Nonnull)gregorianYearMonthDateFormatter;
/**
 *  Creates a singleton date formatter with format MMM d, yyyy
 *
 *  @return A date formatter with format MMM d, yyyy
 */
+ (NSDateFormatter *_Nonnull)monthDateYearFormatter;

@end
