//
// Created by Jason Rahaim on 1/29/15.
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKTeam.h"
#import "TSDKConstants.h"
#import "TSDKObjectsRequest.h"
#import "TSDKEvent.h"
#import "TSDKMember.h"
#import "TSDKContact.h"
#import "TSDKTeamSnap.h"
#import "TSDKPlan.h"
#import "TSDKTeamResults.h"
#import "TSDKTeamPreferences.h"
#import "TSDKLocation.h"
#import "TSDKOpponent.h"
#import "TSDKCustomField.h"
#import "TSDKCustomDatum.h"
#import "TSDKUser.h"
#import "NSURL+TSDKConveniences.h"
#import "NSMutableDictionary+refreshCollectionData.h"
#import "TSDKNotifications.h"
#import "TSDKSportPosition.h"

@interface TSDKTeam()

@end

@implementation TSDKTeam {
    
}

@dynamic createdAt, isInLeague, hasReachedRosterLimit, planId, locationCountry, memberLimit, locationLatitude, timeZoneDescription, divisionId, hasExportableMedia, mediaStorageUsed, sportId, isRetired, isArchivedSeason, billedAt, lastAccessedAt, isHiddenOnDashboard, seasonName, activeSeasonTeamId, name, leagueName, humanizedMediaStorageUsed, isGameDay, isGatewayRequiredForSms, divisionName, hasPlaayVideo, locationLongitude, playerMemberCount, hasReachedMemberLimit, locationState, timeZoneOffset, updatedAt, canExportMedia, rosterLimit, timeZoneIanaName, nonPlayerMemberCount, leagueUrl, locationPostalCode, linkTeamMediaGroups, linkContactEmailAddresses, linkMembersPreferences, linkAvailabilities, linkForumTopics, linkTeamStores, linkOwner, linkTeamMediumComments, linkForumSubscriptions, linkEvents, linkTeamPaypalPreferences, linkForumPosts, linkTeamMedia, linkCalendarWebcal, linkSport, linkContacts, linkMembersCsvExport, linkTrackedItemStatuses, linkMemberPhotos, linkManagers, linkCommissioners, linkAvailabilitiesCsvExport, linkLeagueRegistrantDocuments, linkStatisticAggregates, linkOpponents, linkCalendarHttpGamesOnly, linkCustomData, linkTeamPreferences, linkMobilePlanSelection, linkCalendarHttp, linkDivisionTeamStandings, linkPaymentNotes, linkPlan, linkTeamFees, linkEventsOverview, linkMemberPhoneNumbers, linkMemberLinks, linkTeamStore, linkBroadcastEmailAttachments, linkTeamStatistics, linkMemberEmailAddresses, linkMessagingPermissions, linkMembers, linkStatistics, linkBatchInvoicesAggregates, linkSponsors, linkMemberBalances, linkStatisticGroups, linkMemberStatistics, linkOpponentsResults, linkPaypalCurrency, linkTrackedItems, linkAssignments, linkTeamResults, linkTeamPhotoFile, linkLeagueCustomData, linkContactPhoneNumbers, linkMemberFiles, linkAdvertisements, linkMemberPayments, linkLeagueCustomFields, linkMessages, linkLocations, linkCustomFields, linkSportPositions, linkBroadcastEmails, linkStatisticData, linkTeamLogoPhotoFile, linkTeamChat, linkBatchInvoices, linkEventsCsvExport, linkCalendarWebcalGamesOnly, linkEventStatistics, linkMessageData, linkBroadcastAlerts, linkTeamPublicSite, linkInvoiceRecipientsInvoicesAggregates, linkWepayAccounts, linkGrantedWepayAccount, linkPartnersPreferencesFlipGive;

+ (NSString *)SDKType {
    return @"team";
}

+(void)actionUpdateTimeZone:(NSTimeZone *)timeZone offsetEventTimes:(BOOL)offsetEventTimes forTeam:(TSDKTeam *)team withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKCompletionBlock)completion {
    TSDKCollectionCommand *command = [TSDKTeam commandForKey:@"update_time_zone"];
    command.data[@"team_id"] = team.objectIdentifier;
    command.data[@"offset_team_times"] = [NSNumber numberWithBool:offsetEventTimes];
    command.data[@"time_zone"] = timeZone.name;
    [command executeWithCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
        if (completion) {
            completion(success, complete, objects, error);
        }
    }];
}

-(void)getBatchInvoicesAggregateWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKBatchInvoiceAggregateCompletionBlock _Nonnull)completion {
    [self arrayFromLink:self.linkBatchInvoicesAggregates withConfiguration:configuration completion:^(BOOL success, BOOL complete, NSArray * _Nonnull objects, NSError * _Nullable error) {
        if(completion) {
            completion(success, complete, objects.firstObject, nil);
        }
    }];
}

- (void)updateTimeZone:(NSTimeZone *)timeZone offsetEventTimes:(BOOL)offsetEventTimes withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKCompletionBlock)completion {
    [self setTimeZone:timeZone];
    [TSDKTeam actionUpdateTimeZone:timeZone offsetEventTimes:offsetEventTimes forTeam:self withConfiguration:configuration completion:completion];
}

+ (void)actionImportMembers:(NSArray <TSDKMember *> *)members destinationTeamId:(NSString *_Nonnull)destinationTeamId sendInvites:(BOOL)sendInvites completion:(TSDKArrayCompletionBlock)completion {
    TSDKCollectionCommand *command = [TSDKMember commandForKey:@"import_from_team"];
    command.data[@"destination_team_id"] = destinationTeamId;
    
    NSMutableArray *arrayOfMemberIds = [[NSMutableArray alloc] initWithCapacity:members.count];
    for(TSDKMember *member in members) {
        [arrayOfMemberIds addObject:member.objectIdentifier];
    }
    
    command.data[@"source_member_ids"] = [arrayOfMemberIds componentsJoinedByString:@","];;
    if(sendInvites) {
        command.data[@"send_invites"] = @"true";
    } else {
        command.data[@"send_invites"] = @"false";
    }
    
    [command executeWithCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON * _Nullable objects, NSError * _Nullable error) {
        NSArray *result = nil;
        if (success) {
            if ([[objects collection] isKindOfClass:[NSArray class]]) {
                result = [TSDKObjectsRequest SDKObjectsFromCollection:objects];
            }
        }
        if (completion) {
            completion(success, complete, result, error);
        }
    }];
}

- (void)actionImportMembersToTeam:(NSArray <TSDKMember *> *)members sendInvites:(BOOL)sendInvites completion:(TSDKArrayCompletionBlock)completion {
    [TSDKTeam actionImportMembers:members destinationTeamId:self.objectIdentifier sendInvites:sendInvites completion:completion];
}

+ (void)actionInviteMembersOrContacts:(NSArray <TSDKCollectionObject<TSDKMemberOrContactProtocol> *> *)membersOrContacts teamId:(NSString *_Nonnull)teamId asMemberId:(NSString *_Nonnull)asMemberId completion:(TSDKSimpleCompletionBlock)completion {
    TSDKCollectionCommand *command = [TSDKTeam commandForKey:@"invite"];
    command.data[@"team_id"] = teamId;
    
    NSMutableArray *arrayOfMemberIds = [[NSMutableArray alloc] initWithCapacity:membersOrContacts.count];
    NSMutableArray *arrayOfContactIds = [[NSMutableArray alloc] initWithCapacity:membersOrContacts.count];
    
    for(TSDKCollectionObject<TSDKMemberOrContactProtocol> *memberOrContact in membersOrContacts) {
        if([memberOrContact isKindOfClass:[TSDKMember class]]) {
            [arrayOfMemberIds addObject:memberOrContact.objectIdentifier];
        } else if([memberOrContact isKindOfClass:[TSDKContact class]]) {
            [arrayOfContactIds addObject:memberOrContact.objectIdentifier];
        }
    }
    if(arrayOfMemberIds.count) {
        command.data[@"member_id"] = arrayOfMemberIds;
    }
    if(arrayOfContactIds.count) {
        command.data[@"contact_id"] = arrayOfContactIds;
    }
    command.data[@"notify_as_member_id"] = asMemberId;
    
    [command executeWithCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON * _Nullable objects, NSError * _Nullable error) {
        if (completion) {
            completion(success, error);
        }
    }];
}


- (void)actionInviteMembersOrContacts:(NSArray <TSDKCollectionObject<TSDKMemberOrContactProtocol> *> *)membersOrContacts asMemberId:(NSString *_Nonnull)asMemberId completion:(TSDKSimpleCompletionBlock)completion {
    [TSDKTeam actionInviteMembersOrContacts:membersOrContacts teamId:self.objectIdentifier asMemberId:asMemberId completion:completion];
}

