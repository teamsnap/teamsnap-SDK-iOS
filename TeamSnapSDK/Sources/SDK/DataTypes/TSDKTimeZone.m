//
//  TSDKTimeZone.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 4/22/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKTimeZone.h"

@implementation TSDKTimeZone

@dynamic ianaName, offset;

+ (NSString *)SDKType {
    return @"TimeZone";
}

+ (NSURL *)bundledFileURL {
    return [[NSBundle bundleForClass:[self class]] URLForResource:[self SDKREL] withExtension:@"json"];
}

- (NSString *)timeZoneDescription {
    return [self getString:@"description"];
}

- (void)setTimeZoneDescription:(NSString *)timeZoneDescription {
    [self setString:timeZoneDescription forKey:@"description"];
}

- (NSTimeZone *)nsTimeZone {
    return [NSTimeZone timeZoneWithName:self.ianaName];
}

@end
