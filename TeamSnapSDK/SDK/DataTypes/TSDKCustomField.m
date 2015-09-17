//
//  TSDKCustomField.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 9/1/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKCustomField.h"

@implementation TSDKCustomField
@dynamic name, teamId, kind, options, helpText, linkTeam, linkCustomData;

+ (NSString *)SDKType {
    return @"custom_field";
}

@end
