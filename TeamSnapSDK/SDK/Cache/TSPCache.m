//
//  TSPCache.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 8/19/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSPCache.h"

NSURL static *_rootPath = nil;
NSURL static *_basePath = nil;
NSUInteger static _maxCacheAgeMinutes = 4320; // ~1 month
NSFileManager static *_fileManager = nil;

@implementation TSPCache

+(void)setCacheRootPath:(NSURL *)rootPath {
    _rootPath = rootPath;
    _basePath = [_rootPath URLByAppendingPathComponent:@"SDKCache"];
}

+(NSURL *)cacheRootPath {
    if (!_rootPath) {
        NSString *directory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        _rootPath = [NSURL fileURLWithPath:directory isDirectory:YES];
    }
    return _rootPath;
}

+(void)setCacheMaxAgeInMinutes:(NSUInteger)maxAge {
    _maxCacheAgeMinutes = maxAge;
}

+(NSUInteger)cacheMaxAgeInMinutes {
    return _maxCacheAgeMinutes;
}

+(NSFileManager *)fileManager {
    if (!_fileManager) {
        _fileManager = [[NSFileManager alloc] init];
    }
    return _fileManager;
}

+(NSURL *)pathForObjectClass:(Class)objectClass {
    NSString *className = NSStringFromClass(objectClass);
    return  [_basePath URLByAppendingPathComponent:className];
}

+(NSURL *)pathForObjectClass:(Class)objectClass withId:(NSUInteger)objectId {
    NSString *className = NSStringFromClass(objectClass);
    return  [[_basePath URLByAppendingPathComponent:className] URLByAppendingPathComponent:[NSString stringWithFormat:@"%ld", (long)objectId]];
}

+(BOOL)isValidCacheFile:(NSURL *)fileURLPath {
    if (![self.fileManager fileExistsAtPath:[fileURLPath path]]) {
        return NO;
    }
    NSDictionary* attrs = [self.fileManager attributesOfItemAtPath:[fileURLPath path] error:nil];
    if (attrs) {
        NSDate *fileCreationDate = (NSDate*)[attrs objectForKey: NSFileCreationDate];
        NSTimeInterval elapsedTime = [[NSDate date] timeIntervalSinceDate:fileCreationDate];
        return (elapsedTime > (_maxCacheAgeMinutes * 60));
    }
    return NO;
}

+(void)invalidateAll {
    NSError *error = nil;
    [self.fileManager removeItemAtURL:_basePath error:&error];
}

+(void)invaidateObjectsOfClass:(Class)objectClass {
    NSError *error = nil;
    NSURL *classCachePath = [self pathForObjectClass:objectClass];
    [self.fileManager removeItemAtURL:classCachePath error:&error];
}

+(void)invaidateObjectOfClass:(Class)objectClass withId:(NSUInteger)objectId {
    NSError *error = nil;
    NSURL *classCachePath = [self pathForObjectClass:objectClass withId:objectId];
    [self.fileManager removeItemAtURL:classCachePath error:&error];
}


+(void)saveObject:(TSDKCollectionObject *)collectionObject {
    if (collectionObject) {
        [collectionObject writeToFileURL:[self pathForObjectClass:[collectionObject class] withId:collectionObject.objectIdentifier]];
    }
}

+(TSDKCollectionObject *)objectOfClass:(Class)objectClass withId:(NSUInteger)objectId {
    NSURL *cacheFileURL =[self pathForObjectClass:objectClass withId:objectId];
    if ([self isValidCacheFile:cacheFileURL]) {
        TSDKCollectionObject *resultObject = [objectClass collectionObjectFromDataInFileURL:cacheFileURL];
        return resultObject;
    }
    return nil;
}

@end
