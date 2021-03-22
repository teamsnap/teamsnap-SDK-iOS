//
//  TSPCache.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 8/19/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//
#import "TSPCache.h"
#import "TSDKLogging.h"

NSURL static *_rootPath = nil;
NSURL static *_basePath = nil;
NSUInteger static _maxCacheAgeMinutes = 60; // ~1 hour
NSFileManager static *_fileManager = nil;

@implementation TSPCache

+(void)setCacheRootPath:(NSURL *)rootPath {
    _rootPath = rootPath;
    _basePath = [_rootPath URLByAppendingPathComponent:@"SDKCache"];
}

+(NSURL *)cacheRootPath {
    if (!_rootPath) {
        NSString *directory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        _rootPath = [[NSURL fileURLWithPath:directory isDirectory:YES] URLByAppendingPathComponent:@"teamsnap"];
    }
    if (![[self fileManager] fileExistsAtPath:[_rootPath path]]) {
        [[self fileManager] createDirectoryAtPath:[_rootPath path] withIntermediateDirectories:YES attributes:nil error:nil];
        [self markDirectoryForNoBackup:_rootPath];
    }

    return _rootPath;
}

+ (void)markDirectoryForNoBackup:(NSURL *)directory {
    NSError *error = nil;
    BOOL success = [_rootPath setResourceValue: [NSNumber numberWithBool: YES]
                                        forKey: NSURLIsExcludedFromBackupKey error: &error];
    if(!success){
        DLog(@"Error excluding %@ from backup %@", [_rootPath lastPathComponent], error);
    }
}

