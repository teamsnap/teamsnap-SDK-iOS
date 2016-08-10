//
//  TSDKMemberPreferences.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 2/23/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKMemberPreferences.h"

@implementation TSDKMemberPreferences

@dynamic gameReminderPreference, remindersSendDaysBeforeEvent, publicSiteShowThumbnail, memberId, facebookPostScores, scheduleShowFor, publicSiteShowLastName, remindersSendManagerGame, scheduleShowForCode, facebookPostScoresToPageName, mobileSendPushMessages, updatedAt, assignmentsHidePast, facebookPostScoresToPageId, remindersSendManagerDaysBeforeEvent, scheduleHidePast, facebookPoliteScores, eventReminderPreference, remindersSendDaysBeforeGame, availabilityShowPast, remindersSendManagerDaysBeforeGame, facebookOnlyPostWins, facebookPostScoresToWall, facebookPageAccessToken, createdAt, remindersSendManagerEvent, teamId, linkMember, linkTeam;

+ (NSString *)SDKType {
    return @"member_preferences";
}

@end
