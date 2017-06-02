//
//  NSDictionary+TSDKConveniences.h
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 4/11/17.
//  Copyright © 2017 teamsnap. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (TSDKConveniences)


+ (instancetype _Nonnull)dictionaryWithDictionary:(NSDictionary *_Nullable)dictionary withValue:(id _Nullable)value forKey:(NSString *_Nonnull)key;
+ (instancetype _Nonnull)dictionaryWithDictionary:(NSDictionary *_Nonnull)dictionary removeObjectForKey:(NSString *_Nonnull)key;
- (NSDictionary *_Nonnull)dictionaryWithValue:(id _Nullable)value forKey:(NSString *_Nonnull)key;

@end
