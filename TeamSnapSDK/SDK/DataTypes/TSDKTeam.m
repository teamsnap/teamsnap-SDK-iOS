//
// Created by Jason Rahaim on 1/29/15.
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKTeam.h"
#import "TSDKObjectsRequest.h"
#import "TSDKProfileTimer.h"
#import "TSDKEvent.h"
#import "TSDKMember.h"
#import "TSDKTeamSnap.h"
#import "TSDKPlan.h"
#import "TSDKTeamResults.h"
#import "TSDKTeamPreferences.h"
#import "TSDKLocation.h"
#import "TSDKOpponent.h"
#import "TSDKCustomField.h"
#import "TSDKCustomDatum.h"
#import "TSDKUser.h"

#import "NSMutableDictionary+integerKey.h"
#import "NSMutableDictionary+refreshCollectionData.h"

@interface TSDKTeam()
@property (nonatomic, strong) NSMutableDictionary *members;
@property (nonatomic, strong) NSMutableDictionary *events;

@property (nonatomic, strong) NSMutableArray *sortedEvents;
@property (nonatomic, strong) NSMutableArray *sortedMembers;

@property (strong, nonatomic) TSDKTeamPreferences *teamPrefrences;
@property (strong, nonatomic) TSDKTeamResults *teamResults;

@end

@implementation TSDKTeam {
    
}

@dynamic canExportMedia, leagueUrl, isInLeague, hasReachedRosterLimit, locationLatitude, updatedAt, hasExportableMedia, timeZoneIanaName, locationPostalCode, name, locationLongitude, planId, leagueName, rosterLimit, seasonName, locationCountry, divisionName, createdAt, isArchivedSeason, sportId, linkTeamMediaGroups, linkContactEmailAddresses, linkAvailabilities, linkForumTopics, linkMembersPreferences, linkOwner, linkDivisionMembersPreferences, linkTeamMediumComments, linkForumSubscriptions, linkEvents, linkTeamPaypalPreferences, linkForumPosts, linkTeamMedia, linkSport, linkCalendarWebcal, linkContacts, linkMembersCsvExport, linkTrackedItemStatuses, linkManagers, linkLeagueRegistrantDocuments, linkDivisionLocations, linkOpponents, linkCalendarHttpGamesOnly, linkCustomData, linkTeamPreferences, linkCalendarHttp, linkDivisionTeamStandings, linkPaymentNotes, linkPlan, linkTeamFees, linkMemberPhoneNumbers, linkMemberLinks, linkDivisionMembers, linkBroadcastEmailAttachments, linkTeamStatistics, linkMemberEmailAddresses, linkStatistics, linkMembers, linkSponsors, linkMemberBalances, linkBroadcastSmses, linkMemberStatistics, linkStatisticGroups, linkOpponentsResults, linkPaypalCurrency, linkTrackedItems, linkAssignments, linkTeamResults, linkLeagueCustomData, linkStatisticData, linkContactPhoneNumbers, linkMemberFiles, linkMemberPayments, linkLeagueCustomFields, linkCustomFields, linkLocations, linkBroadcastEmails, linkEventsCsvExport, linkCalendarWebcalGamesOnly, linkTeamPublicSite;

+ (NSString *)SDKType {
    return @"team";
}

