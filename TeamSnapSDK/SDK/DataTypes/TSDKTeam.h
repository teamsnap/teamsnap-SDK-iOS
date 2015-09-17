//
// Created by Jason Rahaim on 1/29/15.
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKDataRequest.h"

@class TSDKEvent, TSDKMember;

@interface TSDKTeam : TSDKCollectionObject

@property (nonatomic) NSInteger canExportMedia; //Example: 1
@property (nonatomic, weak) NSString *leagueUrl; //Example:
@property (nonatomic) BOOL isInLeague; //Example: 0
@property (nonatomic) NSInteger hasReachedRosterLimit; //Example: 0
@property (nonatomic, weak) NSString *timeZoneOffset; //Example: -07:00
@property (nonatomic, weak) NSString *locationLatitude; //Example: 40.036037
@property (nonatomic, weak) NSDate *updatedAt; //Example: 2015-09-14T14:53:18Z
@property (nonatomic) NSInteger hasExportableMedia; //Example: 1
@property (nonatomic, weak) NSString *timeZoneIanaName; //Example: America/Denver
@property (nonatomic, weak) NSString *locationPostalCode; //Example: 80302
@property (nonatomic, weak) NSString *name; //Example: TeamSnap
@property (nonatomic, weak) NSString *locationLongitude; //Example: -105.349559
@property (nonatomic) NSInteger planId; //Example: 26
@property (nonatomic, weak) NSString *leagueName; //Example:
@property (nonatomic, weak) NSString *timeZoneDescription; //Example: Mountain Time (US & Canada)
@property (nonatomic) NSInteger rosterLimit; //Example: 4000
@property (nonatomic, weak) NSString *seasonName; //Example:
@property (nonatomic, weak) NSString *locationCountry; //Example: United States
@property (nonatomic, weak) NSString *divisionName; //Example:
@property (nonatomic, weak) NSDate *createdAt; //Example: 2012-05-27T03:32:51Z
@property (nonatomic) BOOL isArchivedSeason; //Example: 0
@property (nonatomic) NSInteger sportId; //Example: 52
@property (nonatomic, weak) NSURL *linkTeamMediaGroups;
@property (nonatomic, weak) NSURL *linkContactEmailAddresses;
@property (nonatomic, weak) NSURL *linkAvailabilities;
@property (nonatomic, weak) NSURL *linkForumTopics;
@property (nonatomic, weak) NSURL *linkMembersPreferences;
@property (nonatomic, weak) NSURL *linkOwner;
@property (nonatomic, weak) NSURL *linkDivisionMembersPreferences;
@property (nonatomic, weak) NSURL *linkTeamMediumComments;
@property (nonatomic, weak) NSURL *linkForumSubscriptions;
@property (nonatomic, weak) NSURL *linkEvents;
@property (nonatomic, weak) NSURL *linkTeamPaypalPreferences;
@property (nonatomic, weak) NSURL *linkForumPosts;
@property (nonatomic, weak) NSURL *linkTeamMedia;
@property (nonatomic, weak) NSURL *linkSport;
@property (nonatomic, weak) NSURL *linkCalendarWebcal;
@property (nonatomic, weak) NSURL *linkContacts;
@property (nonatomic, weak) NSURL *linkMembersCsvExport;
@property (nonatomic, weak) NSURL *linkTrackedItemStatuses;
@property (nonatomic, weak) NSURL *linkManagers;
@property (nonatomic, weak) NSURL *linkLeagueRegistrantDocuments;
@property (nonatomic, weak) NSURL *linkDivisionLocations;
@property (nonatomic, weak) NSURL *linkOpponents;
@property (nonatomic, weak) NSURL *linkCalendarHttpGamesOnly;
@property (nonatomic, weak) NSURL *linkCustomData;
@property (nonatomic, weak) NSURL *linkTeamPreferences;
@property (nonatomic, weak) NSURL *linkCalendarHttp;
@property (nonatomic, weak) NSURL *linkDivisionTeamStandings;
@property (nonatomic, weak) NSURL *linkPaymentNotes;
@property (nonatomic, weak) NSURL *linkPlan;
@property (nonatomic, weak) NSURL *linkTeamFees;
@property (nonatomic, weak) NSURL *linkMemberPhoneNumbers;
@property (nonatomic, weak) NSURL *linkMemberLinks;
@property (nonatomic, weak) NSURL *linkDivisionMembers;
@property (nonatomic, weak) NSURL *linkBroadcastEmailAttachments;
@property (nonatomic, weak) NSURL *linkTeamStatistics;
@property (nonatomic, weak) NSURL *linkMemberEmailAddresses;
@property (nonatomic, weak) NSURL *linkStatistics;
@property (nonatomic, weak) NSURL *linkMembers;
@property (nonatomic, weak) NSURL *linkSponsors;
@property (nonatomic, weak) NSURL *linkMemberBalances;
@property (nonatomic, weak) NSURL *linkBroadcastSmses;
@property (nonatomic, weak) NSURL *linkMemberStatistics;
@property (nonatomic, weak) NSURL *linkStatisticGroups;
@property (nonatomic, weak) NSURL *linkOpponentsResults;
@property (nonatomic, weak) NSURL *linkPaypalCurrency;
@property (nonatomic, weak) NSURL *linkTrackedItems;
@property (nonatomic, weak) NSURL *linkAssignments;
@property (nonatomic, weak) NSURL *linkTeamResults;
@property (nonatomic, weak) NSURL *linkLeagueCustomData;
@property (nonatomic, weak) NSURL *linkStatisticData;
@property (nonatomic, weak) NSURL *linkContactPhoneNumbers;
@property (nonatomic, weak) NSURL *linkMemberFiles;
@property (nonatomic, weak) NSURL *linkMemberPayments;
@property (nonatomic, weak) NSURL *linkLeagueCustomFields;
@property (nonatomic, weak) NSURL *linkCustomFields;
@property (nonatomic, weak) NSURL *linkLocations;
@property (nonatomic, weak) NSURL *linkBroadcastEmails;
@property (nonatomic, weak) NSURL *linkEventsCsvExport;
@property (nonatomic, weak) NSURL *linkCalendarWebcalGamesOnly;
@property (nonatomic, weak) NSURL *linkTeamPublicSite;

@property (nonatomic, strong) NSDate *membersUpdated;
@property (nonatomic, strong) NSDate *eventsUpdated;

- (void)addEvent:(TSDKEvent *)event;
- (void)addMember:(TSDKMember *)member;
- (void)bulkLoadImportantDataWithCompletion:(TSDKArrayCompletionBlock)completion;
- (void)bulkLoadDataWithCompleteion:(TSDKArrayCompletionBlock)completion;
- (void)membersWithCompletion:(TSDKArrayCompletionBlock)completion;
- (void)allEventsWithCompletion:(TSDKArrayCompletionBlock)completion;
- (void)eventsInDateRange:(NSDate *)startDate endDate:(NSDate *)endDate completion:(TSDKArrayCompletionBlock)completion;

- (void)trackedItems:(TSDKArrayCompletionBlock)completion;

@end