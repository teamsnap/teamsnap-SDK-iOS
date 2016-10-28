//
// Created by Jason Rahaim on 1/29/15.
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "NSString+TSDKConveniences.h"
#import "NSDateFormatter+TSDKConvenience.h"

@implementation NSString (TSDKConveniences)

- (NSDate *)dateFromRCF3339DateTimeString {
    NSDate *result = [[NSDateFormatter RCF3339Style1DateFormatter] dateFromString:self];
    if (!result) {
        result = [[NSDateFormatter RCF3339Style2DateFormatter] dateFromString:self];
    }
    if (!result) {
        result = [[NSDateFormatter RCF3339Style3DateFormatter] dateFromString:self];
    }
    return result;
}

- (NSDate *)dateFromJustDate {
    return [[NSDateFormatter yearMonthDateFormatter] dateFromString:self];
}

// accespts 'TSDK'+ClassName and returns class_name
- (NSString *)classNameToUnderscoredName {
     NSString *baseClassName = [[[self substringFromIndex:4] camelCaseToUnderscores] substringFromIndex:1];
    
    return baseClassName;
}

- (NSString *)addClassNameToDescriptor:(NSString *)className {
    if ([self isEqualToString:@"description"]) {
        NSString *strippedClassName = [className classNameToUnderscoredName];
        return [NSString stringWithFormat:@"%@_%@", strippedClassName, self];
    } else {
        return self;
    }
}

- (NSString *)stripClassNameFromDescriptor:(NSString *)className {
    if (![self containsString:@"description"]) {
        return self;
    }
    
    NSString *strippedClassName = [className classNameToUnderscoredName];
    
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
    } else if ([[self substringToIndex:3] isEqualToString:@"get"] && [[self substringFromIndex:self.length - 29] isEqualToString:@"WithConfiguration:completion:"]) {
        return [NSString stringWithFormat:@"link%@",[[self substringToIndex:self.length - 29]substringFromIndex:3]];
    } else {
        return nil;
    }
}

-(NSString *)typeFromRel {
    if ([self isEqualToString:@"root"]) {
        return @"root";
    } else if ([[self substringFromIndex:self.length-3] isEqualToString:@"ies"]) {
        return [NSString stringWithFormat:@"%@%@", [self substringToIndex:self.length-3],@"y"];
    } else {
        return [self substringToIndex:self.length-1];
    }
}

+ (NSString *)GUID {
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    NSString *result = [NSString stringWithFormat:@"%@", string];
    CFRelease(theUUID);
    CFRelease(string);
    return  result;
}

@end
