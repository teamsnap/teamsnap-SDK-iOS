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
    NSURLComponents *components = [NSURLComponents componentsWithURL:self resolvingAgainstBaseURL:NO];
    
    NSURLQueryItem *item = [[NSURLQueryItem alloc] initWithName:queryItemName value:queryItemValue];
    if (components.queryItems) {
        components.queryItems = [components.queryItems arrayByAddingObject:item];
    } else {
        components.queryItems = [NSArray arrayWithObject:item];
    }

    return components.URL;
}

@end
