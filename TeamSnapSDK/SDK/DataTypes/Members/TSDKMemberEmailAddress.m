//
//  TSDKMemberEmailAddress.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 12/9/15.
//  Copyright © 2015 teamsnap. All rights reserved.
//

#import "TSDKMemberEmailAddress.h"

@implementation TSDKMemberEmailAddress

@dynamic teamId, updatedAt, receivesTeamEmails, createdAt, email, isHidden, label, memberId, invitationState, isInvited, linkMember, linkTeam;

+ (NSString *)SDKType {
    return @"member_email_address";
}

@end
