//
//  TSDKInviteStatus.m
//  SDKDeveloperTools
//
//  Created by Jason Rahaim on 10/28/15.
//  Copyright © 2015 jasonr. All rights reserved.
//

#import "TSDKinvitationFinder.h"

@implementation TSDKinvitationFinder


@dynamic isExistingUser, isInvitationPending, emailAddress;

+ (NSString *)SDKType {
    return @"invitation_finder";
}
@end
