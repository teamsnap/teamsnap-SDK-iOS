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
#import "NSMutableString+TSDKConveniences.h"
#import "TSDKBackgroundUploadProgressMonitorDelegate.h"
#import "TSDKMemberPhoto.h"
#import "TSDKNotifications.h"


@implementation TSDKMember

@dynamic lastName, createdAt, teamId, isOwnershipPending, addressStreet2, addressState, hasFacebookPostScoresEnabled, invitationDeclined, isInvitable, addressZip, lastLoggedInAt, invitationCode, position, birthday, isEmailable, isInvited, isActivated, addressStreet1, isNonPlayer, addressCity, isAgeHidden, firstName, isManager, jerseyNumber, userId, gender, isOwner, isAddressHidden, updatedAt, isAlertable, linkBroadcastEmails, linkBroadcastEmailAttachments, linkMemberLinks, linkMemberPreferences, linkTeam, linkMemberPhoneNumbers, linkMessages, linkMemberEmailAddresses, linkStatisticData, linkForumSubscriptions, linkLeagueCustomData, linkContactPhoneNumbers, linkContactEmailAddresses, linkTeamMedia, linkTrackedItemStatuses, linkForumTopics, linkTeamMediumComments, linkCustomFields, linkAssignments, linkCustomData, linkMemberStatistics, linkAvailabilities, linkMemberBalances, linkForumPosts, linkBroadcastAlerts, linkMemberPayments, linkLeagueCustomFields, linkLeagueRegistrantDocuments, linkContacts, linkMemberFiles, isPushable, linkMemberPhoto, linkMemberThumbnail, linkMemberPhotos;

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

- (void)getMemberPhotosForWidth:(NSInteger)width height:(NSInteger)height cropToFit:(BOOL)fitCrop configuration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberPhotoArrayCompletionBlock)completion {
    NSString *cropString = @"fill";
    if (fitCrop) {
        cropString = @"fit";
    }
    NSDictionary *sizeParameterDictionary = @{@"height":[NSNumber numberWithInteger:height],
                                              @"width":[NSNumber numberWithInteger:height],
                                              @"crop":cropString};
    
    [self arrayFromLink:self.linkMemberPhotos searchParams:sizeParameterDictionary withConfiguration:configuration completion:^(BOOL success, BOOL complete, NSArray * _Nullable objects, NSError * _Nullable error) {
        if (completion) {
            completion(success, complete, objects, error);
        }
    }];
}

-(void)getMemberPhotoWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKImageCompletionBlock)completion {
    [TSDKDataRequest requestImageForPath:self.linkMemberPhoto configuration:configuration withCompletion:^(UIImage *image) {
        if (completion) {
            completion(image);
        }
    }];
}

-(void)getMemberThumbnailWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKImageCompletionBlock)completion {
    [TSDKDataRequest requestImageForPath:self.linkMemberThumbnail configuration:configuration withCompletion:^(UIImage *image) {
        if (completion) {
            completion(image);
        }
    }];
}

+(TSDKBackgroundUploadProgressMonitorDelegate *)actionUploadMemberPhotoFileURL:(NSURL *)photoFileURL memberId:(NSInteger)memberId progress:(TSDKUploadProgressBlock)progressBlock {
    
    TSDKBackgroundUploadProgressMonitorDelegate *backgroundUploadDelegate = [[TSDKBackgroundUploadProgressMonitorDelegate alloc] initWithProgressBlock:progressBlock];
    
    TSDKCollectionCommand *uploadCommand = [self commandForKey:@"upload_member_photo"];
    uploadCommand.data[@"member_id"] = [NSNumber numberWithInteger:memberId];
    uploadCommand.data[@"file_name"] = @"photo.jpg";
    NSData *imageData = [NSData dataWithContentsOfURL:photoFileURL];
    
    uploadCommand.data[@"file"] = imageData;
    NSURL *url = [NSURL URLWithString:uploadCommand.href];
    
    [TSDKDataRequest postDictionary:uploadCommand.data toURL:url delegate:backgroundUploadDelegate];
    
    return backgroundUploadDelegate;
}

