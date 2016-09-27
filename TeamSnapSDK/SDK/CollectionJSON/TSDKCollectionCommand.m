//
//  TSDKCollectionCommand.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 9/10/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKCollectionCommand.h"
#import "TSDKDataRequest.h"

@implementation TSDKCollectionCommand

-(void)executeWithCompletion:(TSDKCompletionBlock)completion {
    NSURL *destinationURL = [NSURL URLWithString:self.href];
    
    [TSDKDataRequest requestObjectsForPath:destinationURL sendDataDictionary:self.data method:@"POST" withConfiguration:[TSDKRequestConfiguration requestConfigurationWithForceReload:YES] completion:completion];
}


@end
