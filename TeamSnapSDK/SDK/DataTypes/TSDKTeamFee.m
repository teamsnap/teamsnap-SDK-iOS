//
//  TSDKTeamFee.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 9/1/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKTeamFee.h"

@implementation TSDKTeamFee

@dynamic amount, notes, createdAt, teamId, teamFeeDescription, balance, updatedAt, linkTeam, linkMemberPayments;

+ (NSString *)SDKType {
    return @"team_fee";
}

@end
