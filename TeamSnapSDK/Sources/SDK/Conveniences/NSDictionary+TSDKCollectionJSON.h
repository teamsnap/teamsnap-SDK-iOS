//
//  NSDictionary+TSDKCollectionJSON.h
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 6/13/18.
//  Copyright © 2018 teamsnap. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (TSPCollectionJSON)

- (NSDictionary *)collectionJSONForKey:(NSString *)key;
- (NSArray *)collectionJSONArray;
- (NSDictionary *)collectionJSONTemplate;

@end
