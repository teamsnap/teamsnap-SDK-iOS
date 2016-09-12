//
//  TSDKLeagueCustomDatum.m
//  SDKDeveloperTools
//
//  Created by Jason Rahaim on 9/12/16.
//  Copyright © 2016 jasonr. All rights reserved.
//

#import "TSDKLeagueCustomDatum.h"

@implementation TSDKLeagueCustomDatum

@dynamic options, leagueCustomFieldId, value, teamCanRead, teamCanEdit, isPrivate, helpText, teamId, kind, name, memberId, linkMember, linkLeagueCustomField, linkTeam;

+ (NSString *)SDKType {
    return @"league_custom_datum";
}

+ (NSString *)SDKREL {
    return @"league_custom_data";
}

@end
