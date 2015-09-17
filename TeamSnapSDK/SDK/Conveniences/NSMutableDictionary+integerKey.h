//
//  NSMutableDictionary+integerKey.h
//  SDKPlayground
//
//  Created by Jason Rahaim on 9/2/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (integerKey)

- (id)valueForIntegerKey:(NSInteger)integerKey;
- (void)setValue:(id)value forIntegerKey:(NSInteger)integerKey;

@end
