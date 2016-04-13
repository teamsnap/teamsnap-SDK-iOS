//
//  TSDKContact.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 12/9/15.
//  Copyright © 2015 teamsnap. All rights reserved.
//

#import "TSDKContact.h"

@implementation TSDKContact

@dynamic  isPushable, isInvitable, addressCity, isAddressHidden, addressZip, invitationCode, memberId, userId, addressState, updatedAt, isAlertable, lastName, isEmailable, hideAddress, allowSharedAccess, label, addressStreet1, invitationDeclined, addressCountry, createdAt, addressStreet2, firstName, teamId, linkMember, linkContactPhoneNumbers, linkTeam, linkContactEmailAddresses;

+ (NSString *)SDKType {
    return @"contact";
}

@end
