//
//  TSDKEventLineup.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 4/10/18.
//  Copyright © 2018 teamsnap. All rights reserved.
//

#import "TSDKEventLineup.h"

@implementation TSDKEventLineup

@dynamic eventId, isPublished, createdAt, updatedAt;

+ (NSString *)SDKType {
    return @"event_lineup";
}


@end
