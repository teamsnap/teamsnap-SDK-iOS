//
//  TSDKContact.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 12/9/15.
//  Copyright © 2015 teamsnap. All rights reserved.
//

#import "TSDKContact.h"

@implementation TSDKContact

@dynamic isInvitable, addressCity, invitationCode, addressZip, userId, memberId, updatedAt, addressState, lastName, hideAddress, allowSharedAccess, label, addressStreet1, invitationDeclined, addressCountry, createdAt, addressStreet2, firstName, teamId, linkMember, linkContactPhoneNumbers, linkTeam, linkContactEmailAddresses;

+ (NSString *)SDKType {
    return @"contact";
}

@end
