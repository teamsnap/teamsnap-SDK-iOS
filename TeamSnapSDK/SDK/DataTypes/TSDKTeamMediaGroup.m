//
//  TSDKTeamMediaGroup.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 2/23/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKTeamMediaGroup.h"

@implementation TSDKTeamMediaGroup

@dynamic position, lastTeamMediumPosition, isPrivate, mediaFormat, teamId, countTeamMedia, name, linkTeamMedia, linkPreviewMedium, linkTeam, linkPreviewMediumThumbnail;

+ (NSString *)SDKType {
    return @"team_media_group";
}

@end
