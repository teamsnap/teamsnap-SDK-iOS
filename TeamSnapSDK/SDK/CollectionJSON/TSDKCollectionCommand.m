//
//  TSDKCollectionCommand.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 3/7/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKCollectionCommand.h"
#import "TSDKDataRequest.h"
#import "TSDKCompletionBlockTypes.h"

@implementation TSDKCollectionCommand

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

-(void)executeWithCompletion:(TSDKCompletionBlock)completion {
    NSURL *destinationURL = [NSURL URLWithString:self.href];
    
    [TSDKDataRequest requestObjectsForPath:destinationURL sendDataDictionary:self.data method:@"POST" withConfiguration:[TSDKRequestConfiguration forceReload:YES] completion:completion];
}

@end
