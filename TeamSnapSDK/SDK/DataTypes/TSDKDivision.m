//
//  TSDKDivision.m
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 12/14/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKDivision.h"

@implementation TSDKDivision

@dynamic sportId, leagueUrl, isArchived, postalCode, timeZoneOffset, country, updatedAt, leftBoundary, rightBoundary, parentId, isDeletable, rootId, timeZoneIanaName, isDisabled, name, planId, leagueName, timeZoneDescription, seasonName, locationCountry, timeZone, isAncestorArchived, createdAt, parentDivisionName, billingAddress, allTeamsCount, activeTeamsCount, allChildrenCount, activeChildrenCount, linkParent, linkChildren, linkAncestors, linkDescendants, linkRegistrationForms, linkPlan, linkTeams, linkDivisionEvents, linkDivisionPreferences;

+ (NSString *)SDKType {
    return @"division";
}

@end
