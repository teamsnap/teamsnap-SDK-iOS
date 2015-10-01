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
#import "NSMutableDictionary+integerKey.h"

@interface TSDKTeam()
@property (nonatomic, strong) NSMutableDictionary *members;
@property (nonatomic, strong) NSMutableDictionary *events;

@property (nonatomic, strong) NSMutableArray *sortedEvents;
@property (nonatomic, strong) NSMutableArray *sortedMembers;

@end

@implementation TSDKTeam {
    
}

@dynamic canExportMedia, leagueUrl, isInLeague, hasReachedRosterLimit, timeZoneOffset, locationLatitude, updatedAt, hasExportableMedia, timeZoneIanaName, locationPostalCode, name, locationLongitude, planId, leagueName, timeZoneDescription, rosterLimit, seasonName, locationCountry, divisionName, createdAt, isArchivedSeason, sportId, linkTeamMediaGroups, linkContactEmailAddresses, linkAvailabilities, linkForumTopics, linkMembersPreferences, linkOwner, linkDivisionMembersPreferences, linkTeamMediumComments, linkForumSubscriptions, linkEvents, linkTeamPaypalPreferences, linkForumPosts, linkTeamMedia, linkSport, linkCalendarWebcal, linkContacts, linkMembersCsvExport, linkTrackedItemStatuses, linkManagers, linkLeagueRegistrantDocuments, linkDivisionLocations, linkOpponents, linkCalendarHttpGamesOnly, linkCustomData, linkTeamPreferences, linkCalendarHttp, linkDivisionTeamStandings, linkPaymentNotes, linkPlan, linkTeamFees, linkMemberPhoneNumbers, linkMemberLinks, linkDivisionMembers, linkBroadcastEmailAttachments, linkTeamStatistics, linkMemberEmailAddresses, linkStatistics, linkMembers, linkSponsors, linkMemberBalances, linkBroadcastSmses, linkMemberStatistics, linkStatisticGroups, linkOpponentsResults, linkPaypalCurrency, linkTrackedItems, linkAssignments, linkTeamResults, linkLeagueCustomData, linkStatisticData, linkContactPhoneNumbers, linkMemberFiles, linkMemberPayments, linkLeagueCustomFields, linkCustomFields, linkLocations, linkBroadcastEmails, linkEventsCsvExport, linkCalendarWebcalGamesOnly, linkTeamPublicSite;

+ (NSString *)SDKType {
    return @"team";
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

- (void)setTimeZone:(NSTimeZone *)timeZone {
    [self setTimeZoneIanaName:timeZone.name];
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

- (void)processBulkLoadedObject:(TSDKCollectionObject *)bulkObject {
    if ([bulkObject isKindOfClass:[TSDKEvent class]]) {
        [self addEvent:(TSDKEvent *)bulkObject];
        self.eventsUpdated = [NSDate date];
    } else if ([bulkObject isKindOfClass:[TSDKMember class]]) {
        [self addMember:(TSDKMember *)bulkObject];
        self.membersUpdated = [NSDate date];
    } else if ([bulkObject isKindOfClass:[TSDKTeamPreferences class]]) {
        self.teamPrefrences = (TSDKTeamPreferences *)bulkObject;
    } else if ([bulkObject isKindOfClass:[TSDKTeamResults class]]) {
        self.teamResults = (TSDKTeamResults *)bulkObject;
    }
}

- (void)addEvent:(TSDKEvent *)event {
    [self.events setObject:event forIntegerKey:event.objectIdentifier];
    [self dirtySortedEventLists];
}

- (void)addMember:(TSDKMember *)member {
    [member setTeam:self];
    [self.members setObject:member forIntegerKey:member.objectIdentifier];
    [self dirtySortedMemberLists];
}

- (TSDKMember *)memberWithID:(NSInteger)memberId {
    return [self.members objectForIntegerKey:memberId];
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

- (void)bulkLoadImportantDataWithCompletion:(TSDKArrayCompletionBlock)completion {
    [[TSDKProfileTimer sharedInstance] startTimeWithId:@"BulkLoadTeam"];
    [TSDKObjectsRequest bulkLoadTeamData:self types:@[@"team", @"event", @"member", @"custom_field", @"custom_datum", @"league_custom_field", @"league_custom_datum",@"location", @"opponent", @"team_preferences", @"plan"] completion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
        [[TSDKProfileTimer sharedInstance] getElapsedTimeForId:@"BulkLoadTeam" logResult:YES];
        if (completion) {            
            completion(success, complete, objects, error);
        }
    }];
}


- (void)bulkLoadDataWithCompleteion:(TSDKArrayCompletionBlock)completion {
    [[TSDKProfileTimer sharedInstance] startTimeWithId:@"BulkLoadTeam"];
    [TSDKObjectsRequest bulkLoadTeamData:self types:@[@"team", @"team_results", @"event", @"member", @"assignment", @"broadcast_email", @"broadcast_sms", @"custom_field", @"custom_datum", @"league_custom_field", @"league_custom_datum", @"forum_topic", @"forum_post", @"location", @"opponent", @"team_fee", @"tracked_item", @"tracked_item_status", @"team_statistic",@"statistic", @"statistic_datum", @"statistic_group", @"sport",@"member_statistic", @"team_preferences", @"plan"] completion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
        [[TSDKProfileTimer sharedInstance] getElapsedTimeForId:@"BulkLoadTeam" logResult:YES];
        if (completion) {
            completion(success, complete, objects, error);
        }
    }];
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

- (void)encodeWithCoder:(NSCoder *)coder {
    [super encodeWithCoder:coder];
    //[coder encodeObject:_rosters forKey:@"rosterArray"];
    //[coder encodeObject:_events forKey:@"eventsArray"];
}

@end