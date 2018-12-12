//
//  TSDKLocation.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 9/1/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKLocation.h"

@implementation TSDKLocation

@dynamic phone, address, notes, teamId, name, url, latitude, longitude, isDeletable, linkTeam, linkEvents;

+ (NSString *)SDKType {
    return @"location";
}

- (BOOL)hasGeocodedLocation {
    NSNumber *latitude = [self collectionObjectForKey:@"latitude"];
    NSNumber *longitude = [self collectionObjectForKey:@"longitude"];
    
    if ((latitude == nil) || [latitude isEqual:[NSNull null]] || ([latitude doubleValue] == 0.00)) {
        return NO;
    }
    
    if ((longitude == nil) || [longitude isEqual:[NSNull null]] || ([longitude doubleValue] == 0.00)) {
        return NO;
    }
    return YES;
}

@end
