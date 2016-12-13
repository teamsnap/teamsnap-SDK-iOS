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
    if ([self objectForKey:object.objectIdentifier]) {
        [[self objectForKey:object.objectIdentifier] setCollection:object.collection];
    } else {
        [self setObject:object forKey:object.objectIdentifier];
    }
}

@end
