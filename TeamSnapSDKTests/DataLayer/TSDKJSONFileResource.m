//
//  TSDKJSONFileResource.m
//  TeamSnapSDK
//
//  Created by Marquez Gallegos on 11/22/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKJSONFileResource.h"

@implementation TSDKJSONFileResource

+ (TSDKCollectionJSON *)collectionFromJSONFileNamed:(NSString *)fileName {

    return [SWIFTPM_MODULE_BUNDLE pathForResource:fileName ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:resource];
    NSError* error = nil;
    NSDictionary *JSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    return [[TSDKCollectionJSON alloc] initWithJSON:JSON];
}

@end
