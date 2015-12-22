//
// Created by Jason Rahaim on 1/29/15.
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "NSString+TSDKConveniences.h"


@implementation NSString (TSDKConveniences)

-(NSDate *)dateFromFormat:(NSString *)incomingFormat {
    if ([self isEqualToString:@""]) {
        return nil;
    } else {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];

        // example: 1980-01-26T06:00:00Z
        //[dateFormatter setDateFormat:@"yyyy-MM-dd'T'H:mm:ss'Z'"];
        //[dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        [dateFormatter setDateFormat:incomingFormat];
        //NSDate *date = [dateFormatter dateFromString:dateString];
        NSDate *date = nil;
        NSError *error = nil;
        [dateFormatter getObjectValue:&date forString:self range:nil error:&error];

        return date;
    }
}

- (NSDate *)dateFromRCF3339DateTimeString {
    return [self dateFromFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"];
}

- (NSDate *)dateFromJustDate {
    return [self dateFromFormat:@"yyyy'-'MM'-'dd"];
}

- (NSString *)addClassNameToDescriptor:(NSString *)className {
    if ([self isEqualToString:@"description"]) {
        NSString *strippedClassName = [className substringFromIndex:4];
        strippedClassName = [[[strippedClassName substringToIndex:1] lowercaseString] stringByAppendingString:[strippedClassName substringFromIndex:1]];
        return [NSString stringWithFormat:@"%@_%@", strippedClassName, self];
    } else {
        return self;
    }
}

- (NSString *)stripClassNameFromDescriptor:(NSString *)className {
    if (![self containsString:@"description"]) {
        return self;
    }
    
    NSString *strippedClassName = [[className substringFromIndex:4] lowercaseString];
    
    if ([[self substringToIndex:strippedClassName.length] isEqualToString:strippedClassName]) {
        return [self substringFromIndex:strippedClassName.length+1];
    }
    return self;
}

- (NSString *)camelCaseToUnderscores {
    NSMutableString *output = [NSMutableString string];
    NSCharacterSet *uppercase = [NSCharacterSet uppercaseLetterCharacterSet];
    for (NSInteger idx = 0; idx < [self length]; idx += 1) {
        unichar c = [self characterAtIndex:idx];
        if ([uppercase characterIsMember:c]) {
            [output appendFormat:@"_%@", [[NSString stringWithCharacters:&c length:1] lowercaseString]];
        } else {
            [output appendFormat:@"%C", c];
        }
    }
    return output;
}

- (NSString *)underscoresToMixedCase {
    NSMutableString *output = [NSMutableString string];
    BOOL makeNextCharacterUpperCase = YES;
    for (NSInteger idx = 0; idx < [self length]; idx += 1) {
        unichar c = [self characterAtIndex:idx];
        if (c == '_') {
            makeNextCharacterUpperCase = YES;
        } else if (makeNextCharacterUpperCase) {
            [output appendString:[[NSString stringWithCharacters:&c length:1] uppercaseString]];
            makeNextCharacterUpperCase = NO;
        } else {
            [output appendFormat:@"%C", c];
        }
    }
    return output;
}

- (NSString *)underscoresToCamelCase {
    NSMutableString *output = [NSMutableString string];
    BOOL makeNextCharacterUpperCase = NO;
    for (NSInteger idx = 0; idx < [self length]; idx += 1) {
        unichar c = [self characterAtIndex:idx];
        if (c == '_') {
            makeNextCharacterUpperCase = YES;
        } else if (makeNextCharacterUpperCase) {
            [output appendString:[[NSString stringWithCharacters:&c length:1] uppercaseString]];
            makeNextCharacterUpperCase = NO;
        } else {
            [output appendFormat:@"%C", c];
        }
    }
    return output;
}

- (BOOL)isSetter {
    NSMutableString *output = [NSMutableString string];
    NSCharacterSet *uppercase = [NSCharacterSet uppercaseLetterCharacterSet];
    for (NSInteger idx = 0; idx < [self length]; idx += 1) {
        unichar c = [self characterAtIndex:idx];
        if ([uppercase characterIsMember:c]) {
            return ([output isEqualToString:@"set"]);
        } else {
            [output appendFormat:@"%C", c];
        }
    }
    return NO;
}

- (NSString *)linkForGetProperty {
    if ([[self substringToIndex:3] isEqualToString:@"get"] && [[self substringFromIndex:self.length - 15] isEqualToString:@"WithCompletion:"]) {
        return [NSString stringWithFormat:@"link%@",[[self substringToIndex:self.length - 15]substringFromIndex:3]];
    } else {
        return nil;
    }
}

-(NSString *)typeFromRel:(NSString *)rel {
    if (!rel) {
        return nil;
    } else if ([rel isEqualToString:@"root"]) {
        return @"root";
    } else if ([[rel substringFromIndex:rel.length-3] isEqualToString:@"ies"]) {
        return [NSString stringWithFormat:@"%@%@", [rel substringToIndex:rel.length-3],@"y"];
    } else {
        return [rel substringToIndex:rel.length-1];
    }
}

@end