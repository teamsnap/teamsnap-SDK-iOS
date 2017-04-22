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


+(void)setCacheRootPath:(NSURL *_Nonnull)rootPath;
+(NSURL *_Nullable)cacheRootPath;

+(void)setCacheMaxAgeInMinutes:(NSUInteger)maxAge;
+(NSUInteger)cacheMaxAgeInMinutes;

+(void)invalidateAll;
+(void)invaidateObjectsOfClass:(Class _Nonnull)objectClass;
+(void)invaidateObjectOfClass:(Class _Nonnull)objectClass withId:(NSString * _Nonnull)objectId;

+(void)saveObject:(TSDKCollectionObject *_Nonnull)collectionObject;
+(TSDKCollectionObject *_Nullable)objectOfClass:(Class _Nonnull)objectClass withId:(NSString * _Nullable)objectId;
+ (void)saveDictionaryOfObjects:(NSDictionary *_Nonnull)dictionaryOfObjects ofType:(Class _Nullable)objectClass;
+ (NSDictionary *_Nullable)loadDictionaryOfObjectsOfType:(Class _Nonnull)objectClass;

+ (BOOL)saveSchemas:(NSArray *_Nonnull)schemaArray WithVersion:(NSString *_Nonnull)schemaVersion;
+ (NSArray *_Nullable)loadSchemasIfCachedVersion:(NSString *_Nonnull)schemaVersion;

@end