+(NSURL *)cacheBasePath {
    if (!_basePath) {
        return nil;
    }
    if (![[self fileManager] fileExistsAtPath:[_basePath path]]) {
        [[self fileManager] createDirectoryAtPath:[_basePath path] withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return _basePath;
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

+(NSURL *)pathForObjectClassName:(NSString *)className {
    NSURL *destination = [[self cacheRootPath] URLByAppendingPathComponent:className];
    if (destination && ![[self fileManager] fileExistsAtPath:[destination path]]) {
        [[self fileManager] createDirectoryAtPath:[destination path] withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return destination;
}

+(NSURL *)pathForObjectClass:(Class)objectClass {
    NSString *className = NSStringFromClass(objectClass);
    return [self pathForObjectClassName:className];
}

+(NSURL *)pathForObjectClass:(Class)objectClass withId:(NSString *)objectId {
    if(objectId.length == 0) {
        objectId = @"Base";
    }
    return  [[self pathForObjectClass:objectClass] URLByAppendingPathComponent:objectId];
}

+ (NSURL *)pathForObjectCollectionOfClass:(Class)objectClass {
    return [[self pathForObjectClass:objectClass] URLByAppendingPathComponent:@"collection"];
}

+(BOOL)isValidCacheFile:(NSURL *)fileURLPath {
    if (![self.fileManager fileExistsAtPath:[fileURLPath path]]) {
        return NO;
    }
    NSDictionary* attrs = [self.fileManager attributesOfItemAtPath:[fileURLPath path] error:nil];
    if (attrs) {
        NSDate *fileCreationDate = (NSDate*)[attrs objectForKey: NSFileCreationDate];
        NSTimeInterval elapsedTime = [[NSDate date] timeIntervalSinceDate:fileCreationDate];
        return (elapsedTime < (_maxCacheAgeMinutes * 60));
    }
    return NO;
}

+(void)invalidateAll {
    NSError *error = nil;
    [self.fileManager removeItemAtURL:self.cacheBasePath error:&error];
}

+(void)invaidateObjectsOfClass:(Class)objectClass {
    NSError *error = nil;
    NSURL *classCachePath = [self pathForObjectClass:objectClass];
    [self.fileManager removeItemAtURL:classCachePath error:&error];
}

+(void)invaidateObjectOfClass:(Class)objectClass withId:(NSString *)objectId {
    NSError *error = nil;
    NSURL *classCachePath = [self pathForObjectClass:objectClass withId:objectId];
    [self.fileManager removeItemAtURL:classCachePath error:&error];
}

+(void)saveObject:(TSDKCollectionObject *)collectionObject {
    if ([self pathForObjectClass:[collectionObject class] withId:collectionObject.objectIdentifier]) {
        if (collectionObject) {
            [collectionObject writeToFileURL:[self pathForObjectClass:[collectionObject class] withId:collectionObject.objectIdentifier]];
        }
    }
}

+(TSDKCollectionObject *)objectOfClass:(Class)objectClass withId:(NSString *)objectId {
    NSURL *cacheFileURL =[self pathForObjectClass:objectClass withId:objectId];
    if ([self isValidCacheFile:cacheFileURL]) {
        TSDKCollectionObject *resultObject = [objectClass collectionObjectFromDataInFileURL:cacheFileURL];
        return resultObject;
    }
    return nil;
}

+ (void)saveDictionaryOfObjects:(NSDictionary *)dictionaryOfObjects ofType:(Class)objectClass {
    for (TSDKCollectionObject *object in [dictionaryOfObjects allValues]) {
        [self saveObject:object];
    }
    NSArray *keys = [dictionaryOfObjects allKeys];
    
    if ([self pathForObjectCollectionOfClass:objectClass]) {
        BOOL success = [keys writeToURL:[self pathForObjectCollectionOfClass:objectClass] atomically:YES];
        if (!success) {
            DLog(@"Failed");
        }
    }
}

+ (NSDictionary *)loadDictionaryOfObjectsOfType:(Class)objectClass {
    NSURL *cacheFileURL = [self pathForObjectCollectionOfClass:objectClass];
    if (cacheFileURL) {
        NSArray *keys = [NSArray arrayWithContentsOfURL:cacheFileURL];
        NSMutableDictionary *resultDictionary = [[NSMutableDictionary alloc] init];
        
        for (NSString *key in keys) {
            TSDKCollectionObject *object = [self objectOfClass:objectClass withId:key];
            if (object) {
                [resultDictionary setObject:object forKey:key];
            } else {
                return nil;
            }
        }
        if (resultDictionary.count >0 ) {
            return [resultDictionary copy];
        } else {
            return nil;
        }
    } else {
        return nil;
    }
}

+ (BOOL)saveSchemas:(NSArray *)schemaArray WithVersion:(NSString *)schemaVersion {
    NSURL *schemaCachePath = [self pathForObjectClassName:@"schemas"];
    if (schemaCachePath) {
        NSURL *versionFileURL = [schemaCachePath URLByAppendingPathComponent:@"version"];
        NSError *error;

        [schemaVersion writeToURL:versionFileURL atomically:YES encoding: NSASCIIStringEncoding error:&error];

        NSURL *fileURL = [schemaCachePath URLByAppendingPathComponent:@"schemaArray"];

        
        NSData *schemaData;

        if (@available(iOS 12, *)) {
            schemaData = [NSKeyedArchiver archivedDataWithRootObject:schemaArray requiringSecureCoding:NO error:&error];
        } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
            schemaData = [NSKeyedArchiver archivedDataWithRootObject:schemaArray];
#pragma clang diagnostic pop
        }

        if (error != nil) {
            return NO;
        }

        [schemaData writeToURL:fileURL options:NSDataWritingAtomic error:&error];
        
        if (error != nil) {
            return NO;
        } else {
            return YES;
        }
    } else {
        return NO;
    }
}

+ (NSArray *)loadSchemasIfCachedVersion:(NSString *)schemaVersion {
    if (!schemaVersion) {
        return nil;
    }
    NSURL *schemaCachePath = [self pathForObjectClassName:@"schemas"];
    NSURL *versionFileURL = [schemaCachePath URLByAppendingPathComponent:@"version"];
    NSURL *fileURL = [schemaCachePath URLByAppendingPathComponent:@"schemaArray"];

    NSError *error;
    if ([[self fileManager] fileExistsAtPath:[versionFileURL path]]) {
        NSString *cachedVersion = [NSString stringWithContentsOfURL:versionFileURL encoding:NSASCIIStringEncoding error:&error];
        if (cachedVersion && [cachedVersion isEqualToString:schemaVersion]) {
            NSData *schemaData = [NSData dataWithContentsOfURL:fileURL];
            
            if (@available(iOS 12, *)) {
                NSSet<Class> *validClasses = [NSSet setWithObjects: [NSDictionary class], [NSArray class], [NSString class], [NSNumber class], [NSNull class], nil];
                id obj = [NSKeyedUnarchiver unarchivedObjectOfClasses:validClasses
                                                           fromData:schemaData
                                                              error:&error];

                if (error != nil) {
                    NSLog(@"Error: %@", error);
                }
                return obj;
            } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
                return (NSArray *)[NSKeyedUnarchiver unarchiveObjectWithData:schemaData];
#pragma clang diagnostic pop
            }
        } else {
            [[self fileManager] removeItemAtURL:versionFileURL error:&error];
            [[self fileManager] removeItemAtURL:fileURL error:&error];
        }
        return nil;
    } else {
        return nil;
    }
}


@end