+ (void)actionToggleTeamVisibilityOnDashboardTeamIds:(NSArray <NSString *> *_Nonnull)teamIds completion:(TSDKTeamArrayCompletionBlock _Nullable)completion {
    TSDKCollectionCommand *command = [TSDKTeam commandForKey:@"toggle_team_visibility_on_dashboard"];
    command.data[@"team_ids"] = [teamIds componentsJoinedByString:@","];
    [command executeWithCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON * _Nullable objects, NSError * _Nullable error) {
        NSArray *result = nil;
        if (success) {
            if ([[objects collection] isKindOfClass:[NSArray class]]) {
                result = [TSDKObjectsRequest SDKObjectsFromCollection:objects];
            }
        }
        if (completion) {
            completion(success, complete, result, error);
        }
    }];

}

- (void)actionToggleTeamVisibilityOnDashboardWithCompletion:(TSDKTeamArrayCompletionBlock _Nullable)completion {
    [TSDKTeam actionToggleTeamVisibilityOnDashboardTeamIds:@[self.objectIdentifier] completion:completion];
}

- (void)saveWithCompletion:(TSDKSaveCompletionBlock)completion{
    BOOL isNewTeam = self.isNewObject;
    
    [super saveWithCompletion:^(BOOL success, TSDKCollectionObject *saved, NSError *error) {
        if (isNewTeam) {
            if (success) {
                [[[TSDKTeamSnap sharedInstance] teamSnapUser] getPersonasWithConfiguration:nil completion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
                    if (completion) {
                        completion(success, saved, error);
                    }
                }];
            } else {
                if (completion) {
                    completion(success, saved, error);
                }
            }
        } else {
            if (completion) {
                completion(success, saved, error);
            }
        }
    }];
}

- (instancetype)initWithName:(NSString *)name locationCountry:(NSString *)locationCountry locationPostalCode:(NSString *)locationPostalCode ianaTimeZoneName:(NSString *)ianaTimeZoneName sportId:(NSString *_Nonnull)sportId {
    self = [self init];
    if (self) {
        [super setString:name forKey:@"name"];
        [super setString:locationCountry forKey:@"location_country"];
        [super setString:locationPostalCode forKey:@"location_postal_code"];
        [super setString:ianaTimeZoneName forKey:@"time_zone_iana_name"];
        [super setString:ianaTimeZoneName forKey:@"time_zone"];
        [super setString:sportId forKey:@"sport_id"];
    }
    return self;
}

- (void)setTimeZone:(NSTimeZone *)timeZone {
    [self setTimeZoneIanaName:timeZone.name];
}

- (void)setTimeZoneIanaName:(NSString *)timeZoneIanaName {
    [self setString:timeZoneIanaName forKey:@"time_zone_iana_name"];
    [self setString:timeZoneIanaName forKey:@"time_zone"];
    [self removeChangedValueForKey:@"time_zone"];
}

- (NSTimeZone *)timeZone {
    return [NSTimeZone timeZoneWithName:self.timeZoneIanaName];
}

- (void)bulkLoadDataWithTypes:(NSArray *)dataTypes withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion {
    if (dataTypes.count>0) {
        [TSDKObjectsRequest bulkLoadTeamData:self types:dataTypes completion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
            if (completion) {
                completion(success, complete, objects, error);
            }
        }];
    } else {
        if (completion) {
            completion(NO, NO, [NSArray array], nil);
        }
    }
}

- (void)getEventsInDateRange:(NSDate *)startDate endDate:(NSDate *)endDate withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKPagedEventsCompletionBlock)completion {
    [TSDKObjectsRequest listEventsForTeams:@[self] pageNumber:nil pageSize:nil startDate:startDate endDate:endDate configuration:configuration completion:completion];
}

- (void)getEventsStartingAfter:(NSDate *_Nonnull)date pageSize:(NSNumber *_Nullable)pageSize pageNumber:(NSNumber *_Nullable)pageNumber configuration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKPagedEventsCompletionBlock _Nullable)completion {
    [TSDKObjectsRequest listEventsForTeams:@[self] pageNumber:pageNumber pageSize:pageSize startDate:date endDate:nil configuration:configuration completion:completion];
}

