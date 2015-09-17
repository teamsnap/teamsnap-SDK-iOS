//
//  NSHTTPURLResponse+convenience.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 1/9/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "NSHTTPURLResponse+convenience.h"

@implementation NSHTTPURLResponse (convenience)

- (BOOL)wasSuccess{
    if ((self.statusCode >= 200) && (self.statusCode<=299)) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)completed {
    return ([self wasSuccess] && (self.statusCode != 206));
}

@end
