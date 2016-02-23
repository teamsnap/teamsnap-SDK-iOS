//
// Created by Jason Rahaim on 1/29/15.
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCompletionBlockTypes.h"
#import "TSDKRequestConfiguration.h"
#import "TSDKCollectionObject.h"
#import "TSDKDataRequest.h"
#import "TSDKProcessBulkObjectProtocol.h"

@class TSDKEvent, TSDKMember, TSDKPlan, TSDKTeamPreferences, TSDKTeamResults;

@interface TSDKTeam : TSDKCollectionObject <TSDKProcessBulkObjectProtocol>

@property (nonatomic, assign) NSInteger sportId; //Example: 52
@property (nonatomic, weak) NSString *leagueUrl; //Example:
@property (nonatomic, assign) BOOL isInLeague; //Example: 0
@property (nonatomic, assign) BOOL hasReachedRosterLimit; //Example: 0
@property (nonatomic, assign) NSInteger canExportMedia; //Example: 1
@property (nonatomic, weak) NSString *timeZoneOffset; //Example: -07:00
@property (nonatomic, weak) NSString *locationLatitude; //Example: 40.036037
@property (nonatomic, weak) NSDate *updatedAt; //Example: 2016-02-22T21:26:59Z
@property (nonatomic, assign) BOOL hasExportableMedia; //Example: 1
@property (nonatomic, weak) NSDate *lastAccessedAt; //Example: 2016-02-22T21:32:04Z
@property (nonatomic, weak) NSString *timeZoneIanaName; //Example: America/Denver
@property (nonatomic, weak) NSString *locationPostalCode; //Example: 80302
@property (nonatomic, weak) NSString *name; //Example: TeamSnap
@property (nonatomic, weak) NSString *locationLongitude; //Example: -105.349559
@property (nonatomic, assign) NSInteger planId; //Example: 26
@property (nonatomic, weak) NSString *leagueName; //Example:
@property (nonatomic, weak) NSString *timeZoneDescription; //Example: Mountain Time (US & Canada)
@property (nonatomic, assign) NSInteger rosterLimit; //Example: 4000
@property (nonatomic, weak) NSString *seasonName; //Example:
@property (nonatomic, weak) NSString *locationCountry; //Example: United States
@property (nonatomic, assign) NSInteger mediaStorageUsed; //Example: 130056353
@property (nonatomic, weak) NSString *divisionName; //Example:
@property (nonatomic, weak) NSString *humanizedMediaStorageUsed; //Example: 124.03 MB
@property (nonatomic, weak) NSDate *createdAt; //Example: 2012-05-27T03:32:51Z
@property (nonatomic, assign) BOOL isArchivedSeason; //Example: 0
@property (nonatomic, assign) BOOL isRetired; //Example: 0
@property (nonatomic, weak) NSURL *linkTeamMediaGroups;
@property (nonatomic, weak) NSURL *linkContactEmailAddresses;
@property (nonatomic, weak) NSURL *linkDivisionContactEmailAddresses;
@property (nonatomic, weak) NSURL *linkMembersPreferences;
@property (nonatomic, weak) NSURL *linkAvailabilities;
@property (nonatomic, weak) NSURL *linkForumTopics;
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
@property (nonatomic, weak) NSURL *linkDivisionContacts;
@property (nonatomic, weak) NSURL *linkManagers;
@property (nonatomic, weak) NSURL *linkLeagueRegistrantDocuments;
@property (nonatomic, weak) NSURL *linkStatisticAggregates;
@property (nonatomic, weak) NSURL *linkDivisionLocations;
@property (nonatomic, weak) NSURL *linkOpponents;
@property (nonatomic, weak) NSURL *linkCalendarHttpGamesOnly;
@property (nonatomic, weak) NSURL *linkCustomData;
@property (nonatomic, weak) NSURL *linkDivisionContactPhoneNumbers;
@property (nonatomic, weak) NSURL *linkTeamPreferences;
@property (nonatomic, weak) NSURL *linkCalendarHttp;
@property (nonatomic, weak) NSURL *linkDivisionTeamStandings;
@property (nonatomic, weak) NSURL *linkPaymentNotes;
@property (nonatomic, weak) NSURL *linkPlan;
@property (nonatomic, weak) NSURL *linkTeamFees;
@property (nonatomic, weak) NSURL *linkEventsOverview;
@property (nonatomic, weak) NSURL *linkMemberPhoneNumbers;
@property (nonatomic, weak) NSURL *linkMemberLinks;
@property (nonatomic, weak) NSURL *linkDivisionMembers;
@property (nonatomic, weak) NSURL *linkBroadcastEmailAttachments;
@property (nonatomic, weak) NSURL *linkTeamStatistics;
@property (nonatomic, weak) NSURL *linkMemberEmailAddresses;
@property (nonatomic, weak) NSURL *linkMembers;
@property (nonatomic, weak) NSURL *linkStatistics;
@property (nonatomic, weak) NSURL *linkSponsors;
@property (nonatomic, weak) NSURL *linkMemberBalances;
@property (nonatomic, weak) NSURL *linkStatisticGroups;
@property (nonatomic, weak) NSURL *linkMemberStatistics;
@property (nonatomic, weak) NSURL *linkOpponentsResults;
@property (nonatomic, weak) NSURL *linkPaypalCurrency;
@property (nonatomic, weak) NSURL *linkTrackedItems;
@property (nonatomic, weak) NSURL *linkAssignments;
@property (nonatomic, weak) NSURL *linkTeamResults;
@property (nonatomic, weak) NSURL *linkLeagueCustomData;
@property (nonatomic, weak) NSURL *linkContactPhoneNumbers;
@property (nonatomic, weak) NSURL *linkMemberFiles;
@property (nonatomic, weak) NSURL *linkDivisionMemberPhoneNumbers;
@property (nonatomic, weak) NSURL *linkMemberPayments;
@property (nonatomic, weak) NSURL *linkStatisticData;
@property (nonatomic, weak) NSURL *linkDivisionMemberEmailAddresses;
@property (nonatomic, weak) NSURL *linkLeagueCustomFields;
@property (nonatomic, weak) NSURL *linkCustomFields;
@property (nonatomic, weak) NSURL *linkLocations;
@property (nonatomic, weak) NSURL *linkBroadcastEmails;
@property (nonatomic, weak) NSURL *linkEventsCsvExport;
@property (nonatomic, weak) NSURL *linkCalendarWebcalGamesOnly;
@property (nonatomic, weak) NSURL *linkEventStatistics;
@property (nonatomic, weak) NSURL *linkTeamPublicSite;
@property (nonatomic, weak) NSURL *linkBroadcastAlerts;