- (void)getEventsStartingBefore:(NSDate *_Nonnull)date pageSize:(NSNumber *_Nullable)pageSize pageNumber:(NSNumber *_Nullable)pageNumber configuration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKPagedEventsCompletionBlock _Nullable)completion {
    [TSDKObjectsRequest listEventsForTeams:@[self] pageNumber:pageNumber pageSize:pageSize startDate:nil endDate:date configuration:configuration completion:completion];
}

- (void)getEventWithId:(NSString *_Nonnull)eventId withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKEventArrayCompletionBlock)completion {
    NSDictionary *searchParams = @{@"id": eventId};
    
    [self arrayFromLink:self.linkEvents searchParams:searchParams withConfiguration:configuration completion:completion];
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [super encodeWithCoder:coder];
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

- (NSURL * _Nullable)teamLogoForWidth:(NSInteger)width height:(NSInteger)height {
    NSURLQueryItem *widthQueryItem = [NSURLQueryItem queryItemWithName:@"width" value:[NSString stringWithFormat:@"%ld", (long)width]];
    NSURLQueryItem *heightQueryItem = [NSURLQueryItem queryItemWithName:@"height" value:[NSString stringWithFormat:@"%ld", (long)height]];
    NSURLQueryItem *cropQueryItem = [NSURLQueryItem queryItemWithName:@"crop" value:@"proportional"];
    
    return [self.linkTeamLogoPhotoFile URLByAppendingArrayOfQueryItems:@[widthQueryItem, heightQueryItem, cropQueryItem]];
}

- (NSURL * _Nullable)teamPhotoForWidth:(NSInteger)width height:(NSInteger)height {
    NSURLQueryItem *widthQueryItem = [NSURLQueryItem queryItemWithName:@"width" value:[NSString stringWithFormat:@"%ld", (long)width]];
    NSURLQueryItem *heightQueryItem = [NSURLQueryItem queryItemWithName:@"height" value:[NSString stringWithFormat:@"%ld", (long)height]];
    NSURLQueryItem *cropQueryItem = [NSURLQueryItem queryItemWithName:@"crop" value:@"proportional"];
    
    return [self.linkTeamPhotoFile URLByAppendingArrayOfQueryItems:@[widthQueryItem, heightQueryItem, cropQueryItem]];
}

- (void)emailOwnerForUpsellFeature:(NSString * _Nonnull)feature fromContactId:(NSString * _Nonnull)contactId isOwner:(BOOL)isOwner completion:(TSDKSimpleCompletionBlock _Nullable)completion {
    
    TSDKCollectionCommand *command;
    if(isOwner) {
        command = [TSDKTeam commandForKey:@"send_upsell_message_from_owner"];
    } else {
        command = [TSDKTeam commandForKey:@"send_upsell_message_from_contact"];
    }
    
    if (command == nil) {
        if (completion != nil) {
            completion(NO, nil);
        }
        return;
    }
    [command.data removeAllObjects];
    command.data[@"team_id"] = self.objectIdentifier;
    command.data[@"feature"] = feature;
    if(isOwner == NO) {
        command.data[@"contact_id"] = contactId;
    }
    
    [command executeWithCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON * _Nullable objects, NSError * _Nullable error) {
        if(completion) {
            completion(success, error);
        }
    }];
}

+ (void)queryDivisionSearchPagesize:(NSInteger)pageSize pageNumber:(NSInteger)pageNumber divisionId:(NSString *_Nonnull)divisionId isActive:(BOOL)isActive isCommissioner:(BOOL)isCommissioner WithCompletion:(TSDKTeamArrayCompletionBlock _Nullable)completion {
    
    TSDKCollectionQuery *queryCommand = [TSDKCollectionObject queryForClass:[TSDKTeam SDKType] forKey:@"division_search"];
    if (queryCommand && [[TSDKTeamSnap sharedInstance] clientId]) {
        queryCommand.data[@"division_id"] = divisionId;
        queryCommand.data[@"is_active"] = @(isActive);
        queryCommand.data[@"is_commissioner"] = @(isCommissioner);
        queryCommand.data[@"page_number"] = @(pageNumber);
        queryCommand.data[@"page_size"] = @(pageSize);
        
        [queryCommand executeWithCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
            NSArray *teams;
            if (success && ([[objects collection] isKindOfClass:[NSArray class]])) {
                teams = [TSDKObjectsRequest SDKObjectsFromCollection:objects];
            }
            if (completion) {
                completion(success, YES, teams, error);
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
