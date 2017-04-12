//
//  NSURL+TSDKConveniences.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 11/2/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "NSURL+TSDKConveniences.h"

@implementation NSURL (TSDKConveniences)

- (NSURL *_Nonnull)URLByAppendingQuery:(NSString *_Nonnull)queryItemName value:(NSString *_Nullable)queryItemValue {
    NSURLQueryItem *item = [[NSURLQueryItem alloc] initWithName:queryItemName value:queryItemValue];
    return [self URLByAppendingQueryItem:item];
}

- (NSURL *_Nonnull)URLByAppendingQueryItem:(NSURLQueryItem *)queryItem {
    if (!queryItem) {
        return self;
    }
    return [self URLByAppendingArrayOfQueryItems:@[queryItem]];
}

- (NSURL *_Nonnull)URLByAppendingArrayOfQueryItems:(NSArray <NSURLQueryItem *> *_Nonnull)queryItems {
    NSURLComponents *components = [NSURLComponents componentsWithURL:self resolvingAgainstBaseURL:NO];
    
    NSMutableArray *combinedQueryItemArray = [[NSMutableArray alloc] init];
    [combinedQueryItemArray addObjectsFromArray:components.queryItems];
    [combinedQueryItemArray addObjectsFromArray:queryItems];

    components.queryItems = [NSArray arrayWithArray:combinedQueryItemArray];
    
    return components.URL;
}

@end
