//
//  TSDKMutableDictionary.m
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 1/16/17.
//  Copyright © 2017 teamsnap. All rights reserved.
//

#import "TSDKMutableDictionary.h"

@interface TSDKMutableDictionary ()

@property (nonatomic, strong) dispatch_queue_t isolationQueue;
@property (nonatomic, strong) NSMutableDictionary *backingStorage;

@end


@implementation TSDKMutableDictionary

- (instancetype)initCommon {
    self = [super init];
    if (self) {
        _isolationQueue = dispatch_queue_create([@"TSDKMutableDictionary Isolation Queue" UTF8String], DISPATCH_QUEUE_CONCURRENT);
    }
    return self;
}

- (instancetype)init {
    self = [self initCommon];
    if (self) {
        _backingStorage = [NSMutableDictionary dictionary];
    }
    return self;
}

- (instancetype)initWithCapacity:(NSUInteger)numItems {
    self = [self initCommon];
    if (self) {
        _backingStorage = [NSMutableDictionary dictionaryWithCapacity:numItems];
    }
    return self;
}

- (NSDictionary *)initWithContentsOfFile:(NSString *)path {
    self = [self initCommon];
    if (self) {
        _backingStorage = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [self initCommon];
    if (self) {
        _backingStorage = [[NSMutableDictionary alloc] initWithCoder:aDecoder];
    }
    return self;
}

- (instancetype)initWithObjects:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)cnt {
    self = [self initCommon];
    if (self) {
        if (!objects || !keys) {
            [NSException raise:NSInvalidArgumentException format:@"objects and keys cannot be nil"];
        } else {
            for (NSUInteger i = 0; i < cnt; ++i) {
                _backingStorage[keys[i]] = objects[i];
            }
        }
    }
    return self;
}

- (NSUInteger)count {
    __block NSUInteger count;
    dispatch_sync(self.isolationQueue, ^{
        count = self.backingStorage.count;
    });
    return count;
}

- (id)objectForKey:(id)aKey {
    __block id obj;
    dispatch_sync(self.isolationQueue, ^{
        obj = self.backingStorage[aKey];
    });
    return obj;
}

- (NSEnumerator *)keyEnumerator {
    __block NSEnumerator *enu;
    dispatch_sync(self.isolationQueue, ^{
        enu = [self.backingStorage keyEnumerator];
    });
    return enu;
}

- (void)setObject:(id)anObject forKey:(id<NSCopying>)aKey {
    aKey = [aKey copyWithZone:NULL];
    dispatch_barrier_async(self.isolationQueue, ^{
        self.backingStorage[aKey] = anObject;
    });
}

- (void)removeObjectForKey:(id)aKey {
    dispatch_barrier_async(self.isolationQueue, ^{
        [self.backingStorage removeObjectForKey:aKey];
    });
}

@end
