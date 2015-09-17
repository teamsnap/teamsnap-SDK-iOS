//
//  TSPCache.h
//  SDKPlayground
//
//  Created by Jason Rahaim on 8/19/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "TSDKCollectionObject.h"

@interface TSPCache : NSObject


+(void)setCacheRootPath:(NSURL *)rootPath;
+(NSURL *)cacheRootPath;

+(void)setCacheMaxAgeInMinutes:(NSUInteger)maxAge;
+(NSUInteger)cacheMaxAgeInMinutes;

+(void)invalidateAll;
+(void)invaidateObjectsOfClass:(Class)objectClass;
+(void)invaidateObjectOfClass:(Class)objectClass withId:(NSUInteger)objectId;

+(void)saveObject:(TSDKCollectionObject *)collectionObject;
+(TSDKCollectionObject *)objectOfClass:(Class)objectClass withId:(NSUInteger)objectId;

@end