// Non-Autogenerated properties/methods
@property (nonatomic, strong) NSDate *membersUpdated;
@property (nonatomic, strong) NSDate *eventsUpdated;

@property (weak, nonatomic) NSTimeZone *timeZone;
@property (weak, nonatomic) TSDKPlan *plan;

- (instancetype)initWithName:(NSString *)name locationCountry:(NSString *)locationCountry locationPostalCode:(NSString *)locationPostalCode ianaTimeZoneName:(NSString *)ianaTimeZoneName sportId:(NSInteger)sportId;
- (void)addEvent:(TSDKEvent *)event;
- (void)addMember:(TSDKMember *)member;
- (void)bulkLoadDataWithTypes:(NSArray *)dataTypes withCompletion:(TSDKArrayCompletionBlock)completion;

- (void)getEventsInDateRange:(NSDate *)startDate endDate:(NSDate *)endDate withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKEventArrayCompletionBlock)completion;

- (void)updateTimeZone:(NSTimeZone *)timeZone offsetEventTimes:(BOOL)offsetEventTimes withCompletion:(TSDKCompletionBlock)completion;

#if TARGET_OS_IPHONE
-(void)getTeamLogoWithCompletion:(TSDKImageCompletionBlock)completion;
#endif

@end

@interface TSDKTeam (ForwardedMethods)

-(void)getTeamMediaGroupsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getContactEmailAddressesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKContactEmailAddressArrayCompletionBlock)completion;
-(void)getDivisionContactEmailAddressesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getMembersPreferencesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getAvailabilitiesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKAvailabilityArrayCompletionBlock)completion;
-(void)getForumTopicsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKForumTopicArrayCompletionBlock)completion;
-(void)getOwnerWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getDivisionMembersPreferencesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getTeamMediumCommentsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getForumSubscriptionsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getEventsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKEventArrayCompletionBlock)completion;
-(void)getTeamPaypalPreferencesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getForumPostsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKForumPostArrayCompletionBlock)completion;
-(void)getTeamMediaWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getSportWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKSportArrayCompletionBlock)completion;
-(void)getCalendarWebcalWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getContactsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKContactArrayCompletionBlock)completion;
-(void)getMembersCsvExportWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getTrackedItemStatusesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTrackedItemStatusArrayCompletionBlock)completion;
-(void)getDivisionContactsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getManagersWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getLeagueRegistrantDocumentsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getStatisticAggregatesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getDivisionLocationsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getOpponentsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKOpponentArrayCompletionBlock)completion;
-(void)getCalendarHttpGamesOnlyWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getCustomDataWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKCustomDatumArrayCompletionBlock)completion;
-(void)getDivisionContactPhoneNumbersWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getTeamPreferencesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamPreferencesArrayCompletionBlock)completion;
-(void)getCalendarHttpWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getDivisionTeamStandingsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getPaymentNotesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getPlanWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKPlanArrayCompletionBlock)completion;
-(void)getTeamFeesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamFeeArrayCompletionBlock)completion;
-(void)getEventsOverviewWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getMemberPhoneNumbersWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberPhoneNumberArrayCompletionBlock)completion;
-(void)getMemberLinksWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getDivisionMembersWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getBroadcastEmailAttachmentsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getTeamStatisticsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamStatisticArrayCompletionBlock)completion;
-(void)getMemberEmailAddressesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberEmailAddressArrayCompletionBlock)completion;
-(void)getMembersWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberArrayCompletionBlock)completion;
-(void)getStatisticsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKStatisticArrayCompletionBlock)completion;
-(void)getSponsorsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getMemberBalancesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getStatisticGroupsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKStatisticGroupArrayCompletionBlock)completion;
-(void)getMemberStatisticsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberStatisticArrayCompletionBlock)completion;
-(void)getOpponentsResultsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getPaypalCurrencyWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getTrackedItemsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTrackedItemArrayCompletionBlock)completion;
-(void)getAssignmentsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKAssignmentArrayCompletionBlock)completion;
-(void)getTeamResultsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamResultsArrayCompletionBlock)completion;
-(void)getLeagueCustomDataWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getContactPhoneNumbersWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKContactPhoneNumberArrayCompletionBlock)completion;
-(void)getMemberFilesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getDivisionMemberPhoneNumbersWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getMemberPaymentsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getStatisticDataWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKStatisticDatumArrayCompletionBlock)completion;
-(void)getDivisionMemberEmailAddressesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getLeagueCustomFieldsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getCustomFieldsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKCustomFieldArrayCompletionBlock)completion;
-(void)getLocationsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKLocationArrayCompletionBlock)completion;
-(void)getBroadcastEmailsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKBroadcastEmailArrayCompletionBlock)completion;
-(void)getEventsCsvExportWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getCalendarWebcalGamesOnlyWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getEventStatisticsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getTeamPublicSiteWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getBroadcastAlertsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;

@end