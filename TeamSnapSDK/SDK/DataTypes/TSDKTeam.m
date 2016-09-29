//
// Created by Jason Rahaim on 1/29/15.
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKTeam.h"
#import "TSDKObjectsRequest.h"
#import "TSDKProfileTimer.h"
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
#import "TSDKNotifications.h"
#import "NSMutableDictionary+integerKey.h"
#import "NSMutableDictionary+refreshCollectionData.h"

@interface TSDKTeam()
@property (nonatomic, strong) NSMutableDictionary *members;
@property (nonatomic, strong) NSMutableDictionary *events;

@property (nonatomic, strong) NSMutableArray *sortedEvents;
@property (nonatomic, strong) NSMutableArray *sortedMembers;

@property (strong, nonatomic) TSDKTeamPreferences *teamPreferences;
@property (strong, nonatomic) TSDKTeamResults *teamResults;

@end

@implementation TSDKTeam {
    
}

@dynamic sportId, leagueUrl, isInLeague, hasReachedRosterLimit, canExportMedia, timeZoneOffset, locationLatitude, updatedAt, hasExportableMedia, lastAccessedAt, timeZoneIanaName, locationPostalCode, name, locationLongitude, planId, leagueName, timeZoneDescription, rosterLimit, seasonName, locationCountry, mediaStorageUsed, divisionName, humanizedMediaStorageUsed, createdAt, billedAt, isArchivedSeason, isRetired, linkTeamMediaGroups, linkContactEmailAddresses, linkDivisionContactEmailAddresses, linkMembersPreferences, linkAvailabilities, linkForumTopics, linkOwner, linkDivisionMembersPreferences, linkTeamMediumComments, linkForumSubscriptions, linkEvents, linkTeamPaypalPreferences, linkForumPosts, linkTeamMedia, linkCalendarWebcal, linkSport, linkContacts, linkMembersCsvExport, linkTrackedItemStatuses, linkDivisionContacts, linkManagers, linkLeagueRegistrantDocuments, linkStatisticAggregates, linkDivisionLocations, linkOpponents, linkCalendarHttpGamesOnly, linkCustomData, linkDivisionContactPhoneNumbers, linkTeamPreferences, linkCalendarHttp, linkDivisionTeamStandings, linkPaymentNotes, linkPlan, linkTeamFees, linkEventsOverview, linkMemberPhoneNumbers, linkMemberLinks, linkDivisionMembers, linkBroadcastEmailAttachments, linkTeamStatistics, linkMemberEmailAddresses, linkMembers, linkStatistics, linkSponsors, linkMemberBalances, linkStatisticGroups, linkMemberStatistics, linkOpponentsResults, linkPaypalCurrency, linkTrackedItems, linkAssignments, linkTeamResults, linkLeagueCustomData, linkContactPhoneNumbers, linkMessageData, linkMemberFiles, linkMemberPayments, linkDivisionMemberPhoneNumbers, linkDivisionMemberEmailAddresses, linkLeagueCustomFields, linkMessages, linkLocations, linkCustomFields, linkStatisticData, linkBroadcastEmails, linkEventsCsvExport, linkCalendarWebcalGamesOnly, linkEventStatistics, linkTeamPublicSite, linkBroadcastAlerts, linkMemberPhotos, linkTeamPhotos;

+ (NSString *)SDKType {
    return @"team";
}

+(void)actionUpdateTimeZone:(NSTimeZone *)timeZone offsetEventTimes:(BOOL)offsetEventTimes forTeam:(TSDKTeam *)team withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKCompletionBlock)completion {
    TSDKCollectionCommand *command = [TSDKTeam commandForKey:@"update_time_zone"];
    command.data[@"team_id"] = [NSNumber numberWithInteger:team.objectIdentifier];
    command.data[@"offset_team_times"] = [NSNumber numberWithBool:offsetEventTimes];
    command.data[@"time_zone"] = timeZone.name;
    [command executeWithCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
        if (completion) {
            completion(success, complete, objects, error);
        }
    }];
}