+(void)actionUpdateTimeZone:(NSTimeZone *)timeZone offsetEventTimes:(BOOL)offsetEventTimes forTeam:(TSDKTeam *)team withCompletion:(TSDKCompletionBlock)completion {
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

- (void)updateTimeZone:(NSTimeZone *)timeZone offsetEventTimes:(BOOL)offsetEventTimes withCompletion:(TSDKCompletionBlock)completion {
    [self setTimeZone:timeZone];
    [TSDKTeam actionUpdateTimeZone:timeZone offsetEventTimes:offsetEventTimes forTeam:self withCompletion:completion];
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

- (void)saveWithCompletion:(TSDKCompletionBlock)completionBlock {
    BOOL isNewTeam = self.isNewObject;
    
    [super saveWithCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
        if (isNewTeam) {
            if (success) {
                TSDKCollectionJSON *saveTeamResultCollectionJSON = objects;
                [[[TSDKTeamSnap sharedInstance] teamSnapUser] getPersonasWithCompletion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
                    if (completionBlock) {
                        completionBlock(success, complete, saveTeamResultCollectionJSON, error);
                    }
                }];
            } else {
                if (completionBlock) {
                    completionBlock(success, complete, objects, error);
                }
            }
        } else {
            if (completionBlock) {
                completionBlock(success, complete, objects, error);
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
    [self.changedValues addObject:@"time_zone"];
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

- (void)getTeamPreferencesWithCompletion:(TSDKArrayCompletionBlock)completion {
    [super arrayFromLink:[self linkTeamPreferences] WithCompletion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
        if (success && objects.count>=1) {
            [self processBulkLoadedObject:[objects objectAtIndex:0]];
        }
        if (completion) {
            completion(success, YES, objects, error);
        }
    }];
}

- (void)getTeamResultsWithCompletion:(TSDKArrayCompletionBlock)completion {
    [super arrayFromLink:[self linkTeamResults] WithCompletion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
        if (success && objects.count>=1) {
            [self processBulkLoadedObject:[objects objectAtIndex:0]];
        }
        if (completion) {
            completion(success, YES, objects, error);
        }
    }];
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
        DLog(@"\nProcess Team Preferences: %@ (%ld)", self.name, (long)self.objectIdentifier);
        if (self.teamPrefrences) {
            [self.teamPrefrences setCollection:bulkObject.collection];
        } else {
            self.teamPrefrences = (TSDKTeamPreferences *)bulkObject;
        }
        lProcessed = YES;
    } else if ([bulkObject isKindOfClass:[TSDKTeamResults class]]) {
        if (self.teamResults) {
            [self.teamResults setCollection:bulkObject.collection];
        } else {
            self.teamResults = (TSDKTeamResults *)bulkObject;
        }
        lProcessed = YES;
    }
    if (!lProcessed && [bulkObject.collection.data objectForKey:@"member_id"]) {
        NSInteger memberId = [[bulkObject.collection.data objectForKey:@"member_id"] integerValue];
        TSDKMember *member = [self memberWithID:memberId];
        if (member) {
            lProcessed = [member processBulkLoadedObject:(TSDKCollectionObject *)bulkObject];
        }
    }
    return lProcessed;
}

- (void)addEvent:(TSDKEvent *)event {
    [self.events refreshCollectionObject:event];
    [self dirtySortedEventLists];
}

- (void)addMember:(TSDKMember *)member {
    [self.members refreshCollectionObject:member];
    [self dirtySortedMemberLists];
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

- (void)bulkLoadDataWithTypes:(NSArray *)dataTypes withCompletion:(TSDKArrayCompletionBlock)completion {
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

- (void)membersWithCompletion:(TSDKArrayCompletionBlock)completion {
    if (self.membersUpdated && self.sortedMembers) {
        if (completion) {
            completion(YES, YES, self.sortedMembers, nil);
        }
    } else {
        [TSDKObjectsRequest listRosterForTeam:self completion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
            [self.members removeAllObjects];
            for (TSDKMember *member in objects) {
                [self.members setObject:member forIntegerKey:member.objectIdentifier];
            }
            self.membersUpdated = [NSDate date];
            if (completion) {
                completion(success, complete, self.sortedMembers, error);
            }
        }];
    }
}

- (void)allEventsWithCompletion:(TSDKArrayCompletionBlock)completion {
    if (self.eventsUpdated) {
        if (completion) {
            completion(YES, YES, self.eventsSorted, nil);
        }
    } else {
        [TSDKObjectsRequest listEventsForTeam:self completion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
            if (completion) {
                completion(success, complete, objects, error);
            }
        }];
    }
}

- (void)eventsInDateRange:(NSDate *)startDate endDate:(NSDate *)endDate completion:(TSDKArrayCompletionBlock)completion {
    [TSDKObjectsRequest listEventsForTeam:self startDate:(NSDate *)startDate endDate:(NSDate *)endDate completion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
        if (completion) {
            completion(success, complete, objects, error);
        }
    }];
}

- (void)trackedItems:(TSDKArrayCompletionBlock)completion {
    [TSDKObjectsRequest listTrackedItemsForTeam:self completion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
        if (completion) {
            completion(success, complete, objects, error);
        }
    }];
    
}

#if TARGET_OS_IPHONE
-(void)getTeamLogoWithCompletion:(TSDKImageCompletionBlock)completion {
    if ([self.teamPrefrences linkTeamLogo]) {
        [self.teamPrefrences getTeamLogoWithCompletion:completion];
    } else {
        [self getTeamPreferencesWithCompletion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
            
        }];
        if (completion) {
            completion(nil);
        }
    }
}
#endif

- (void)encodeWithCoder:(NSCoder *)coder {
    [super encodeWithCoder:coder];
    //[coder encodeObject:_rosters forKey:@"rosterArray"];
    //[coder encodeObject:_events forKey:@"eventsArray"];
}

@end