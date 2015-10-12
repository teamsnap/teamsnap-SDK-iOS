//
//  TSDKTeamPreferences.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 9/14/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKTeamPreferences.h"

@implementation TSDKTeamPreferences

@dynamic globalUniformAway, marketplaceShowTab, statisticsShowTab, createdAt, availabilityEventCutoff, teamId, teamMessage, assignmentsShowTab, isPaymentsPrivate, colorSchemeCd, availabilitiesSortOrder, shareAvailabilityNotes, tslEnabled, alternateSportName, assignmentsEnableFor, paymentsIgnoreNonPlayers, availabilityGameCutoff, filesShowTab, availabilitiesShowTab, currencySymbol, assignmentsEnableForCode, isCoed, tslPushEnabled, leagueControlledSettings, remindersSendGame, managerDefaultAvailability, tslScorePushEnabled, introductionText, trackedItemsIgnoreNonPlayers, announcementAboveHomePhoto, globalUseInternationalDate, teamMediaShowTab, memberSortOrder, tracksPoints, teamHeadline, skillLevel, isYouth, gender, globalUseInternationalTime, showDivisionStandings, updatedAt, hideHeader, ageGroup, paymentsShowTab, isTrackedItemsPrivate, globalUniformHome, remindersSendEvent, trackedItemsIsPrivate, trackedItemsShowTab, linkTeam, linkTeamPhoto, linkTeamLogo;

+ (NSString *)SDKType {
    return @"team_preferences";
}

-(void)getTeamPhotoWithCompletion:(TSDKImageCompletionBlock)completion {
#if TARGET_OS_IPHONE
    [TSDKDataRequest requestImageForPath:self.linkTeamPhoto withCompletion:^(UIImage *image) {
        if (completion) {
            completion(image);
        }
    }];
#else
    [TSDKDataRequest requestImageForPath:self.linkTeamPhoto withCompletion:^(NSImage *image) {
        if (completion) {
            completion(image);
        }
    }];
#endif
}

-(void)getTeamLogoWithCompletion:(TSDKImageCompletionBlock)completion {
#if TARGET_OS_IPHONE
    [TSDKDataRequest requestImageForPath:self.linkTeamLogo withCompletion:^(UIImage *image) {
        if (completion) {
            completion(image);
        }
    }];
#else
    [TSDKDataRequest requestImageForPath:self.linkTeamLogo withCompletion:^(NSImage *image) {
        if (completion) {
            completion(image);
        }
    }];
#endif
}

@end