- (void)updateTimeZone:(NSTimeZone *)timeZone offsetEventTimes:(BOOL)offsetEventTimes withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKCompletionBlock)completion {
    [self setTimeZone:timeZone];
    [TSDKTeam actionUpdateTimeZone:timeZone offsetEventTimes:offsetEventTimes forTeam:self withConfiguration:configuration completion:completion];
}

+ (void)actionInviteMembersOrContacts:(NSArray <TSDKCollectionObject<TSDKMemberOrContactProtocol> *> *)membersOrContacts teamId:(NSInteger)teamId asMemberId:(NSInteger)asMemberId completion:(TSDKSimpleCompletionBlock)completion {
    TSDKCollectionCommand *command = [TSDKTeam commandForKey:@"invite"];
    command.data[@"team_id"] = [NSNumber numberWithInteger:teamId];
    
    NSMutableArray *arrayOfMemberIds = [[NSMutableArray alloc] initWithCapacity:membersOrContacts.count];
    NSMutableArray *arrayOfContactIds = [[NSMutableArray alloc] initWithCapacity:membersOrContacts.count];
    
    for(TSDKCollectionObject<TSDKMemberOrContactProtocol> *memberOrContact in membersOrContacts) {
        if([memberOrContact isKindOfClass:[TSDKMember class]]) {
            [arrayOfMemberIds addObject:[NSNumber numberWithInteger:memberOrContact.objectIdentifier]];
        } else if([memberOrContact isKindOfClass:[TSDKContact class]]) {
            [arrayOfContactIds addObject:[NSNumber numberWithInteger:memberOrContact.objectIdentifier]];
        }
    }
    if(arrayOfMemberIds.count) {
        command.data[@"member_id"] = arrayOfMemberIds;
    }
    if(arrayOfContactIds.count) {
        command.data[@"contact_id"] = arrayOfContactIds;
    }
    command.data[@"notify_as_member_id"] = [NSNumber numberWithInteger:asMemberId];
    
    [command executeWithCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON * _Nullable objects, NSError * _Nullable error) {
        if (completion) {
            completion(success, error);
        }
    }];
}


- (void)actionInviteMembersOrContacts:(NSArray <TSDKCollectionObject<TSDKMemberOrContactProtocol> *> *)membersOrContacts asMemberId:(NSInteger)asMemberId completion:(TSDKSimpleCompletionBlock)completion {
    [TSDKTeam actionInviteMembersOrContacts:membersOrContacts teamId:self.objectIdentifier asMemberId:asMemberId completion:completion];
}


- (id)init {
    self = [super init];
    if (self) {
        _members = [[NSMutableDictionary alloc] init];
        _events = [[NSMutableDictionary alloc] init];
        _membersUpdated = nil;
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _members = [aDecoder decodeObjectForKey:@"membersArray"];
        _events = [aDecoder decodeObjectForKey:@"eventsArray"];
    }
    return self;
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

- (instancetype)initWithName:(NSString *)name locationCountry:(NSString *)locationCountry locationPostalCode:(NSString *)locationPostalCode ianaTimeZoneName:(NSString *)ianaTimeZoneName sportId:(NSInteger)sportId {
    self = [self init];
    if (self) {
        [super setString:name forKey:@"name"];
        [super setString:locationCountry forKey:@"location_country"];
        [super setString:locationPostalCode forKey:@"location_postal_code"];
        [super setString:ianaTimeZoneName forKey:@"time_zone_iana_name"];
        [super setString:ianaTimeZoneName forKey:@"time_zone"];
        [super setInteger:sportId forKey:@"sport_id"];
    }
    return self;
}

- (void)setTimeZone:(NSTimeZone *)timeZone {
    [self setTimeZoneIanaName:timeZone.name];
}

- (void)setTimeZoneIanaName:(NSString *)timeZoneIanaName {
    [self setString:timeZoneIanaName forKey:@"time_zone_iana_name"];
    self.collection.data[@"time_zone"] = timeZoneIanaName;
    [self.changedValues setObject:[NSNull null] forKey:@"time_zone"];
}

- (NSTimeZone *)timeZone {
    return [NSTimeZone timeZoneWithName:self.timeZoneIanaName];
}

- (TSDKPlan *)plan {
    return [[TSDKTeamSnap sharedInstance] planWithId:self.planId];
}

- (void)setPlan:(TSDKPlan *)plan {
    self.planId = plan.objectIdentifier;
}

- (void)getTeamPreferencesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamPreferencesArrayCompletionBlock)completion {
    if (!configuration.forceReload && self.teamPreferences) {
        if (completion) {
            completion(YES, YES, @[self.teamPreferences], nil);
        }
    } else {
        [self arrayFromLink:self.linkTeamPreferences withConfiguration:configuration completion:completion];
    }
}

