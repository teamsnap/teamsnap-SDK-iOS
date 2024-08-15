//
//  TSDKMemberAssignments.m
//  SDKDeveloperTools
//
//  Created by Jason Rahaim on 9/13/16.
//  Copyright © 2016 jasonr. All rights reserved.
//

#import "TSDKMemberAssignment.h"

@implementation TSDKMemberAssignment

@dynamic updatedAt, createdAt, managerCreated, assignmentId, memberId, eventId, teamId, linkMember, linkAssignment, linkEvent, linkTeam;

+ (NSString *)SDKType {
    return @"member_assignment";
}
@end
