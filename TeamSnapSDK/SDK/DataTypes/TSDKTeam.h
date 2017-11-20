//
// Created by Jason Rahaim on 1/29/15.
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCompletionBlockTypes.h"
#import "TSDKRequestConfiguration.h"
#import "TSDKCollectionObject.h"
#import "TSDKDataRequest.h"
#import "TSDKMessage.h"
#import "TSDKMember.h"

@class TSDKEvent, TSDKMember, TSDKPlan, TSDKTeamPreferences, TSDKTeamResults;

@interface TSDKTeam : TSDKCollectionObject <NSCopying>

@property (nonatomic, weak) NSString *_Nullable sportId; //Example: 52
@property (nonatomic, weak) NSString *_Nullable leagueUrl; //Example:
@property (nonatomic, assign) BOOL isInLeague; //Example: 0
@property (nonatomic, assign) BOOL hasReachedRosterLimit; //Example: 0
@property (nonatomic, assign) NSInteger canExportMedia; //Example: 1
@property (nonatomic, weak) NSString *_Nullable timeZoneOffset; //Example: -07:00
@property (nonatomic, weak) NSString *_Nullable locationLatitude; //Example: 40.036037
@property (nonatomic, weak) NSDate *_Nullable updatedAt; //Example: 2016-02-22T21:26:59Z
@property (nonatomic, assign) BOOL hasExportableMedia; //Example: 1
@property (nonatomic, weak) NSDate *_Nullable lastAccessedAt; //Example: 2016-02-22T21:32:04Z
@property (nonatomic, weak) NSString *_Nullable timeZoneIanaName; //Example: America/Denver
@property (nonatomic, assign) NSInteger nonPlayerMemberCount; //Example: 0
@property (nonatomic, weak) NSString *_Nullable locationPostalCode; //Example: 80302
@property (nonatomic, weak) NSString *_Nullable locationState; //Example: 80302
@property (nonatomic, weak) NSString *_Nullable name; //Example: TeamSnap
@property (nonatomic, weak) NSString *_Nullable locationLongitude; //Example: -105.349559
@property (nonatomic, assign) NSInteger playerMemberCount; //Example: 4
@property (nonatomic, weak) NSString *_Nullable planId; //Example: 26
@property (nonatomic, weak) NSString *_Nullable leagueName; //Example:
@property (nonatomic, weak) NSString *_Nullable timeZoneDescription; //Example: Mountain Time (US & Canada)
@property (nonatomic, assign) NSInteger rosterLimit; //Example: 4000
@property (nonatomic, weak) NSString *_Nullable seasonName; //Example:
@property (nonatomic, weak) NSString *_Nullable locationCountry; //Example: United States
@property (nonatomic, assign) NSInteger mediaStorageUsed; //Example: 130056353
@property (nonatomic, weak) NSString *_Nullable divisionName; //Example:
@property (nonatomic, weak) NSString *_Nullable divisionId; //Example: 60366
@property (nonatomic, weak) NSString *_Nullable humanizedMediaStorageUsed; //Example: 124.03 MB
@property (nonatomic, weak) NSDate *_Nullable billedAt; //Example: 2013-09-20T00:00:00.000+00:00
@property (nonatomic, weak) NSDate *_Nullable createdAt; //Example: 2012-05-27T03:32:51Z
@property (nonatomic, assign) BOOL isArchivedSeason; //Example: 0
@property (nonatomic, assign) BOOL isRetired; //Example: 0
@property (nonatomic, assign) BOOL isHiddenOnDashboard;
@property (nonatomic, assign) BOOL isGameDay;
@property (nonatomic, weak) NSURL *_Nullable linkTeamMediaGroups;
@property (nonatomic, weak) NSURL *_Nullable linkContactEmailAddresses;
@property (nonatomic, weak) NSURL *_Nullable linkDivisionContactEmailAddresses;
@property (nonatomic, weak) NSURL *_Nullable linkMembersPreferences;
@property (nonatomic, weak) NSURL *_Nullable linkAvailabilities;
@property (nonatomic, weak) NSURL *_Nullable linkAdvertisements;
@property (nonatomic, weak) NSURL *_Nullable linkForumTopics;
@property (nonatomic, weak) NSURL *_Nullable linkOwner;
@property (nonatomic, weak) NSURL *_Nullable linkDivisionMembersPreferences;
@property (nonatomic, weak) NSURL *_Nullable linkTeamMediumComments;
@property (nonatomic, weak) NSURL *_Nullable linkForumSubscriptions;
@property (nonatomic, weak) NSURL *_Nullable linkEvents;
@property (nonatomic, weak) NSURL *_Nullable linkTeamPaypalPreferences;
@property (nonatomic, weak) NSURL *_Nullable linkForumPosts;
@property (nonatomic, weak) NSURL *_Nullable linkTeamMedia;
@property (nonatomic, weak) NSURL *_Nullable linkSport;
@property (nonatomic, weak) NSURL *_Nullable linkContacts;
@property (nonatomic, weak) NSURL *_Nullable linkTrackedItemStatuses;
@property (nonatomic, weak) NSURL *_Nullable linkDivisionContacts;
@property (nonatomic, weak) NSURL *_Nullable linkManagers;
@property (nonatomic, weak) NSURL *_Nullable linkLeagueRegistrantDocuments;
@property (nonatomic, weak) NSURL *_Nullable linkStatisticAggregates;
@property (nonatomic, weak) NSURL *_Nullable linkDivisionLocations;
@property (nonatomic, weak) NSURL *_Nullable linkOpponents;
@property (nonatomic, weak) NSURL *_Nullable linkCustomData;
@property (nonatomic, weak) NSURL *_Nullable linkDivisionContactPhoneNumbers;
@property (nonatomic, weak) NSURL *_Nullable linkTeamPreferences;
@property (nonatomic, weak) NSURL *_Nullable linkDivisionTeamStandings;
@property (nonatomic, weak) NSURL *_Nullable linkPaymentNotes;
@property (nonatomic, weak) NSURL *_Nullable linkPlan;
@property (nonatomic, weak) NSURL *_Nullable linkTeamFees;
@property (nonatomic, weak) NSURL *_Nullable linkEventsOverview;
@property (nonatomic, weak) NSURL *_Nullable linkMemberPhoneNumbers;
@property (nonatomic, weak) NSURL *_Nullable linkMemberLinks;
@property (nonatomic, weak) NSURL *_Nullable linkDivisionMembers;
@property (nonatomic, weak) NSURL *_Nullable linkBroadcastEmailAttachments;
@property (nonatomic, weak) NSURL *_Nullable linkTeamStatistics;
@property (nonatomic, weak) NSURL *_Nullable linkMemberEmailAddresses;
@property (nonatomic, weak) NSURL *_Nullable linkMembers;
@property (nonatomic, weak) NSURL *_Nullable linkStatistics;
@property (nonatomic, weak) NSURL *_Nullable linkSponsors;
@property (nonatomic, weak) NSURL *_Nullable linkMemberBalances;
@property (nonatomic, weak) NSURL *_Nullable linkStatisticGroups;
@property (nonatomic, weak) NSURL *_Nullable linkMemberStatistics;
@property (nonatomic, weak) NSURL *_Nullable linkOpponentsResults;
@property (nonatomic, weak) NSURL *_Nullable linkPaypalCurrency;
@property (nonatomic, weak) NSURL *_Nullable linkTrackedItems;
@property (nonatomic, weak) NSURL *_Nullable linkAssignments;
@property (nonatomic, weak) NSURL *_Nullable linkTeamResults;
@property (nonatomic, weak) NSURL *_Nullable linkLeagueCustomData;
@property (nonatomic, weak) NSURL *_Nullable linkContactPhoneNumbers;
@property (nonatomic, weak) NSURL *_Nullable linkMessageData;
@property (nonatomic, weak) NSURL *_Nullable linkMemberFiles;
@property (nonatomic, weak) NSURL *_Nullable linkMemberPayments;
@property (nonatomic, weak) NSURL *_Nullable linkDivisionMemberPhoneNumbers;
@property (nonatomic, weak) NSURL *_Nullable linkDivisionMemberEmailAddresses;
@property (nonatomic, weak) NSURL *_Nullable linkLeagueCustomFields;
@property (nonatomic, weak) NSURL *_Nullable linkMessages;
@property (nonatomic, weak) NSURL *_Nullable linkLocations;
@property (nonatomic, weak) NSURL *_Nullable linkCustomFields;
@property (nonatomic, weak) NSURL *_Nullable linkStatisticData;
@property (nonatomic, weak) NSURL *_Nullable linkBroadcastEmails;
@property (nonatomic, weak) NSURL *_Nullable linkEventsCsvExport;
@property (nonatomic, weak) NSURL *_Nullable linkEventStatistics;
@property (nonatomic, weak) NSURL *_Nullable linkBroadcastAlerts;
@property (nonatomic, weak) NSURL *_Nullable linkTeamPublicSite;
@property (nonatomic, weak) NSURL *_Nullable linkMemberPhotos;
@property (nonatomic, weak) NSURL *_Nullable linkTeamPhotos;
@property (nonatomic, weak) NSURL *_Nullable linkTeamPhotoFile;
@property (nonatomic, weak) NSURL *_Nullable linkTeamLogoPhotoFile;
@property (nonatomic, weak) NSURL *_Nullable linkTeamStore;

