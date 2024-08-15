//
//  TSDKTrackedItemStatus.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 9/1/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKTrackedItemStatus.h"

@implementation TSDKTrackedItemStatus

@dynamic status, statusCode, createdAt, memberId, teamId, updatedAt, trackedItemId, linkMember, linkTeam, linkTrackedItem;

+ (NSString *)SDKType {
    return @"tracked_item_status";
}

@end
