//
//  NSDictionary+TSDKCollectionJSON.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 6/13/18.
//  Copyright © 2018 teamsnap. All rights reserved.
//

#import "NSDictionary+TSDKCollectionJSON.h"

@implementation NSDictionary (TSDKCollectionJSON)

- (NSDictionary *)collectionJSONForKey:(NSString *)key {
    return @{@"name" : key, @"value" : self[key]};
}

- (NSArray *)collectionJSONArray {
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    
    NSArray *allKeys = [self allKeys];
    for (NSString *key in allKeys) {
        [tempArray addObject:[self collectionJSONForKey:key]];
    }
    return [NSArray arrayWithArray:tempArray];
}

- (NSDictionary *)collectionJSONTemplate {
    NSArray *dataArray = [self collectionJSONArray];
    
    NSDictionary *templateObject = @{@"template":@{@"data":dataArray}};
    
    return templateObject;
}

@end
