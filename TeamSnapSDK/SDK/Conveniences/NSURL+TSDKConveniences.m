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
    NSURLComponents *components = [NSURLComponents componentsWithURL:self resolvingAgainstBaseURL:NO];
    
    if (components.queryItems) {
        components.queryItems = [components.queryItems arrayByAddingObject:queryItem];
    } else {
        components.queryItems = [NSArray arrayWithObject:queryItem];
    }
    
    return components.URL;
}

@end
