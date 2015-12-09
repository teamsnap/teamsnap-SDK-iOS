//
//  TSDKContactEmailAddress.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 12/9/15.
//  Copyright © 2015 teamsnap. All rights reserved.
//

#import "TSDKContactEmailAddress.h"

@implementation TSDKContactEmailAddress

@dynamic teamId, updatedAt, receivesTeamEmails, createdAt, email, isHidden, label, contactId, memberId, linkContact, linkMember, linkTeam;

+ (NSString *)SDKType {
    return @"contact_email_address";
}

@end
