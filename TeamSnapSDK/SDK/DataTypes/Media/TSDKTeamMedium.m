//
//  TSDKTeamMedium.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 2/23/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKTeamMedium.h"

@implementation TSDKTeamMedium

@dynamic teamMediumDescription, position, mediumUrl, createdAt, teamMediaGroupId, mediaFormat, updatedAt, isPrivate, teamId, memberId, linkMember, linkMedium, linkMediumThumbnail, linkTeamMediumComments, linkMediumMidsizeThumbnail, linkTeam, linkMediumSmallThumbnail, linkTeamMediaGroup, linkMediumMidsize;

+ (NSString *)SDKType {
    return @"team_medium";
}

+ (NSString *)SDKREL {
    return @"team_media";
}

@end
