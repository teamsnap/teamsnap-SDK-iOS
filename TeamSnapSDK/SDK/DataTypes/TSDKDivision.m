//
//  TSDKDivision.m
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 12/14/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKDivision.h"
#import "NSURL+TSDKConveniences.h"

@implementation TSDKDivision

@dynamic sportId, leagueUrl, isArchived, postalCode, timeZoneOffset, country, updatedAt, leftBoundary, rightBoundary, parentId, isDeletable, rootId, timeZoneIanaName, isDisabled, name, planId, leagueName, timeZoneDescription, seasonName, locationCountry, timeZone, isAncestorArchived, createdAt, parentDivisionName, billingAddress, allTeamsCount, activeTeamsCount, allChildrenCount, activeChildrenCount, linkParent, linkChildren, linkAncestors, linkDescendants, linkRegistrationForms, linkPlan, linkTeams, linkDivisionEvents, linkDivisionPreferences, linkDivisionLogoPhotoFile;

+ (NSString *)SDKType {
    return @"division";
}

- (NSURL * _Nullable)divisionLogoURLForWidth:(NSInteger)width height:(NSInteger)height {
    NSURLQueryItem *widthQueryItem = [NSURLQueryItem queryItemWithName:@"width" value:[NSString stringWithFormat:@"%ld", (long)width]];
    NSURLQueryItem *heightQueryItem = [NSURLQueryItem queryItemWithName:@"height" value:[NSString stringWithFormat:@"%ld", (long)height]];
    NSURLQueryItem *cropQueryItem = [NSURLQueryItem queryItemWithName:@"crop" value:@"proportional"];
    return [self.linkDivisionLogoPhotoFile URLByAppendingArrayOfQueryItems:@[widthQueryItem, heightQueryItem, cropQueryItem]];
}

@end
