//
//  TSDKAvailability.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 2/12/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKAvailability.h"

@implementation TSDKAvailability

@dynamic status, notes, notesAuthorMemberId, statusCode, memberId, eventId, teamId, createdAt, updatedAt, linkEvent, linkMember, linkTeam;

+ (NSString *)SDKType {
    return @"availability";
}

@end
