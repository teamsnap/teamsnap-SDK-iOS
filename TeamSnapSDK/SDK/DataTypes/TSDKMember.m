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
#import "TSDKTeamSnap.h"
#import "TSDKUser.h"
#import "NSMutableString+TSDKConveniences.h"
#import "TSDKBackgroundUploadProgressMonitorDelegate.h"
#import "TSDKMemberPhoto.h"
#import "TSDKNotifications.h"
#import "TSDKConstants.h"
#import "NSDate+TSDKConveniences.h"
#import "NSURL+TSDKConveniences.h"
#import "TSDKDivision.h"

@implementation TSDKMember

 @dynamic lastName, createdAt, teamId, hideAddress, isOwnershipPending, addressStreet2, isPushable, addressState, hasFacebookPostScoresEnabled, hideAge, invitationDeclined, isInvitable, divisionId, addressZip, lastLoggedInAt, invitationCode, position, birthday, isEmailable, isLeagueOwner, isInvited, isActivated, sourceMemberId, addressStreet1, isNonPlayer, addressCity, isAgeHidden, firstName, isManager, jerseyNumber, userId, isOwner, isAddressHidden, updatedAt, isCommissioner, isAlertable, isDeletable, linkBroadcastEmails, linkLeagueCustomFields, linkForumSubscriptions, linkMessages, linkContactEmailAddresses, linkTeam, linkLeagueCustomData, linkMemberStatistics, linkForumPosts, linkTeamMedia, linkMemberPhotos, linkMessageData, linkAssignments, linkMemberRegistrationSignups, linkMemberAssignments, linkUser, linkTeamMediumComments, linkMemberPhoneNumbers, linkContacts, linkMemberBalances, linkContactPhoneNumbers, linkCustomFields, linkMemberPayments, linkCustomData, linkTrackedItemStatuses, linkBroadcastAlerts, linkMemberFiles, linkMemberLinks, linkAvailabilities, linkBroadcastEmailAttachments, linkMemberEmailAddresses, linkStatisticData, linkForumTopics, linkDivision, linkLeagueRegistrantDocuments, linkMemberPreferences, linkMemberThumbnail, linkMemberPhoto, linkMemberPhotoFile;

+ (NSString *)SDKType {
    return @"member";
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
    return (self.isManager || self.isOwner || self.isCommissioner || self.isLeagueOwner);
}

#if TARGET_OS_IPHONE

- (void)getMemberPhotosForWidth:(NSInteger)width height:(NSInteger)height cropToFit:(BOOL)fitCrop configuration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberPhotoArrayCompletionBlock)completion {
    NSString *cropString = @"fill";
    if (fitCrop) {
        cropString = @"fit";
    }
    NSDictionary *sizeParameterDictionary = @{@"height":[NSNumber numberWithInteger:height],
                                              @"width":[NSNumber numberWithInteger:width],
                                              @"crop":cropString};
    
    [self arrayFromLink:self.linkMemberPhotos searchParams:sizeParameterDictionary withConfiguration:configuration completion:^(BOOL success, BOOL complete, NSArray * _Nullable objects, NSError * _Nullable error) {
        if (completion) {
            completion(success, complete, objects, error);
        }
    }];
}

