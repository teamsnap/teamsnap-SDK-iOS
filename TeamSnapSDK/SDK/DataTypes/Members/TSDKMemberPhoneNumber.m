//
//  TSDKMemberPhoneNumber.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 12/9/15.
//  Copyright © 2015 teamsnap. All rights reserved.
//

#import "TSDKMemberPhoneNumber.h"

@implementation TSDKMemberPhoneNumber

@dynamic smsGatewayId, smsEmailAddress, teamId, smsEnabled, memberId, isHidden, label, phoneNumber, preferred, linkMember, linkSmsGateway, linkTeam;

+ (NSString *)SDKType {
    return @"member_phone_number";
}

@end