- (TSDKBackgroundUploadProgressMonitorDelegate *)uploadMemberPhotoFileURL:(NSURL *)photoFileURL  progress:(TSDKUploadProgressBlock)progressBlock {
    return [TSDKMember actionUploadMemberPhotoFileURL:photoFileURL memberId:self.objectIdentifier progress:^(TSDKBackgroundUploadProgressMonitorDelegate * _Nullable uploadStatus, NSError * _Nullable error) {
        if (uploadStatus.complete && uploadStatus.success) {
            TSDKMemberPhoto *poisonPill = [[TSDKMemberPhoto alloc] init];
            [poisonPill setInteger:self.objectIdentifier forKey:@"id"];
            poisonPill.memberId = self.objectIdentifier;
            poisonPill.teamId = self.teamId;
            [TSDKNotifications postInvalidateAssociatedObjects:poisonPill];
        }
        if (progressBlock) {
            progressBlock(uploadStatus, error);
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
    BOOL isNewPhoneNumber = NO;
    if([self.phoneNumbers objectForIntegerKey:phoneNumber.objectIdentifier] == nil) {
        isNewPhoneNumber = YES;
    }
    [self.phoneNumbers setObject:phoneNumber forIntegerKey:phoneNumber.objectIdentifier];
    
    if(isNewPhoneNumber) {
        [TSDKNotifications postNewObject:phoneNumber];
    } else {
        [TSDKNotifications postRefreshedObject:phoneNumber];
    }
}

- (void)addEmailAddress:(TSDKMemberEmailAddress *)emailAddress {
    BOOL isNewEmail = NO;
    if([self.emailAddresses objectForIntegerKey:emailAddress.objectIdentifier] == nil) {
        isNewEmail = YES;
    }
    [self.emailAddresses setObject:emailAddress forIntegerKey:emailAddress.objectIdentifier];
    
    if(isNewEmail) {
        [TSDKNotifications postNewObject:emailAddress];
    } else {
        [TSDKNotifications postRefreshedObject:emailAddress];
    }
}

- (void)addContact:(TSDKContact *)contact {
    BOOL isNewContact = NO;
    if([self.contacts objectForIntegerKey:contact.objectIdentifier] == nil) {
        isNewContact = YES;
    }
    [self.contacts setObject:contact forIntegerKey:contact.objectIdentifier];
    
    if(isNewContact) {
        [TSDKNotifications postNewObject:contact];
    } else {
        [TSDKNotifications postRefreshedObject:contact];
    }
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
        searchParams = @{@"message_type": @"alert"};
    } else if(type == TSDKMessageTypeEmail) {
        searchParams = @{@"message_type": @"email"};
    }
    
    [self arrayFromLink:self.linkMessages searchParams:searchParams withConfiguration:configuration completion:completion];
}

- (BOOL)canMarkAsRead {
    return YES;
}

- (NSInteger)memberId {
    return self.objectIdentifier;
}


- (NSString *)addressCitySateZip {
    NSMutableString *result = [[NSMutableString alloc] init];
    
    if (self.addressCity.length>0 && self.addressState.length>0) {
        [result appendString:[NSString stringWithFormat:@"%@, %@", self.addressCity, self.addressState]];
    } else if (self.addressCity.length>0 && self.addressZip.length>0) {
        [result appendString:[NSString stringWithFormat:@"%@,", self.addressCity]];
    } else if (self.addressCity.length>0) {
        [result appendString:[NSString stringWithFormat:@"%@", self.addressCity]];
    } else if (self.addressState.length>0) {
        [result appendString:[NSString stringWithFormat:@"%@", self.addressState]];
    }
    if (result.length>0 && self.addressZip.length>0) {
        [result appendString:@" "];
    }
    if (self.addressZip.length > 0) {
        [result appendString:self.addressZip];
    }
    
    return result;
    
}

- (NSString *)fancyAddressString {
    NSMutableArray *addressLines = [[NSMutableArray alloc] init];
    
    if (self.addressStreet1.length >0) {
        [addressLines addObject:self.addressStreet1];
    }
    
    if (self.addressStreet2.length > 0) {
        [addressLines addObject:self.addressStreet2];
    }
    
    
    NSString *cityStateZip = [self addressCitySateZip];
    if (cityStateZip.length>0) {
        [addressLines addObject:cityStateZip];
    }
    
    NSString *result = [addressLines componentsJoinedByString:@"\n"];
    
    return result;
}

-(NSString *)addressString {
    NSMutableString *result = [[NSMutableString alloc] initWithFormat:@""];
    
    if (self.addressStreet1.length>0) {
        [result appendFormat:@"%@", self.addressStreet1];
    }
    if (self.addressStreet2.length>0) {
        [result appendStringWithComma:self.addressStreet2];
    }
    if (self.addressCity.length>0) {
        [result appendStringWithComma:self.addressCity];
    }
    if (self.addressState.length>0) {
        [result appendStringWithComma:self.addressState];
    }
    if (self.addressZip.length>0) {
        [result appendFormat:@" %@", self.addressZip];
    }
    return [NSString stringWithString:result];
}

@end
