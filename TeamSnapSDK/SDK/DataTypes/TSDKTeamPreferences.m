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

@property (nonatomic, strong) NSString *availabilitiesSortOrder; //Example: date
@property (nonatomic, strong) NSString *memberSortOrder; //Example: last

@end

@implementation TSDKTeamPreferences

@dynamic isStoreConfigured, canDisplayTeamStore, storeUrl, canTeamAddMembers, canTeamDeleteMembers, tslScorePushEnabled, trackedItemsIsPrivate, memberSortOrder, teamMessage, availabilitiesShowTab, globalUniformHome, paymentsIgnoreNonPlayers, remindersSendGame, globalUseInternationalDate, availabilityGameCutoff, isTrackedItemsPrivate, assignmentsEnableFor, trackedItemsIgnoreNonPlayers, isYouth, isTslPushEnabled, tracksPoints, availabilityEventCutoff, isCoed, paymentsShowTab, remindersSendEvent, alternateSportName, colorSchemeCd, announcementAboveHomePhoto, updatedAt, isPaymentsPrivate, teamMediaShowTab, skillLevel, trackedItemsShowTab, teamHeadline, globalUniformAway, globalUseInternationalTime, assignmentsShowTab, leagueControlledSettings, createdAt, tslPushEnabled, statisticsShowTab, isTslScorePushEnabled, isEventLineupEnabled, isDirectMessageEnabled, isHealthCheckEnabled, healthCheckUnlockHours, marketplaceShowTab, teamId, shareAvailabilityNotes, assignmentsEnableForCode, isTslEnabled, isTeamChatEnabled, isUnifiedMessagingTeamChat, teamChatUnifiedMessagingMigrationDate, managerDefaultAvailability, gender, filesShowTab, showDivisionStandings, ageGroup, availabilitiesSortOrder, currencySymbol, hideHeader, canSetupWepay, showInvoicing, linkTeam, linkTeamPhoto, linkTeamLogo;

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

- (NSString *)currencyCode {
    // We need to dafault currencyCode to "USD"
    NSString *currencyCode = [self getString:@"currency_code"];
    if ((currencyCode == nil) || [currencyCode length] == 0) {
        return @"USD";
    }
    return currencyCode;
}

- (TSDKTeamPreferenceMemberSortOrder)memberSortOrderPreference {
    if([[self.memberSortOrder lowercaseString] isEqualToString:[[self rawValueForMemberSortOrder:TSDKTeamPreferenceMemberSortOrderLastName] lowercaseString]]) {
        return TSDKTeamPreferenceMemberSortOrderLastName;
    } else {
        return TSDKTeamPreferenceMemberSortOrderFirstName;
    }
}

- (void)setMemberSortOrderPreference:(TSDKTeamPreferenceMemberSortOrder)memberSortOrderPreference {
    self.memberSortOrder = [self rawValueForMemberSortOrder:memberSortOrderPreference];
}

- (NSString *)rawValueForMemberSortOrder:(TSDKTeamPreferenceMemberSortOrder)memberSortOrderPreference {
    switch (memberSortOrderPreference) {
        case TSDKTeamPreferenceMemberSortOrderLastName:
            return @"last";
            break;
        case TSDKTeamPreferenceMemberSortOrderFirstName:
            return @"first";
            break;
        default:
            return @"first";
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
