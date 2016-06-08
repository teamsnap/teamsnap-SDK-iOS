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

- (void)setScheduleReminderPreference:(TSDKMemberPreferencesScheduleReminder)scheduleReminderPreference {
    switch (scheduleReminderPreference) {
        case TSDKMemberPreferencesScheduleReminderOff:
            self.remindersSendGame = NO;
            self.remindersSendEvent = NO;
            break;
        case TSDKMemberPreferencesScheduleReminderGamesAndEvents:
            self.remindersSendGame = YES;
            self.remindersSendEvent = YES;
            break;
        case TSDKMemberPreferencesScheduleReminderGamesOnly:
            self.remindersSendGame = YES;
            self.remindersSendEvent = NO;
            break;
        case TSDKMemberPreferencesScheduleReminderEventsOnly:
            self.remindersSendGame = NO;
            self.remindersSendEvent = YES;
        default:
            break;
    }
}

- (TSDKMemberPreferencesScheduleReminder)scheduleReminderPreference {
    if(self.remindersSendEvent == NO && self.remindersSendGame == NO) {
        return TSDKMemberPreferencesScheduleReminderOff;
    } else if(self.remindersSendEvent == YES && self.remindersSendGame == YES) {
        return TSDKMemberPreferencesScheduleReminderGamesAndEvents;
    } else if(self.remindersSendEvent == NO && self.remindersSendGame == YES) {
        return TSDKMemberPreferencesScheduleReminderGamesOnly;
    } else {
        return TSDKMemberPreferencesScheduleReminderEventsOnly;
    }
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
