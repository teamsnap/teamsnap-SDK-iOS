//
//  TSDKTeamPreferences.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 9/14/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKTeamPreferences.h"
#import "TSDKDataRequest.h"

@interface TSDKTeamPreferences()

@property (nonatomic, weak) NSString *availabilitiesSortOrder; //Example: date
@property (nonatomic, weak) NSString *memberSortOrder; //Example: last

@end

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
    [TSDKDataRequest requestImageForPath:self.linkTeamPhoto configuration:configuration withCompletion:^(UIImage *image) {
        if (completion) {
            completion(image);
        }
    }];
}

-(void)getTeamLogoWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKImageCompletionBlock)completion {
    if(self.linkTeamLogo) {
        [TSDKDataRequest requestImageForPath:self.linkTeamLogo configuration:configuration withCompletion:^(UIImage *image) {
            if (completion) {
                completion(image);
            }
        }];
    } else {
        if(completion) {
            completion(nil);
        }
    }
}
#endif

- (TSDKTeamPreferenceMemberSortOrder)memberSortOrderPreference {
    if([[self.memberSortOrder lowercaseString] isEqualToString:[@"last" lowercaseString]]) {
        return TSDKTeamPreferenceMemberSortOrderLastName;
    } else {
        return TSDKTeamPreferenceMemberSortOrderFirstName;
    }
}

- (void)setMemberSortOrderPreference:(TSDKTeamPreferenceMemberSortOrder)memberSortOrderPreference {
    switch (memberSortOrderPreference) {
        case TSDKTeamPreferenceMemberSortOrderFirstName:
            self.memberSortOrder = @"first";
            break;
        case TSDKTeamPreferenceMemberSortOrderLastName:
            self.memberSortOrder = @"last";
        default:
            break;
    }
}

- (TSDKTeamPreferenceAvailabilitiesSortOrder)availabilitiesSortOrderPreference {
    if([[self.availabilitiesSortOrder lowercaseString] isEqualToString:[@"name" lowercaseString]]) {
        return TSDKTeamPreferenceAvailabilitiesSortOrderName;
    } else if([[self.availabilitiesSortOrder lowercaseString] isEqualToString:[@"date" lowercaseString]]) {
        return TSDKTeamPreferenceAvailabilitiesSortOrderDateSet;
    } else {
        return TSDKTeamPreferenceAvailabilitiesSortOrderJerseyNumber;
    }
}

- (void)setAvailabilitySortOrderPreference:(TSDKTeamPreferenceAvailabilitiesSortOrder)sortOrderPreference {
    switch (sortOrderPreference) {
        case TSDKTeamPreferenceAvailabilitiesSortOrderName:
            self.availabilitiesSortOrder = @"name";
            break;
        case TSDKTeamPreferenceAvailabilitiesSortOrderDateSet:
            self.availabilitiesSortOrder = @"date";
            break;
        case TSDKTeamPreferenceAvailabilitiesSortOrderJerseyNumber:
            self.availabilitiesSortOrder = @"jersey";
            break;
        default:
            self.availabilitiesSortOrder = @"jersey";
            break;
    }
}
@end
