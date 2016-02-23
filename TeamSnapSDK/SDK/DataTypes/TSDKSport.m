//
//  TSDKSport.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 9/2/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKSport.h"

@implementation TSDKSport

@dynamic hasShootouts, hasStatisticTemplate, shootoutLabel, overtimeLabel, hasCustomizedLanguage, isNonSport, overtimeAbbrev, tracksPoints, hasOvertime, lowScoreWins, shootoutAbbrev, name, tracksOvertimeLosses, linkSportLogo;

+ (NSString *)SDKType {
    return @"sport";
}

-(NSString *)memberDescription {
    if (self.isNonSport) {
        return NSLocalizedString(@"Member", nil);
    } else {
        return NSLocalizedString(@"Player", nil);
    }
}

-(NSString *)membersDescription {
    if (self.isNonSport) {
        return NSLocalizedString(@"Members", nil);
    } else {
        return NSLocalizedString(@"Players", nil);
    }
}

-(NSString *)nonMemberDescription {
    if (self.isNonSport) {
        return NSLocalizedString(@"Non-Member", nil);
    } else {
        return NSLocalizedString(@"Non-Player", nil);
    }
}

-(NSString *)nonMembersDescription {
    if (self.isNonSport) {
        return NSLocalizedString(@"Non-Members", nil);
    } else {
        return NSLocalizedString(@"Non-Players", nil);
    }
}

@end
