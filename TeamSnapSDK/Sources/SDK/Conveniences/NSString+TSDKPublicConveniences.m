//
//  NSString+TSDKPublicConveniences.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 12/14/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "NSString+TSDKPublicConveniences.h"

@implementation NSString (TSDKPublicConveniences)

- (NSComparisonResult)compareTSDKObjectId:(NSString *)compareId {
    if ((compareId == nil) || ([compareId respondsToSelector:@selector(integerValue)] == NO)) {
        return NSOrderedDescending;
    }
    NSInteger value = [self integerValue];
    NSInteger comparisonValue = [compareId integerValue];
    if (value < comparisonValue) {
        return NSOrderedAscending;
    } else if (value > comparisonValue) {
        return NSOrderedDescending;
    } else {
        return [self compare:compareId];
    }
}

@end
