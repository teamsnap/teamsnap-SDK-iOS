//
//  TSDKTeamResults.m
//  SDKDeveloperTools
//
//  Created by Jason Rahaim on 10/1/15.
//  Copyright © 2015 jasonr. All rights reserved.
//

#import "TSDKTeamResults.h"

@implementation TSDKTeamResults
@dynamic losses, overallRecord, teamId, wins, overtimeLosses, ties, linkTeam;

+ (NSString *)SDKType {
    return @"team_results";
}

@end
