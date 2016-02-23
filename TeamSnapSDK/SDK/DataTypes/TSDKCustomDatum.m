//
//  TSDKCustomDatum.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 9/1/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKCustomDatum.h"

@implementation TSDKCustomDatum
@dynamic name, options, value, isPrivate, memberId, teamId, kind, customFieldId, helpText, linkCustomField, linkMember, linkTeam;

+ (NSString *)SDKType {
    return @"custom_datum";
}

+ (NSString *)SDKREL {
    return @"custom_data";
}

@end
