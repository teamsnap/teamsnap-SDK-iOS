//
//  TSDKSport.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 9/2/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKSport.h"

const NSInteger TSPSportBaseball = 5;
const NSInteger TSPSportSoftBall = 4;
const NSInteger TSPSportKickball = 18;
const NSInteger TSPSportSlowPitch = 61;
const NSInteger TSPSportSoccer = 2;
const NSInteger TSPIndoorSoccer = 39;
const NSInteger TSPSportFootball = 7;
const NSInteger TSPSportHockey = 16;
const NSInteger TSPSportBasketball = 1;
const NSInteger TSPSportLacrosse = 10;
const NSInteger TSPSportRugby = 9;
const NSInteger TSPSportFieldHockey = 15;
const NSInteger TSPSportWrestling = 49;
const NSInteger TSPSportRingette = 51;
const NSInteger TSPSportIndoorSoccer = 39;
const NSInteger TSPSportInlineHockey = 17;
const NSInteger TSPSportWaterPolo = 23;
const NSInteger TSPSportFloorHockey = 60;
const NSInteger TSPSportAustralianFootball = 26;
const NSInteger TSPSportNetball = 40;
const NSInteger TSPSportFloorball = 44;
const NSInteger TSPSportStreetHockey = 62;
const NSInteger TSPSportNonSportGroup = 52;

@implementation TSDKSport

@dynamic hasShootouts, hasStatisticTemplate, shootoutLabel, overtimeLabel, hasCustomizedLanguage, isNonSport, overtimeAbbrev, tracksPoints, hasOvertime, lowScoreWins, shootoutAbbrev, name, tracksOvertimeLosses, linkSportLogo;

+ (NSString *)SDKType {
    return @"sport";
}

+ (NSURL *)bundledFileURL {
    return [[NSBundle bundleForClass:[self class]] URLForResource:[self SDKREL] withExtension:@"json"];
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
