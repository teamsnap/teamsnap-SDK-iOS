//
//  TSDKLocation.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 9/1/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKLocation.h"

@implementation TSDKLocation

@dynamic phone, address, notes, teamId, name, url, latitude, longitude, linkTeam, linkEvents;

+ (NSString *)SDKType {
    return @"location";
}

@end
