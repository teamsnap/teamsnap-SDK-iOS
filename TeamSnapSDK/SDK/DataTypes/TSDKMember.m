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
#import "TSDKTeamSnap.h"
#import "TSDKUser.h"

@implementation TSDKMember

@dynamic lastName, createdAt, teamId, hideAddress, isOwnershipPending, addressStreet2, addressState, hasFacebookPostScoresEnabled, hideAge, invitationDeclined, isInvitable, addressZip, lastLoggedInAt, invitationCode, position, birthday, isEmailable, isInvited, isActivated, addressStreet1, isNonPlayer, addressCity, isAgeHidden, firstName, isManager, jerseyNumber, userId, gender, isOwner, isAddressHidden, updatedAt, isAlertable, linkBroadcastEmails, linkBroadcastEmailAttachments, linkMemberLinks, linkMemberPreferences, linkTeam, linkMemberPhoneNumbers, linkMessages, linkMemberEmailAddresses, linkStatisticData, linkForumSubscriptions, linkLeagueCustomData, linkContactPhoneNumbers, linkContactEmailAddresses, linkTeamMedia, linkTrackedItemStatuses, linkForumTopics, linkTeamMediumComments, linkCustomFields, linkAssignments, linkCustomData, linkMemberStatistics, linkAvailabilities, linkMemberBalances, linkForumPosts, linkBroadcastAlerts, linkMemberPayments, linkLeagueCustomFields, linkLeagueRegistrantDocuments, linkContacts, linkMemberFiles, isPushable, linkMemberPhoto, linkMemberThumbnail;

+ (NSString *)SDKType {
    return @"member";
}

-(TSDKTeam *)team {
    return [[[[TSDKTeamSnap sharedInstance] teamSnapUser] teams] objectForIntegerKey:self.teamId];
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
    if ((self.firstName && self.firstName.length>0) && (self.lastName && self.lastName.length>0)) {
        return [[NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    } else if (self.firstName && self.firstName.length>0) {
        return self.firstName;
    } else if (self.lastName && self.lastName.length>0) {
        return  self.lastName;
    } else {
        return @"";
    }
}

- (BOOL)isAtLeastManager {
    return (self.isManager || self.isOwner);
}

- (BOOL)isAtLeastOwner {
    return (self.isOwner);
}
#if TARGET_OS_IPHONE
-(void)getMemberPhotoWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKImageCompletionBlock)completion {
    [TSDKDataRequest requestImageForPath:self.linkMemberPhoto withCompletion:^(UIImage *image) {
        if (completion) {
            completion(image);
        }
    }];
}

-(void)getMemberThumbnailWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKImageCompletionBlock)completion {
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

-(void)getMessagesWithConfiguration:(TSDKRequestConfiguration *)configuration type:(TSDKMessageType)type completion:(TSDKMessagesArrayCompletionBlock)completion {
    
    NSDictionary *searchParams;
    if(type == TSDKMessageTypeAlert) {
        searchParams = @{@"message_type": @"Alert"};
    } else if(type == TSDKMessageTypeEmail) {
        searchParams = @{@"message_type": @"Email"};
    }
    
    [self arrayFromLink:self.linkMessages searchParams:searchParams withConfiguration:configuration completion:completion];
}

- (BOOL)canMarkAsRead {
    return YES;
}

- (NSInteger)memberId {
    return self.objectIdentifier;
}

@end
