//
// Created by Jason Rahaim on 2/6/15.
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (TSDKConveniences)


- (NSString *)stringWithFormat:(NSString *)format;

- (NSString *)shortString;

- (NSString *)YYYYMMDDString;

- (NSString *)RCF3339DateTimeString;
@end