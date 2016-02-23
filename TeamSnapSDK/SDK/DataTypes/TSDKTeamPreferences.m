//
//  TSDKTeamPreferences.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 9/14/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKTeamPreferences.h"
#import "TSDKDataRequest.h"

@implementation TSDKTeamPreferences

@dynamic globalUniformAway, marketplaceShowTab, statisticsShowTab, createdAt, availabilityEventCutoff, teamId, teamMessage, assignmentsShowTab, isPaymentsPrivate, colorSchemeCd, availabilitiesSortOrder, shareAvailabilityNotes, tslEnabled, alternateSportName, assignmentsEnableFor, paymentsIgnoreNonPlayers, availabilityGameCutoff, filesShowTab, availabilitiesShowTab, currencySymbol, assignmentsEnableForCode, isCoed, tslPushEnabled, leagueControlledSettings, remindersSendGame, managerDefaultAvailability, tslScorePushEnabled, introductionText, trackedItemsIgnoreNonPlayers, announcementAboveHomePhoto, globalUseInternationalDate, teamMediaShowTab, memberSortOrder, tracksPoints, teamHeadline, skillLevel, isYouth, gender, globalUseInternationalTime, showDivisionStandings, updatedAt, hideHeader, ageGroup, paymentsShowTab, isTrackedItemsPrivate, globalUniformHome, remindersSendEvent, trackedItemsIsPrivate, trackedItemsShowTab, linkTeam, linkTeamPhoto, linkTeamLogo;

+ (NSString *)SDKType {
    return @"team_preferences";
}

+ (NSString *)SDKREL {
    return @"teams_preferences";
}


#if TARGET_OS_IPHONE
-(void)getTeamPhotoWithCompletion:(TSDKImageCompletionBlock)completion {
    [TSDKDataRequest requestImageForPath:self.linkTeamPhoto withCompletion:^(UIImage *image) {
        if (completion) {
            completion(image);
        }
    }];
}

-(void)getTeamLogoWithCompletion:(TSDKImageCompletionBlock)completion {
    [TSDKDataRequest requestImageForPath:self.linkTeamLogo withCompletion:^(UIImage *image) {
        if (completion) {
            completion(image);
        }
    }];
}
#endif
@end
