//
//  TSDKLeagueCustomField.m
//  SDKDeveloperTools
//
//  Created by Jason Rahaim on 9/12/16.
//  Copyright © 2016 jasonr. All rights reserved.
//

#import "TSDKLeagueCustomField.h"

@implementation TSDKLeagueCustomField

@dynamic helpText, name, validationType, divisionId, teamCanEdit, teamCanRead, kind, required, options, linkTeams, linkLeagueCustomData;

+ (NSString *)SDKType {
    return @"league_custom_field";
}

@end
