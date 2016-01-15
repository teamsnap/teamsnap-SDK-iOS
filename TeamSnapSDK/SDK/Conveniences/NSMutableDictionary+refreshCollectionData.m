//
//  NSMutableDictionary+refreshCollectionData.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 1/11/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "NSMutableDictionary+refreshCollectionData.h"
#import "NSMutableDictionary+integerKey.h"

@implementation NSMutableDictionary (refreshCollectionData)

- (void)refreshCollectionObject:(TSDKCollectionObject *)object {
    if ([self objectForIntegerKey:object.objectIdentifier]) {
        [[self objectForIntegerKey:object.objectIdentifier] setCollection:object.collection];
    } else {
        [self setObject:object forIntegerKey:object.objectIdentifier];
    }
}

@end