- (void)setTimeZone:(NSTimeZone *_Nonnull)timeZone;
- (NSTimeZone *_Nullable)timeZone;

// Non Collection links:
@property (nonatomic, weak) NSURL *_Nullable linkCalendarHttpGamesOnly;
@property (nonatomic, weak) NSURL *_Nullable linkCalendarHttp;
@property (nonatomic, weak) NSURL *_Nullable linkCalendarWebcal;
@property (nonatomic, weak) NSURL *_Nullable linkCalendarWebcalGamesOnly;
@property (nonatomic, weak) NSURL *_Nullable linkMembersCsvExport;

- (instancetype _Nullable)initWithName:(NSString *_Nonnull)name locationCountry:(NSString *_Nonnull)locationCountry locationPostalCode:(NSString *_Nullable)locationPostalCode ianaTimeZoneName:(NSString *_Nonnull)ianaTimeZoneName sportId:(NSString *_Nonnull)sportId;
- (void)bulkLoadDataWithTypes:(NSArray *_Nonnull)dataTypes withConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;

- (void)getEventsInDateRange:(NSDate *_Nullable)startDate endDate:(NSDate *_Nullable)endDate withConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKEventArrayCompletionBlock _Nullable)completion;
- (void)getEventWithId:(NSString *_Nonnull)eventId withConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKEventArrayCompletionBlock _Nullable)completion;

