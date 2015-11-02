//
//  TSDKInviteStatus.m
//  SDKDeveloperTools
//
//  Created by Jason Rahaim on 10/28/15.
//  Copyright © 2015 jasonr. All rights reserved.
//

#import "TSDKInviteStatus.h"

@implementation TSDKInviteStatus


@dynamic user_exists, invitation_pending, emailAddress;

+ (NSString *)SDKType {
    return @"invite_status";
}
@end
