//
//  NSMutableDictionary+refreshCollectionData.h
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 1/11/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"

@interface NSMutableDictionary (refreshCollectionData)

- (void)refreshCollectionObject:(TSDKCollectionObject *)object;

@end
