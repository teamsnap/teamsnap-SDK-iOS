//
//  TSDKDivisionLocation.m
//  SDKDeveloperTools
//
//  Created by Jason Rahaim on 3/30/16.
//  Copyright © 2016 jasonr. All rights reserved.
//

#import "TSDKDivisionLocation.h"

@implementation TSDKDivisionLocation

@dynamic phone, divisionId, address, notes, name, url, linkEvents;

+ (NSString *)SDKType {
    return @"division_location";
}

@end
