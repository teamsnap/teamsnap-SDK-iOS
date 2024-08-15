//
//  TSDKTeamMediumComment.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 2/23/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKTeamMediumComment.h"

@implementation TSDKTeamMediumComment

@dynamic teamMediumId, createdAt, memberId, updatedAt, comment, linkTeam, linkMember, linkTeamMedium;

+ (NSString *)SDKType {
    return @"team_medium_comment";
}

@end
