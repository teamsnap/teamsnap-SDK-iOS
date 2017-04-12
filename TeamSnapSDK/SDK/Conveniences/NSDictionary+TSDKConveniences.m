//
//  NSDictionary+TSDKConveniences.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 4/11/17.
//  Copyright © 2017 teamsnap. All rights reserved.
//

#import "NSDictionary+TSDKConveniences.h"

@implementation NSDictionary (TSDKConveniences)

+ (instancetype)dictionaryWithDictionary:(NSDictionary *)dictionary withValue:(id _Nullable)value forKey:(NSString *_Nonnull)key {
    NSMutableDictionary *tempDictionary = [NSMutableDictionary dictionaryWithDictionary:dictionary];
    [tempDictionary setValue:value forKey:key];
    return [NSDictionary dictionaryWithDictionary:tempDictionary];
}


+ (instancetype)dictionaryWithDictionary:(NSDictionary *)dictionary removeObjectForKey:(NSString *)key {
    NSMutableDictionary *tempDictionary = [NSMutableDictionary dictionaryWithDictionary:dictionary];
    [tempDictionary removeObjectForKey:key];
    return [NSDictionary dictionaryWithDictionary:tempDictionary];
}


- (NSDictionary *_Nonnull)dictionaryWithValue:(id _Nullable)value forKey:(NSString *_Nonnull)key {
    return [NSDictionary dictionaryWithDictionary:self withValue:value forKey:key];
}

@end