- (void)updateTimeZone:(NSTimeZone *_Nonnull)timeZone offsetEventTimes:(BOOL)offsetEventTimes withConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKCompletionBlock _Nullable)completion;
- (void)getMessagesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration type:(TSDKMessageType)type completion:(TSDKMessagesArrayCompletionBlock _Nullable)completion;


/**
 Deprecated: This endpoint will be removed in a future release. Use the invite link from contact_email_address instead.

 @param membersOrContacts The Members or Contacts to invite
 @param teamId The Team to invite to
 @param asMemberId The Member to send the invite as
 @param completion Called when the action is completed
 */
+ (void)actionInviteMembersOrContacts:(NSArray <TSDKCollectionObject<TSDKMemberOrContactProtocol> *> *_Nonnull)membersOrContacts teamId:(NSString *_Nonnull)teamId asMemberId:(NSString *_Nonnull)asMemberId completion:(TSDKSimpleCompletionBlock _Nullable)completion;


/**
 Deprecated: This endpoint will be removed in a future release. Use the invite link from contact_email_address instead.

 @param membersOrContacts The Members or Contacts to invite
 @param asMemberId The Member to send the invite as
 @param completion Called when the action is completed
 */
- (void)actionInviteMembersOrContacts:(NSArray <TSDKCollectionObject<TSDKMemberOrContactProtocol> *> *_Nullable)membersOrContacts asMemberId:(NSString *_Nonnull)asMemberId completion:(TSDKSimpleCompletionBlock _Nullable)completion;

+ (void)actionImportMembers:(NSArray <TSDKMember *> *_Nonnull)members destinationTeamId:(NSString *_Nonnull)destinationTeamId sendInvites:(BOOL)sendInvites completion:(TSDKArrayCompletionBlock _Nullable)completion;

- (void)actionImportMembersToTeam:(NSArray <TSDKMember *> *_Nonnull)members sendInvites:(BOOL)sendInvites completion:(TSDKArrayCompletionBlock _Nullable)completion;

- (void)getMemberPhotosForWidth:(NSInteger)width height:(NSInteger)height cropToFit:(BOOL)fitCrop configuration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberPhotoArrayCompletionBlock _Nullable)completion;

- (NSURL * _Nullable)teamLogoForWidth:(NSInteger)width height:(NSInteger)height;
- (NSURL * _Nullable)teamPhotoForWidth:(NSInteger)width height:(NSInteger)height;

+ (void)queryDivisionSearchPagesize:(NSInteger)pageSize pageNumber:(NSInteger)pageNumber divisionId:(NSString *_Nonnull)divisionId isActive:(BOOL)isActive isCommissioner:(BOOL)isCommissioner WithCompletion:(TSDKTeamArrayCompletionBlock _Nullable)completion;

//Toggles the visibility of teams on the list of active teams, per user. Requires a single id or a comma separated list of 'team_id's
+ (void)actionToggleTeamVisibilityOnDashboardTeamIds:(NSArray <NSString *> *_Nonnull)teamIds completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;
- (void)actionToggleTeamVisibilityOnDashboardWithCompletion:(TSDKTeamArrayCompletionBlock _Nullable)completion;

@end

@interface TSDKTeam (ForwardedMethods)

