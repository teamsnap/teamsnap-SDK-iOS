//
//  TSDKMemberPreferences.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 2/23/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKMemberPreferences.h"

@implementation TSDKMemberPreferences

@dynamic remindersSendDaysBeforeEvent, publicSiteShowThumbnail, memberId, facebookPostScores, remindersSendGame, scheduleShowFor, publicSiteShowLastName, remindersSendEvent, remindersSendManagerGame, scheduleShowForCode, facebookPostScoresToPageName, mobileSendPushMessages, updatedAt, remindersSendManagerDaysBeforeEvent, facebookPostScoresToPageId, assignmentsHidePast, scheduleHidePast, facebookPoliteScores, remindersSendDaysBeforeGame, availabilityShowPast, remindersSendManagerDaysBeforeGame, facebookOnlyPostWins, facebookPostScoresToWall, facebookPageAccessToken, createdAt, remindersSendManagerEvent, teamId, linkMember, linkTeam;

+ (NSString *)SDKType {
    return @"member_preferences";
}

@end
