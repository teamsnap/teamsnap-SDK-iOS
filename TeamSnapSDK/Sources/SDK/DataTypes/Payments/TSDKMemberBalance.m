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

- (NSString * _Nonnull)objectIdentifier {
    
    NSString *combinedId = [super objectIdentifier];
    NSString *memberId = self.memberId;
    NSString *teamId = self.teamId;
    
    if (memberId && teamId) {
        combinedId = [NSString stringWithFormat:@"%@:%@", memberId, teamId];
    } else if (memberId && !teamId) {
        combinedId = memberId;
    } else if (teamId && !memberId) {
        combinedId = teamId;
    }
    
    return combinedId;
}

@end
