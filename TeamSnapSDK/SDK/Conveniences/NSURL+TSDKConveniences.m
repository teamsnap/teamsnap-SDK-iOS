//
//  NSURL+TSDKConveniences.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 11/2/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "NSURL+TSDKConveniences.h"

@implementation NSURL (TSDKConveniences)

- (NSURL *)URLByAppendingQueryParameter:(NSString *)queryString {
    NSString *componentSeparator = @"?";
    if ([self.absoluteString containsString:@"?"]) {
        componentSeparator=@"&";
    }
    return [NSURL URLWithString:[[self absoluteString] stringByAppendingString:[NSString stringWithFormat:@"%@%@", componentSeparator,queryString]]];
}

@end
