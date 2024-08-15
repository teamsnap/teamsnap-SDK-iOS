//
//  TSDKMemberPayment.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 2/23/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKMemberPayment.h"

@implementation TSDKMemberPayment
@dynamic isApplicable, amountDue, createdAt, memberId, teamFeeId, amountPaid, teamId, updatedAt, linkMember, linkTeam, linkPaymentNotes, linkTeamFee;

+ (NSString *)SDKType {
    return @"member_payment";
}

@end
