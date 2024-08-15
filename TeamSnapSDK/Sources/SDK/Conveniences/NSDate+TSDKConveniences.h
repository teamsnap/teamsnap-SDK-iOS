//
// Created by Jason Rahaim on 2/6/15.
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (TSDKConveniences)

- (NSString *_Nullable)shortString;

- (NSString *_Nullable)YYYYMMDDString;

- (NSString *_Nullable)YYYYMMDDStringFromGregorianCalendar;

- (NSString *_Nullable)RCF3339DateTimeString;

- (NSInteger)age;

@end