- (void)getTeamResultsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamResultsArrayCompletionBlock)completion {
    if (!configuration.forceReload && self.teamResults) {
        if (completion) {
            completion(YES, YES, @[self.teamResults], nil);
        }
    } else {
        [self arrayFromLink:self.linkTeamResults withConfiguration:configuration completion:completion];
    }
}

#pragma mark -
#pragma mark TSDKProcessBulkObjectProtocol
- (BOOL)processBulkLoadedObject:(TSDKCollectionObject *)bulkObject {
    BOOL lProcessed = NO;
    
    DLog(@"\nProcess Team: %@ (%ld) - %@ (%ld)", self.name, (long)self.objectIdentifier, [bulkObject class], (long)bulkObject.objectIdentifier);
    if ([bulkObject isKindOfClass:[TSDKEvent class]]) {
        [self addEvent:(TSDKEvent *)bulkObject];
        self.eventsUpdated = [NSDate date];
        lProcessed = YES;
    } else if ([bulkObject isKindOfClass:[TSDKMember class]]) {
        [self addMember:(TSDKMember *)bulkObject];
        self.membersUpdated = [NSDate date];
        lProcessed = YES;
    } else if ([bulkObject isKindOfClass:[TSDKTeamPreferences class]]) {
        if (self.teamPreferences) {
            [self.teamPreferences setCollection:bulkObject.collection];
            [TSDKNotifications postRefreshedObject:bulkObject];
        } else {
            self.teamPreferences = (TSDKTeamPreferences *)bulkObject;
            [TSDKNotifications postNewObject:bulkObject];
        }
        lProcessed = YES;
    } else if ([bulkObject isKindOfClass:[TSDKTeamResults class]]) {
        if (self.teamResults) {
            [self.teamResults setCollection:bulkObject.collection];
            [TSDKNotifications postRefreshedObject:bulkObject];
        } else {
            self.teamResults = (TSDKTeamResults *)bulkObject;
            [TSDKNotifications postNewObject:bulkObject];
        }
        lProcessed = YES;
    }
    if (!lProcessed && [bulkObject.collection.data objectForKey:@"member_id"]) {
        NSInteger memberId = [bulkObject getInteger:@"member_id"];
        if (memberId != NSNotFound) {
            TSDKMember *member = [self memberWithID:memberId];
            if (member) {
                lProcessed = [member processBulkLoadedObject:(TSDKCollectionObject *)bulkObject];
            }
        }
    }
    return lProcessed;
}

- (void)addEvent:(TSDKEvent *)event {
    BOOL isNewEvent = NO;
    if ([self.events objectForIntegerKey:event.objectIdentifier] == nil) {
        isNewEvent = YES;
    }
    
    [self.events refreshCollectionObject:event];
    [self dirtySortedEventLists];
    
    if(isNewEvent) {
        [TSDKNotifications postNewObject:event];
    } else {
        [TSDKNotifications postRefreshedObject:event];
    }
}

