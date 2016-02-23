//
// Created by Jason Rahaim on 1/29/15.
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKDataRequest.h"
#import "TSDKProcessBulkObjectProtocol.h"

@class TSDKEvent, TSDKMember, TSDKPlan, TSDKTeamPreferences, TSDKTeamResults;

@interface TSDKTeam : TSDKCollectionObject <TSDKProcessBulkObjectProtocol>

@property (nonatomic, assign) NSInteger canExportMedia; //Example: 1
@property (nonatomic, weak) NSString *leagueUrl; //Example:
@property (nonatomic, assign) BOOL isInLeague; //Example: 0
@property (nonatomic, assign) NSInteger hasReachedRosterLimit; //Example: 0
@property (nonatomic, weak) NSString *locationLatitude; //Example: 40.036037
@property (nonatomic, weak) NSDate *updatedAt; //Example: 2015-09-14T14:53:18Z
@property (nonatomic, assign) NSInteger hasExportableMedia; //Example: 1
@property (nonatomic, weak) NSString *timeZoneIanaName; //Example: America/Denver
@property (nonatomic, weak) NSString *locationPostalCode; //Example: 80302
@property (nonatomic, weak) NSString *name; //Example: TeamSnap
@property (nonatomic, weak) NSString *locationLongitude; //Example: -105.349559
@property (nonatomic, assign) NSInteger planId; //Example: 26
@property (nonatomic, weak) NSString *leagueName; //Example:
@property (nonatomic, assign) NSInteger rosterLimit; //Example: 4000
@property (nonatomic, weak) NSString *seasonName; //Example:
@property (nonatomic, weak) NSString *locationCountry; //Example: United States
@property (nonatomic, weak) NSString *divisionName; //Example:
@property (nonatomic, weak) NSDate *createdAt; //Example: 2012-05-27T03:32:51Z
@property (nonatomic, assign) BOOL isArchivedSeason; //Example: 0
@property (nonatomic, assign) NSInteger sportId; //Example: 52
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

// Non-Autogenerated properties/methods
@property (nonatomic, strong) NSDate *membersUpdated;
@property (nonatomic, strong) NSDate *eventsUpdated;

@property (weak, nonatomic) NSTimeZone *timeZone;
@property (weak, nonatomic) TSDKPlan *plan;

- (instancetype)initWithName:(NSString *)name locationCountry:(NSString *)locationCountry locationPostalCode:(NSString *)locationPostalCode ianaTimeZoneName:(NSString *)ianaTimeZoneName sportId:(NSInteger)sportId;
- (void)addEvent:(TSDKEvent *)event;
- (void)addMember:(TSDKMember *)member;
- (void)bulkLoadDataWithTypes:(NSArray *)dataTypes withCompletion:(TSDKArrayCompletionBlock)completion;
- (void)membersWithCompletion:(TSDKArrayCompletionBlock)completion;
- (void)allEventsWithCompletion:(TSDKArrayCompletionBlock)completion;
- (void)eventsInDateRange:(NSDate *)startDate endDate:(NSDate *)endDate completion:(TSDKArrayCompletionBlock)completion;

- (void)updateTimeZone:(NSTimeZone *)timeZone offsetEventTimes:(BOOL)offsetEventTimes withCompletion:(TSDKCompletionBlock)completion;

#if TARGET_OS_IPHONE
-(void)getTeamLogoWithCompletion:(TSDKImageCompletionBlock)completion;
#endif

@end

@interface TSDKTeam (ForwardedMethods)

-(void)getTeamMediaGroupsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getContactEmailAddressesWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getAvailabilitiesWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getForumTopicsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getMembersPreferencesWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getOwnerWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getDivisionMembersPreferencesWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getTeamMediumCommentsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getForumSubscriptionsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getEventsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getTeamPaypalPreferencesWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getForumPostsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getTeamMediaWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getSportWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getCalendarWebcalWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getContactsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getMembersCsvExportWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getTrackedItemStatusesWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getManagersWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getLeagueRegistrantDocumentsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getDivisionLocationsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getOpponentsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getCalendarHttpGamesOnlyWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getCustomDataWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getTeamPreferencesWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getCalendarHttpWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getDivisionTeamStandingsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getPaymentNotesWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getPlanWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getTeamFeesWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getMemberPhoneNumbersWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getMemberLinksWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getDivisionMembersWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getBroadcastEmailAttachmentsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getTeamStatisticsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getMemberEmailAddressesWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getStatisticsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getMembersWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getSponsorsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getMemberBalancesWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getBroadcastSmsesWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getMemberStatisticsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getStatisticGroupsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getOpponentsResultsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getPaypalCurrencyWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getTrackedItemsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getAssignmentsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getTeamResultsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getLeagueCustomDataWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getStatisticDataWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getContactPhoneNumbersWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getMemberFilesWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getMemberPaymentsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getLeagueCustomFieldsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getCustomFieldsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getLocationsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getBroadcastEmailsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getEventsCsvExportWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getCalendarWebcalGamesOnlyWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getTeamPublicSiteWithCompletion:(TSDKArrayCompletionBlock)completion;

@end