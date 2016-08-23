//
//  TSDKAssignment.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 9/1/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKAssignment.h"

@implementation TSDKAssignment

@dynamic updatedAt, isEditable, createdAt, memberId, managerCreated, assignmentDescription, eventId, teamId, linkMember, linkMemberAssignments, linkEvent, linkTeam;

+ (NSString *)SDKType {
    return @"assignment";
}

@end