-(void)getMemberPhotoWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKImageCompletionBlock)completion {
    [TSDKDataRequest requestImageForPath:self.linkMemberPhotos configuration:configuration withCompletion:^(UIImage *image) {
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

- (NSURL *)linkForMemberPhotWithHeight:(NSInteger)height width:(NSInteger)width {
    
    NSURL *url = [[self linkMemberPhotoFile] URLByAppendingQuery:@"height" value:[NSString stringWithFormat:@"%ld",(long)height]];
    
    url = [url URLByAppendingQuery:@"width" value:[NSString stringWithFormat:@"%ld",(long)width]];
    
    url = [url URLByAppendingQuery:@"crop" value:@"fill"];
    return url;
}

- (NSURL *)linkForMemberPhotWithHeight:(NSInteger)height {
    
    NSURL *url = [[self linkMemberPhotoFile] URLByAppendingQuery:@"height" value:[NSString stringWithFormat:@"%ld",(long)height]];
    
    url = [url URLByAppendingQuery:@"crop" value:@"proportional"];
    return url;
}

- (NSURL *)linkForMemberPhotoWithWidth:(NSInteger)width {
    NSURL *url = [[self linkMemberPhotoFile] URLByAppendingQuery:@"width" value:[NSString stringWithFormat:@"%ld",(long)width]];
    
    url = [url URLByAppendingQuery:@"crop" value:@"proportional"];
    return url;
}

+(TSDKBackgroundUploadProgressMonitorDelegate *)actionUploadMemberPhotoFileURL:(NSURL *)photoFileURL memberId:(NSString *_Nonnull)memberId progress:(TSDKUploadProgressBlock)progressBlock {
    
    TSDKBackgroundUploadProgressMonitorDelegate *backgroundUploadDelegate = [[TSDKBackgroundUploadProgressMonitorDelegate alloc] initWithProgressBlock:progressBlock];
    
    TSDKCollectionCommand *uploadCommand = [self commandForKey:@"upload_member_photo"];
    uploadCommand.data[@"member_id"] = memberId;
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
            [poisonPill setString:self.objectIdentifier forKey:@"id"];
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
        return [self.birthday age];
    } else {
        return 0;
    }
}

- (TSDKMemberGender)gender {
    NSString *genderString = [self getString:@"gender"];
    return [TSDKMember genderFromString:genderString];
}

- (void)setGender:(TSDKMemberGender)gender {
    NSString *genderString = [TSDKMember stringFromGender:gender];
    [self setString:genderString forKey:@"gender"];
}

+ (TSDKMemberGender)genderFromString:(NSString *)string {
    if([string.lowercaseString isEqualToString:@"female"]) {
        return TSDKMemberGenderFemale;
    } else if([string.lowercaseString isEqualToString:@"male"]) {
        return TSDKMemberGenderMale;
    } else {
        return TSDKMemberGenderUnknown;
    }
}

+ (NSString *)stringFromGender:(TSDKMemberGender)gender {
    switch (gender) {
        case TSDKMemberGenderFemale:
            return @"Female";
            break;
        case TSDKMemberGenderMale:
            return @"Male";
            break;
        default:
            return nil;
            break;
    }
}

- (NSURL * _Nullable)urlForMessageType:(TSDKMessageType)type {
    NSString *messageTypeValue;
    switch (type) {
        case TSDKMessageTypeAlert:
            messageTypeValue = @"alert";
            break;
        case TSDKMessageTypeEmail:
            messageTypeValue = @"email";
            break;
        default:
            break;
    }
    NSURLQueryItem *typeSearchParameter = [NSURLQueryItem queryItemWithName:@"message_type" value:messageTypeValue];
    return [self.linkMessages URLByAppendingQueryItem:typeSearchParameter];
}

- (void)getMessagesWithConfiguration:(TSDKRequestConfiguration *)configuration type:(TSDKMessageType)type completion:(TSDKMessagesArrayCompletionBlock)completion {
    [self arrayFromLink:[self urlForMessageType:type] searchParams:nil withConfiguration:configuration completion:completion];
}

- (BOOL)canMarkAsRead {
    return YES;
}

- (NSString *_Nullable)memberId {
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

+(void)querySearchId:(NSString *_Nullable)id pageNumber:(NSInteger)pageNumber userId:(NSString *_Nullable)userId teamId:(NSString *_Nullable)teamId divisionId:(NSString *_Nullable)divisionId pageSize:(NSInteger)pageSize WithCompletion:(TSDKMemberArrayCompletionBlock _Nullable)completion {
    TSDKCollectionQuery *queryCommand = [TSDKMember queryForKey:@"search"];
    if (queryCommand && [[TSDKTeamSnap sharedInstance] clientId]) {
        queryCommand.data[@"division_id"] = divisionId;
        queryCommand.data[@"team_id"] = teamId;
        queryCommand.data[@"user_id"] = userId;
        queryCommand.data[@"page_size"] = @(pageSize);
        queryCommand.data[@"page_number"] = @(pageNumber);
        
        [queryCommand executeWithCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
            NSArray *members;
            if (success && ([[objects collection] isKindOfClass:[NSArray class]])) {
                members = [TSDKObjectsRequest SDKObjectsFromCollection:objects];
            }
            if (completion) {
                completion(success, YES, members, error);
            }
        }];
    } else {
        if (completion) {
            NSDictionary *userInfo;
            
            if (![[TSDKTeamSnap sharedInstance] clientId]) {
                userInfo = @{NSLocalizedFailureReasonErrorKey : @"Client ID required", NSLocalizedDescriptionKey : @"The TeamSnap SDK client ID is missing."};
            } else {
                userInfo = @{NSLocalizedFailureReasonErrorKey : @"Command not found", NSLocalizedDescriptionKey : @"There was an error connecting to the TeamSnap server"};
            }
            NSInteger errorCode = 1;
            
            NSError *error = [[NSError alloc] initWithDomain:TSDKTeamSnapSDKErrorDomainKey code:errorCode userInfo:userInfo];
            completion(NO, NO, [NSArray array], error);
        }
    }
}

+ (NSURL * _Nullable)commissionerQueryFor:(TSDKDivision *)division {
    TSDKCollectionQuery *queryCommand = [TSDKMember queryForKey:@"commissioners"];
    NSURLQueryItem *divisionParameter = [NSURLQueryItem queryItemWithName:@"division_id" value:[division objectIdentifier]];
    NSURL *queryURL = [NSURL URLWithString:queryCommand.href];
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:queryURL resolvingAgainstBaseURL:NO];
    urlComponents.queryItems = @[divisionParameter];
    return urlComponents.URL;
}

+ (void)queryCommissionersTeamid:(NSString *_Nullable)teamId divisionId:(NSString *_Nonnull)divisionId WithCompletion:(TSDKMemberArrayCompletionBlock _Nullable)completion {
    TSDKCollectionQuery *queryCommand = [TSDKMember queryForKey:@"commissioners"];
    if (queryCommand && [[TSDKTeamSnap sharedInstance] clientId]) {
        queryCommand.data[@"division_id"] = divisionId;
        queryCommand.data[@"team_id"] = teamId;
        
        [queryCommand executeWithCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
            NSArray *members;
            if (success && ([[objects collection] isKindOfClass:[NSArray class]])) {
                members = [TSDKObjectsRequest SDKObjectsFromCollection:objects];
            }
            if (completion) {
                completion(success, YES, members, error);
            }
        }];
    } else {
        if (completion) {
            NSDictionary *userInfo;
            
            if (![[TSDKTeamSnap sharedInstance] clientId]) {
                userInfo = @{NSLocalizedFailureReasonErrorKey : @"Client ID required", NSLocalizedDescriptionKey : @"The TeamSnap SDK client ID is missing."};
            } else {
                userInfo = @{NSLocalizedFailureReasonErrorKey : @"Command not found", NSLocalizedDescriptionKey : @"There was an error connecting to the TeamSnap server"};
            }
            NSInteger errorCode = 1;
            
            NSError *error = [[NSError alloc] initWithDomain:TSDKTeamSnapSDKErrorDomainKey code:errorCode userInfo:userInfo];
            completion(NO, NO, [NSArray array], error);
        }
    }
}

@end
