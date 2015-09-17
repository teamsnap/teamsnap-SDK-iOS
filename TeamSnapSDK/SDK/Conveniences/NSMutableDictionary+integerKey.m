//
//  NSMutableDictionary+integerKey.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 9/2/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "NSMutableDictionary+integerKey.h"

@implementation NSMutableDictionary (integerKey)

- (id)valueForIntegerKey:(NSInteger)integerKey {
    return [self valueForKey:[[NSNumber numberWithInteger:integerKey] stringValue]];
}

- (void)setValue:(id)value forIntegerKey:(NSInteger)integerKey {
    [self setValue:value forKey:[[NSNumber numberWithInteger:integerKey] stringValue]];
}

@end
