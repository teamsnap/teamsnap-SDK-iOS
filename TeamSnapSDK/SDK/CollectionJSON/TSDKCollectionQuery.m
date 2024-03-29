//
//  TSDKCollectionCommand.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 3/7/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKCollectionQuery.h"
#import "TSDKDataRequest.h"
#import "TSDKCompletionBlockTypes.h"

@implementation TSDKCollectionQuery

- (instancetype)init {
    self = [super init];
    if (self) {
        self.data = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (instancetype)initWithJSONDict:(NSDictionary *)jsonDict {
    self = [self init];
    if (self) {
        NSArray *data = [jsonDict objectForKey:@"data"];
        for (NSDictionary *datum in data) {
            if (datum[@"value"] && ![datum[@"value"] isEqual:[NSNull null]]) {
                [self.data setObject:datum[@"value"] forKey:datum[@"name"]];
            } else {
                [self.data setObject:@"" forKey:datum[@"name"]];
            }
        }
        
        self.href = [jsonDict objectForKey:@"href"];
        self.rel = [jsonDict objectForKey:@"rel"];
        self.prompt = [jsonDict objectForKey:@"prompt"];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [self init];
    if (self) {
        _data = [aDecoder decodeObjectOfClass:[NSMutableDictionary class] forKey:@"data"];
        _href = [aDecoder decodeObjectOfClass:[NSString class] forKey:@"href"];
        _rel = [aDecoder decodeObjectOfClass:[NSString class] forKey:@"rel"];
        _prompt = [aDecoder decodeObjectOfClass:[NSString class] forKey:@"prompt"];
    }
    return self;
}

+ (BOOL)supportsSecureCoding {
    return YES;
}

-(void)executeWithCompletion:(TSDKCompletionBlock)completion {
    NSURL *destinationURL = [NSURL URLWithString:self.href];
    NSDictionary* ldata = [self.data copy];
    [TSDKDataRequest requestObjectsForPath:destinationURL searchParamaters:ldata sendDataDictionary:nil method:@"GET" withConfiguration:[TSDKRequestConfiguration requestConfigurationWithForceReload:YES] completion:completion];
}

- (TSDKCollectionQuery *)copyWithZone:(NSZone *)zone {
    TSDKCollectionQuery *copy = [[TSDKCollectionQuery alloc] init];
    if (copy) {
        copy.href = [self.href copy];
        copy.rel = [self.rel copy];
        copy.prompt = [self.prompt copy];
        copy.data = [self.data mutableCopy];
    }
    return copy;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:_data forKey:@"data"];
    [coder encodeObject:_href forKey:@"href"];
    [coder encodeObject:_rel forKey:@"rel"];
    [coder encodeObject:_prompt forKey:@"prompt"];
}

@end
