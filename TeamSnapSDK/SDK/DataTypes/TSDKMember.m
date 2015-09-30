//
//  TSDKRoster.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 1/31/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKMember.h"

@implementation TSDKMember

@dynamic isInvited, isInvitable, birthday, hideAge, isNonPlayer, jerseyNumber, addressCity, invitationCode, addressZip, lastLoggedInAt, position, teamId, addressState, isOwner, userId, updatedAt, lastName, hasFacebookPostScoresEnabled, isOwnershipPending, hideAddress, invitationDeclined, addressStreet1, gender, createdAt, addressStreet2, firstName, isActivated, isManager, linkBroadcastEmails, linkBroadcastEmailAttachments, linkBroadcastSmses, linkMemberLinks, linkMemberPreferences, linkTeam, linkMemberPhoneNumbers, linkMemberPhoto, linkMemberEmailAddresses, linkStatisticData, linkForumSubscriptions, linkLeagueCustomData, linkContactPhoneNumbers, linkContactEmailAddresses, linkTeamMedia, linkMemberThumbnail, linkForumTopics, linkTeamMediumComments, linkCustomFields, linkAssignments, linkCustomData, linkMemberStatistics, linkAvailabilities, linkMemberBalances, linkTrackedItemStatuses, linkUser, linkForumPosts, linkMemberPayments, linkLeagueCustomFields, linkLeagueRegistrantDocuments, linkContacts, linkMemberFiles;

+ (NSString *)SDKType {
    return @"member";
}

- (NSString *)fullName {
    return [[NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (BOOL)isAtLeastManager {
    return (self.isManager || self.isOwner);
}

- (BOOL)isAtLeastOwner {
    return (self.isOwner);
}

-(void)getMemberPhotoWithCompletion:(TSDKImageCompletionBlock)completion {
    [TSDKDataRequest requestImageForPath:self.linkMemberPhoto withCompletion:^(UIImage *image) {
        if (completion) {
            completion(image);
        }
    }];
}

-(void)getMemberThumbnailWithCompletion:(TSDKImageCompletionBlock)completion {
    [TSDKDataRequest requestImageForPath:self.linkMemberThumbnail withCompletion:^(UIImage *image) {
        if (completion) {
            completion(image);
        }
    }];
}

@end
