//
//  NSMutableString+TSDKConveniences.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 5/20/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "NSMutableString+TSDKConveniences.h"

@implementation NSMutableString (TSDKConveniences)

- (void)appendStringWithComma:(NSString *)string {
    [self appendString:[NSString stringWithFormat:@", %@", string]];
}

@end
