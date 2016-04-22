//
//  TSDKTimeZone.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 4/22/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKTimeZone.h"

@implementation TSDKTimeZone

@dynamic ianaName, offset, timeZoneDescription;

+ (NSString *)SDKType {
    return @"TimeZone";
}

@end
