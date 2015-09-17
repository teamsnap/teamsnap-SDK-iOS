//
//  TSDKTrackedItem.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 2/25/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKTrackedItem.h"

@implementation TSDKTrackedItem

@dynamic createdAt, updatedAt, name, teamId, linkTeam, linkTrackedItemStatuses;

+ (NSString *)SDKType {
    return @"tracked_item";
}

@end
