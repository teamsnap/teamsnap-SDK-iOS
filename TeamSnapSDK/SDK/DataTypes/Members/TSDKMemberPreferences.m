//
//  TSDKMemberPreferences.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 2/23/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKMemberPreferences.h"

@implementation TSDKMemberPreferences

@dynamic gameReminderPreference, remindersSendDaysBeforeEvent, publicSiteShowThumbnail, memberId, facebookPostScores, remindersSendGame, scheduleShowFor, publicSiteShowLastName, remindersSendEvent, remindersSendManagerGame, scheduleShowForCode, facebookPostScoresToPageName, mobileSendPushMessages, updatedAt, assignmentsHidePast, facebookPostScoresToPageId, remindersSendManagerDaysBeforeEvent, scheduleHidePast, facebookPoliteScores, eventReminderPreference, remindersSendDaysBeforeGame, availabilityShowPast, remindersSendManagerDaysBeforeGame, facebookOnlyPostWins, facebookPostScoresToWall, facebookPageAccessToken, createdAt, remindersSendManagerEvent, teamId, linkMember, linkTeam;

+ (NSString *)SDKType {
    return @"member_preferences";
}

- (void)setManagerAvailabilityReminderPreference:(TSDKMemberPreferencesManagerAvailabilityReminder)managerAvailabilityReminderPreference {
    switch (managerAvailabilityReminderPreference) {
        case TSDKMemberPreferencesManagerAvailabilityReminderOff:
            self.remindersSendManagerGame = NO;
            self.remindersSendManagerEvent = NO;
            break;
        case TSDKMemberPreferencesManagerAvailabilityReminderGamesAndEvents:
            self.remindersSendManagerGame = YES;
            self.remindersSendManagerEvent = YES;
            break;
        case TSDKMemberPreferencesManagerAvailabilityReminderGamesOnly:
            self.remindersSendManagerGame = YES;
            self.remindersSendManagerEvent = NO;
            break;
        case TSDKMemberPreferencesManagerAvailabilityReminderEventsOnly:
            self.remindersSendManagerGame = NO;
            self.remindersSendManagerEvent = YES;
        default:
            break;
    }
}

- (TSDKMemberPreferencesManagerAvailabilityReminder)managerAvailabilityReminderPreference {
    if(self.remindersSendManagerEvent == NO && self.remindersSendManagerGame == NO) {
        return TSDKMemberPreferencesManagerAvailabilityReminderOff;
    } else if(self.remindersSendManagerEvent == YES && self.remindersSendManagerGame == YES) {
        return TSDKMemberPreferencesManagerAvailabilityReminderGamesAndEvents;
    } else if(self.remindersSendManagerEvent == NO && self.remindersSendManagerGame == YES) {
        return TSDKMemberPreferencesManagerAvailabilityReminderGamesOnly;
    } else {
        return TSDKMemberPreferencesManagerAvailabilityReminderEventsOnly;
    }
}

@end
