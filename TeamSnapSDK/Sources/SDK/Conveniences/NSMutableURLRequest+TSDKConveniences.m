//
// Created by Jason Rahaim on 1/29/15.
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "NSMutableURLRequest+TSDKConveniences.h"


@implementation NSMutableURLRequest (TSDKConveniences)

-(NSString *)getCurlEquivalent {
    NSMutableString *result = [[NSMutableString alloc] init];

    [result appendFormat:@"curl"];

    for (NSString *headerName in self.allHTTPHeaderFields) {
        NSString *headerValue = [self.allHTTPHeaderFields objectForKey:headerName];
        [result appendFormat:@" -H \"%@: %@\"", headerName, headerValue];
    }

    [result appendFormat:@" -X %@", self.HTTPMethod];

    if (self.HTTPBody && [self.HTTPBody length]>0) {
        NSString *bodyString = [[NSString alloc] initWithData:self.HTTPBody
                                                     encoding:NSUTF8StringEncoding];

        [result appendFormat:@" -d '%@'", bodyString];
    }

    [result appendFormat:@" %@ -w '%%{http_code}'", self.URL];
    return result;
}

@end