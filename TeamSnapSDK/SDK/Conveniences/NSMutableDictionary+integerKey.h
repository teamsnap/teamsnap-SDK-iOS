//
//  NSMutableDictionary+integerKey.h
//  SDKPlayground
//
//  Created by Jason Rahaim on 9/2/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (integerKey)

- (id _Nullable)valueForIntegerKey:(NSInteger)integerKey;
- (void)setValue:(id _Nonnull)value forIntegerKey:(NSInteger)integerKey;
- (id _Nullable)objectForIntegerKey:(NSInteger)integerKey;
- (void)setObject:(id _Nonnull)anObject forIntegerKey:(NSInteger)integerKey;

@end
