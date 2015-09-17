//
//  TSDKRoster.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 1/31/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKMember.h"

@implementation TSDKMember

@dynamic lastLoggedInAt, isInvitable, isNonPlayer, birthday, hideAge, jerseyNumber, addressCity, invitationCode, addressZip, position, teamId, userId, isOwner, addressState, updatedAt, lastName, isOwnershipPending, hideAddress, invitationDeclined, addressStreet1, gender, createdAt, addressStreet2, firstName, isActivated, isManager, linkBroadcastEmails, linkMemberPreferences, linkBroadcastSmses, linkTeam, linkMemberPhoto, linkMemberPhoneNumbers, linkMemberEmailAddresses, linkForumSubscriptions, linkContactPhoneNumbers, linkContactEmailAddresses, linkMemberThumbnail, linkForumTopics, linkTrackedItemStatuses, linkCustomFields, linkAssignments, linkCustomData, linkUser, linkAvailabilities, linkForumPosts, linkMemberPayments, linkMemberLinks, linkContacts, linkMemberFiles;

+ (NSString *)SDKType {
    return @"member";
}

- (NSString *)fullName {
    return [[NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

@end