- (void)addMember:(TSDKMember *)member {
    BOOL isNewMember = NO;
    if([self.members objectForIntegerKey:member.objectIdentifier] == nil) {
        isNewMember = YES;
    }
    [self.members refreshCollectionObject:member];
    [self dirtySortedMemberLists];
    
    if(isNewMember) {
        [TSDKNotifications postNewObject:member];
    } else {
        [TSDKNotifications postRefreshedObject:member];
    }
}

- (TSDKMember *)memberWithID:(NSInteger)memberId {
    return [self.members objectForIntegerKey:memberId];
}

- (NSArray *)membersWithUserId:(NSInteger)userId {
    NSArray *arrayOfMembers = [self.members allValues];
    
    NSIndexSet *indexSet = [arrayOfMembers indexesOfObjectsPassingTest:^BOOL(TSDKMember *member, NSUInteger idx, BOOL * _Nonnull stop) {
        return (member.userId == userId);
    }];
    return [arrayOfMembers objectsAtIndexes:indexSet];
}

- (void)dirtySortedEventLists {
    self.sortedEvents = nil;
}

- (void)dirtySortedMemberLists {
    self.sortedMembers = nil;
}

- (NSArray *)sortedMembers {
    if (!_sortedMembers) {
        _sortedMembers = [NSMutableArray arrayWithArray:[_members allValues]];
        [_sortedMembers sortUsingComparator:^NSComparisonResult(TSDKMember *member1, TSDKMember *member2) {
            return [member1.fullName compare:member2.fullName];
        }];
    }
    return _sortedMembers;
}

- (NSArray *)eventsSorted {
    if (!self.sortedEvents) {
        self.sortedEvents = [NSMutableArray arrayWithArray:[self.events allValues]];
        [self.sortedEvents sortUsingComparator:^NSComparisonResult(TSDKEvent *event1, TSDKEvent *event2) {
            return [event1.startDate compare:event2.startDate];
        }];
    }
    return self.sortedEvents;
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
            completion(NO, NO, nil, nil);
        }
    }
}

- (void)getMembersWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberArrayCompletionBlock)completion {
    if (!configuration.forceReload && self.membersUpdated && self.sortedMembers) {
        if (completion) {
            completion(YES, YES, self.sortedMembers, nil);
        }
    } else {
        [self arrayFromLink:self.linkMembers withConfiguration:configuration completion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
            if (completion) {
                completion(success, complete, self.sortedMembers, error);
            }
        }];
    }
}

- (void)getEventsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKEventArrayCompletionBlock)completion {
    if (!configuration.forceReload && self.eventsUpdated) {
        if (completion) {
            completion(YES, YES, self.eventsSorted, nil);
        }
    } else {
        [self arrayFromLink:self.linkEvents withConfiguration:configuration completion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
            if (completion) {
                completion(success, complete, objects, error);
            }
        }];
    }
}

- (void)getEventsInDateRange:(NSDate *)startDate endDate:(NSDate *)endDate withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKEventArrayCompletionBlock)completion {
    
    [TSDKObjectsRequest listEventsForTeam:self startDate:(NSDate *)startDate endDate:(NSDate *)endDate completion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
        if (completion) {
            completion(success, complete, objects, error);
        }
    }];
}

- (void)getEventWithId:(NSInteger)eventId withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKEventArrayCompletionBlock)completion {
    NSDictionary *searchParams = @{@"id": [NSNumber numberWithInteger:eventId]};
    
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
                                              @"width":[NSNumber numberWithInteger:height],
                                              @"crop":cropString};
    
    [self arrayFromLink:self.linkMemberPhotos searchParams:sizeParameterDictionary withConfiguration:configuration completion:^(BOOL success, BOOL complete, NSArray * _Nullable objects, NSError * _Nullable error) {
        if (completion) {
            completion(success, complete, objects, error);
        }
    }];
}

@end