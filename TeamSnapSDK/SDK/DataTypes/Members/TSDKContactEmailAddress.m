//
//  TSDKContactEmailAddress.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 12/9/15.
//  Copyright © 2015 teamsnap. All rights reserved.
//

#import "TSDKContactEmailAddress.h"

@implementation TSDKContactEmailAddress

@dynamic label, isHidden, createdAt, invitationState, receivesTeamEmails, contactId, updatedAt, invitationCode, teamId, email, memberId, linkContact, linkMember, linkTeam;

+ (NSString *)SDKType {
    return @"contact_email_address";
}

@end
