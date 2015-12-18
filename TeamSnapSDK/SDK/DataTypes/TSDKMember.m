//
//  TSDKRoster.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 1/31/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKMember.h"
#import "TSDKDataRequest.h"
#import "TSDKMemberEmailAddress.h"
#import "TSDKMemberPhoneNumber.h"
#import "TSDKContact.h"
#import "NSMutableDictionary+integerKey.h"

@implementation TSDKMember

@dynamic isInvited, isInvitable, birthday, hideAge, isNonPlayer, jerseyNumber, addressCity, invitationCode, addressZip, lastLoggedInAt, position, teamId, addressState, isOwner, userId, updatedAt, lastName, hasFacebookPostScoresEnabled, isOwnershipPending, hideAddress, invitationDeclined, addressStreet1, gender, createdAt, addressStreet2, firstName, isActivated, isManager, linkBroadcastEmails, linkBroadcastEmailAttachments, linkBroadcastSmses, linkMemberLinks, linkMemberPreferences, linkTeam, linkMemberPhoneNumbers, linkMemberPhoto, linkMemberEmailAddresses, linkStatisticData, linkForumSubscriptions, linkLeagueCustomData, linkContactPhoneNumbers, linkContactEmailAddresses, linkTeamMedia, linkMemberThumbnail, linkForumTopics, linkTeamMediumComments, linkCustomFields, linkAssignments, linkCustomData, linkMemberStatistics, linkAvailabilities, linkMemberBalances, linkTrackedItemStatuses, linkUser, linkForumPosts, linkMemberPayments, linkLeagueCustomFields, linkLeagueRegistrantDocuments, linkContacts, linkMemberFiles;

+ (NSString *)SDKType {
    return @"member";
}

- (NSMutableDictionary *)contacts {
    if (!_contacts) {
        _contacts = [[NSMutableDictionary alloc] init];
    }
    return _contacts;
}

- (NSMutableDictionary *)emailAddresses {
    if (!_emailAddresses) {
        _emailAddresses = [[NSMutableDictionary alloc] init];
    }
    return _emailAddresses;
}

- (NSMutableDictionary *)phoneNumbers {
    if (!_phoneNumbers) {
        _phoneNumbers = [[NSMutableDictionary alloc] init];
    }
    return _phoneNumbers;
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
#if TARGET_OS_IPHONE
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
#endif
-(NSInteger)age {
    if (self.birthday && (![self.birthday isEqual:[NSNull null]])) {
        NSDate* now = [NSDate date];
        NSDateComponents* ageComponents = [[NSCalendar currentCalendar]
                                           components:NSCalendarUnitYear
                                           fromDate:self.birthday
                                           toDate:now
                                           options:0];
        NSInteger age = [ageComponents year];
        return age;
    } else {
        return 0;
    }
}

- (void)addPhoneNumber:(TSDKMemberPhoneNumber *)phoneNumber {
    [self.phoneNumbers setObject:phoneNumber forIntegerKey:phoneNumber.objectIdentifier];
}

- (void)addEmailAddress:(TSDKMemberEmailAddress *)emailAddress {
    [self.emailAddresses setObject:emailAddress forIntegerKey:emailAddress.objectIdentifier];
}

- (void)addContact:(TSDKContact *)contact {
    [self.contacts setObject:contact forIntegerKey:contact.objectIdentifier];
}

- (BOOL)processBulkLoadedObject:(TSDKCollectionObject *)bulkObject {
    BOOL lProcessed = NO;
    
    if ([bulkObject isKindOfClass:[TSDKMemberEmailAddress class]]) {
        [self addEmailAddress:(TSDKMemberEmailAddress *)bulkObject];
        lProcessed = YES;
    } else if ([bulkObject isKindOfClass:[TSDKMemberPhoneNumber class]]) {
        [self addPhoneNumber:(TSDKMemberPhoneNumber *)bulkObject];
        lProcessed = YES;
    } else if ([bulkObject isKindOfClass:[TSDKContact class]]) {
        [self addContact:(TSDKContact *)bulkObject];
        lProcessed = YES;
    }
    return lProcessed;
}

@end
