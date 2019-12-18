//
//  TSDKAssignment.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 9/1/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKAssignment.h"

@implementation TSDKAssignment

@dynamic assignmentDescription, logoUrl, position, isEditable, createdAt, adUnitId, isSponsored, analyticLabel, updatedAt, managerCreated, teamId, eventId, memberId, linkMember, linkMemberAssignment, linkMemberAssignments, linkEvent, linkTeam;

+ (NSString *)SDKType {
  return @"assignment";
}

@end