-(void)getTeamMediaGroupsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamMediaGroupArrayCompletionBlock _Nullable)completion;
-(void)getContactEmailAddressesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKContactEmailAddressArrayCompletionBlock _Nullable)completion;
-(void)getDivisionContactEmailAddressesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getMembersPreferencesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getAdvertisementsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKAdvertisementsArrayCompletionBlock _Nonnull)completion;
-(void)getAvailabilitiesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKAvailabilityArrayCompletionBlock _Nullable)completion;
-(void)getForumTopicsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKForumTopicArrayCompletionBlock _Nullable)completion;
-(void)getOwnerWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getDivisionMembersPreferencesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getTeamMediumCommentsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamMediumCommentArrayCompletionBlock _Nullable)completion;
-(void)getForumSubscriptionsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKForumSubscriptionArrayCompletionBlock _Nullable)completion;
-(void)getEventsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKEventArrayCompletionBlock _Nullable)completion;
-(void)getTeamPaypalPreferencesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getForumPostsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKForumPostArrayCompletionBlock _Nullable)completion;
-(void)getTeamMediaWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getCalendarWebcalWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getSportWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKSportArrayCompletionBlock _Nullable)completion;
-(void)getContactsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKContactArrayCompletionBlock _Nullable)completion;
-(void)getMembersCsvExportWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getTrackedItemStatusesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTrackedItemStatusArrayCompletionBlock _Nullable)completion;
-(void)getDivisionContactsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getManagersWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getLeagueRegistrantDocumentsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getStatisticAggregatesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getDivisionLocationsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getOpponentsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKOpponentArrayCompletionBlock _Nullable)completion;
-(void)getCalendarHttpGamesOnlyWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getCustomDataWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKCustomDatumArrayCompletionBlock _Nullable)completion;
-(void)getDivisionContactPhoneNumbersWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getTeamPreferencesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamPreferencesArrayCompletionBlock _Nullable)completion;
-(void)getCalendarHttpWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getDivisionTeamStandingsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getPaymentNotesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKPaymentNoteArrayCompletionBlock _Nullable)completion;
-(void)getPlanWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKPlanArrayCompletionBlock _Nullable)completion;
-(void)getTeamFeesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamFeeArrayCompletionBlock _Nullable)completion;
-(void)getEventsOverviewWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getMemberPhoneNumbersWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberPhoneNumberArrayCompletionBlock _Nullable)completion;
-(void)getMemberLinksWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getDivisionMembersWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKDivisionMembersArrayCompletionBlock _Nullable)completion;
-(void)getBroadcastEmailAttachmentsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getTeamStatisticsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamStatisticArrayCompletionBlock _Nullable)completion;
-(void)getMemberEmailAddressesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberEmailAddressArrayCompletionBlock _Nullable)completion;
-(void)getMembersWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberArrayCompletionBlock _Nullable)completion;
-(void)getStatisticsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKStatisticArrayCompletionBlock _Nullable)completion;
-(void)getSponsorsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getMemberBalancesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberBalanceArrayCompletionBlock _Nullable)completion;
-(void)getStatisticGroupsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKStatisticGroupArrayCompletionBlock _Nullable)completion;
-(void)getMemberStatisticsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberStatisticArrayCompletionBlock _Nullable)completion;
-(void)getOpponentsResultsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getPaypalCurrencyWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getTrackedItemsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTrackedItemArrayCompletionBlock _Nullable)completion;
-(void)getAssignmentsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKAssignmentArrayCompletionBlock _Nullable)completion;
-(void)getTeamResultsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamResultsArrayCompletionBlock _Nullable)completion;
-(void)getLeagueCustomDataWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKCustomLeagueDatumArrayCompletionBlock _Nullable)completion;
-(void)getContactPhoneNumbersWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKContactPhoneNumberArrayCompletionBlock _Nullable)completion;
-(void)getMessageDataWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getMemberFilesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getMemberPaymentsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberPaymentArrayCompletionBlock _Nullable)completion;
-(void)getDivisionMemberPhoneNumbersWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getDivisionMemberEmailAddressesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getLeagueCustomFieldsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKLeagueCustomFieldArrayCompletionBlock _Nullable)completion;
-(void)getLocationsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKLocationArrayCompletionBlock _Nullable)completion;
-(void)getCustomFieldsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKCustomFieldArrayCompletionBlock _Nullable)completion;
-(void)getStatisticDataWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKStatisticDatumArrayCompletionBlock _Nullable)completion;
-(void)getBroadcastEmailsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKBroadcastEmailArrayCompletionBlock _Nullable)completion;
-(void)getEventsCsvExportWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getEventStatisticsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKEventStatisticArrayCompletionBlock _Nullable)completion;
-(void)getBroadcastAlertsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKBroadcastAlertArrayCompletionBlock _Nullable)completion;
-(void)getTeamPublicSiteWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getMemberPhotosWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberPhotoArrayCompletionBlock _Nullable)completion;
-(void)getTeamPhotosWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getTeamLogoPhotoFileWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;

@end
