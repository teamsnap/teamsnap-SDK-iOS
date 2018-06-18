//
//  TSDKCollectionCommand.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 9/10/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKCollectionCommand.h"
#import "NSDictionary+TSDKCollectionJSON.h"
#import "TSDKCollectionJSON.h"
#import "TSDKDataRequest.h"

@implementation TSDKCollectionCommand

-(void)executeWithCompletion:(TSDKCompletionBlock)completion {
    NSURL *destinationURL = [NSURL URLWithString:self.href];
    
    [TSDKDataRequest requestObjectsForPath:destinationURL sendDataDictionary:self.data method:@"POST" withConfiguration:[TSDKRequestConfiguration requestConfigurationWithForceReload:YES] completion:completion];
}

-(void)executeCollectionJSONTemplateWithCompletion:(TSDKCompletionBlock)completion {
    NSURL *destinationURL = [NSURL URLWithString:self.href];
    NSDictionary *dataToSend =  [self.data collectionJSONTemplate];
    [TSDKDataRequest requestObjectsForPath:destinationURL sendDataDictionary:dataToSend  method:@"POST" withConfiguration:[TSDKRequestConfiguration requestConfigurationWithForceReload:YES] completion:completion];
}

- (TSDKCollectionCommand *)copyWithZone:(NSZone *)zone {
    TSDKCollectionCommand *copy = [[TSDKCollectionCommand alloc] init];
    if (copy) {
        copy.href = [self.href copy];
        copy.rel = [self.rel copy];
        copy.prompt = [self.prompt copy];
        copy.data = [self.data mutableCopy];
    }
    return copy;
}

@end
