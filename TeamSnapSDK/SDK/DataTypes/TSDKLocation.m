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

- (BOOL)validateLatitude:(NSNumber *)latitude logitude:(NSNumber *)longitude {
    if ((latitude == nil) || [latitude isEqual:[NSNull null]]) {
        return NO;
    }
    
    if ((longitude == nil) || [longitude isEqual:[NSNull null]]) {
        return NO;
    }

    double dLatitude = [latitude doubleValue];
    double dLongitude = [longitude doubleValue];

    return ((fabs(dLatitude) <= 90.00) &&
            (fabs(dLongitude) <= 180.00) &&
            (fabs(dLatitude) >= 0.01));
}

-(double)latitude {
    NSNumber *latitude = [self collectionObjectForKey:@"latitude"];
    NSNumber *longitude = [self collectionObjectForKey:@"longitude"];
    
    if ([self validateLatitude:latitude logitude:longitude]) {
        return [latitude doubleValue];
    }
    
    return 0.0;
}

-(double)longitude {
    NSNumber *latitude = [self collectionObjectForKey:@"latitude"];
    NSNumber *longitude = [self collectionObjectForKey:@"longitude"];
    
    if ([self validateLatitude:latitude logitude:longitude]) {
        return [longitude doubleValue];
    }

    return 0.0;
}


- (BOOL)hasGeocodedLocation {
    NSNumber *latitude = [self collectionObjectForKey:@"latitude"];
    NSNumber *longitude = [self collectionObjectForKey:@"longitude"];
    
    return [self validateLatitude:latitude logitude:longitude];
}

- (void)saveWithCompletion:(TSDKSaveCompletionBlock)completion {
    NSNumber *latitude = [self collectionObjectForKey:@"latitude"];
    NSNumber *longitude = [self collectionObjectForKey:@"longitude"];
    
    if ([self validateLatitude:latitude logitude:longitude] == false) {
        [self setCollectionObject:nil forKey:@"latitude"];
        [self setCollectionObject:nil forKey:@"longitude"];
    }
    
    [super saveWithCompletion:completion];
}

@end
