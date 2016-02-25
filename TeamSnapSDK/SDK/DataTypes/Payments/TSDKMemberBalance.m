//
//  TSDKMemberBalance.m
//  SDKDeveloperTools
//
//  Created by Jason Rahaim on 2/23/16.
//  Copyright © 2016 jasonr. All rights reserved.
//

#import "TSDKMemberBalance.h"

@implementation TSDKMemberBalance

@dynamic memberId, balance, teamId, linkMember, linkTeam;

+ (NSString *)SDKType {
    return @"member_balance";
}

@end
