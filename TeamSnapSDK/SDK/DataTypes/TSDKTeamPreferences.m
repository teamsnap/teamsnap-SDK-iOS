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

@dynamic tslScorePushEnabled, trackedItemsIsPrivate, memberSortOrder, teamMessage, availabilitiesShowTab, globalUniformHome, tslEnabled, paymentsIgnoreNonPlayers, remindersSendGame, globalUseInternationalDate, availabilityGameCutoff, isTrackedItemsPrivate, assignmentsEnableFor, trackedItemsIgnoreNonPlayers, isYouth, isTslPushEnabled, tracksPoints, availabilityEventCutoff, isCoed, paymentsShowTab, remindersSendEvent, alternateSportName, colorSchemeCd, announcementAboveHomePhoto, updatedAt, isPaymentsPrivate, teamMediaShowTab, skillLevel, trackedItemsShowTab, teamHeadline, globalUniformAway, globalUseInternationalTime, assignmentsShowTab, leagueControlledSettings, createdAt, tslPushEnabled, statisticsShowTab, isTslScorePushEnabled, marketplaceShowTab, teamId, shareAvailabilityNotes, assignmentsEnableForCode, isTslEnabled, managerDefaultAvailability, gender, filesShowTab, showDivisionStandings, ageGroup, availabilitiesSortOrder, currencySymbol, hideHeader, linkTeam, linkTeamPhoto, linkTeamLogo;
;

+ (NSString *)SDKType {
    return @"team_preferences";
}

+ (NSString *)SDKREL {
    return @"teams_preferences";
}


#if TARGET_OS_IPHONE
-(void)getTeamPhotoWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKImageCompletionBlock)completion {
    [TSDKDataRequest requestImageForPath:self.linkTeamPhoto withCompletion:^(UIImage *image) {
        if (completion) {
            completion(image);
        }
    }];
}

-(void)getTeamLogoWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKImageCompletionBlock)completion {
    [TSDKDataRequest requestImageForPath:self.linkTeamLogo withCompletion:^(UIImage *image) {
        if (completion) {
            completion(image);
        }
    }];
}
#endif
@end
