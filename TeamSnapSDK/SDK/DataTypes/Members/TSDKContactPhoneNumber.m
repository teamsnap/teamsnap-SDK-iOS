//
//  TSDKContactPhoneNumber.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 12/9/15.
//  Copyright © 2015 teamsnap. All rights reserved.
//

#import "TSDKContactPhoneNumber.h"

@implementation TSDKContactPhoneNumber

@dynamic label, isPreferred, phoneNumber, isHidden, preferred, smsEnabled, smsEmailAddress, createdAt, contactId, updatedAt, teamId, smsGatewayId, memberId, linkSmsGateway, linkMember, linkTeam, linkContact;

+ (NSString *)SDKType {
    return @"contact_phone_number";
}

@end
