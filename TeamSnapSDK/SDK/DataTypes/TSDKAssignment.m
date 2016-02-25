//
//  TSDKAssignment.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 9/1/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKAssignment.h"

@implementation TSDKAssignment

@dynamic teamId, memberId, assignmentDescription, eventId, linkEvent, linkMember, linkTeam;

+ (NSString *)SDKType {
    return @"assignment";
}

@end
