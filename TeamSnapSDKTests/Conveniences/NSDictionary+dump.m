//
//  NSDictionary+dump.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 2/5/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "NSDictionary+dump.h"

@implementation NSDictionary (dump)

- (NSString *)dump {
    return [NSDictionary dumpDictionary:self];
}

+ (NSString *)dumpDictionary:(NSDictionary *)dictionary {
    NSMutableString *result = [NSMutableString stringWithString:@"@{"];
    NSMutableArray *subResults = [[NSMutableArray alloc] init];
    for (NSString *key in dictionary) {
        NSString *keyResult = nil;
        id object = [dictionary objectForKey:key];
        if ([object isKindOfClass:[NSString class]]) {
            keyResult = [NSString stringWithFormat:@"@\"%@\"", (NSString *)object];
        } else if ([object isKindOfClass:[NSDictionary class]]) {
            keyResult = [self dumpDictionary:(NSDictionary *)object];
        } else if ([object isKindOfClass:[NSArray class]]) {
            keyResult = [self dumpArray:(NSArray *)object];
        } else if ([object isKindOfClass:[NSNumber class]]) {
            keyResult = [NSString stringWithFormat:@"@%@",[(NSNumber *)object stringValue]];
        } else if ([object isEqual:[NSNull null]]) {
            keyResult = @"[NSNull null]";
        }
        if (keyResult) {
            NSString *subItem = [NSString stringWithFormat:@"@\"%@\":%@",key,keyResult];
            [subResults addObject:subItem];
        }
    }
    if ([subResults count]>0) {
        [result appendString:[subResults componentsJoinedByString:@","]];
    }
    [result appendString:@"}"];
    return result;
}

+ (NSString *)dumpArray:(NSArray *)array {
    NSMutableString *result = [NSMutableString stringWithString:@"@["];
    NSMutableArray *subResults = [[NSMutableArray alloc] init];
    for (id object in array) {
        NSString *keyResult = nil;
        if ([object isKindOfClass:[NSString class]]) {
            keyResult = [NSString stringWithFormat:@"@\"%@\"", (NSString *)object];
        } else if ([object isKindOfClass:[NSDictionary class]]) {
            keyResult = [self dumpDictionary:(NSDictionary *)object];
        } else if ([object isKindOfClass:[NSArray class]]) {
            keyResult = [self dumpArray:(NSArray *)object];
        } else if ([object isKindOfClass:[NSNumber class]]) {
            keyResult = [NSString stringWithFormat:@"@%@",[(NSNumber *)object stringValue]];
        } else if ([object isEqual:[NSNull null]]) {
            keyResult = @"[NSNull null]";
        }
        if (keyResult) {
            NSString *subItem = [NSString stringWithFormat:@"%@",keyResult];
            [subResults addObject:subItem];
        }
    }
    if ([subResults count]>0) {
        [result appendString:[subResults componentsJoinedByString:@","]];
    }
    [result appendString:@"]"];
    return result;
}


@end
