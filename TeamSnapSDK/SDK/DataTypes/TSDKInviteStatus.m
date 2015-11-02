//
//  TSDKInviteStatus.m
//  SDKDeveloperTools
//
//  Created by Jason Rahaim on 10/28/15.
//  Copyright © 2015 jasonr. All rights reserved.
//

#import "TSDKInviteStatus.h"

@implementation TSDKInviteStatus


@dynamic isExistingUser, isInvitationPending, emailAddress;

+ (NSString *)SDKType {
    return @"invite_status";
}
@end
