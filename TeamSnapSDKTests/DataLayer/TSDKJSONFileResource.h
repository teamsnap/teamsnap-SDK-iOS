//
//  TSDKJSONFileResource.h
//  TeamSnapSDK
//
//  Created by Marquez Gallegos on 11/22/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionJSON.h"

@interface TSDKJSONFileResource : NSObject

+ (TSDKCollectionJSON *)collectionFromJSONFileNamed:(NSString *)filename;

@end
