//
//  TSDKContactPhoneNumber.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 12/9/15.
//  Copyright © 2015 teamsnap. All rights reserved.
//

#import "TSDKContactPhoneNumber.h"

@implementation TSDKContactPhoneNumber

@dynamic label, isPreferred, phoneNumber, isHidden, smsEnabled, smsEmailAddress, createdAt, updatedAt, teamId, smsGatewayId, memberId, linkMember, linkSmsGateway, linkTeam,  contactId, linkContact;

+ (NSString *)SDKType {
    return @"contact_phone_number";
}

@end
