//
// Created by Jason Rahaim on 1/29/15.
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TSDKConveniences)

- (NSDate *)dateFromRCF3339DateTimeString;
- (NSDate *)dateFromJustDate;
- (NSString *)addClassNameToDescriptor:(NSString *)className;
- (NSString *)stripClassNameFromDescriptor:(NSString *)className;

- (NSString *)camelCaseToUnderscores;
- (NSString *)underscoresToMixedCase;
- (NSString *)underscoresToCamelCase;
- (BOOL)isSetter;

- (NSString *)linkForGetProperty;
- (NSString *)typeFromRel;

+(NSString *)getGUID;

@end