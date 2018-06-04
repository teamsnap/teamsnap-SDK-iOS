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

@property (nonatomic, weak, nullable) NSDate * createdAt; //Example: 2016-11-28T20:51:47Z
@property (nonatomic, assign) BOOL isInLeague; //Example: 0
@property (nonatomic, assign) BOOL hasReachedRosterLimit; //Example: 0
@property (nonatomic, weak, nullable) NSString * planId; //Example: 33
@property (nonatomic, weak, nullable) NSString * locationCountry; //Example: United States
@property (nonatomic, assign) NSInteger memberLimit; //Example: 4000
@property (nonatomic, weak, nullable) NSString * locationLatitude; //Example: **NULL**
@property (nonatomic, weak, nullable) NSString * timeZoneDescription; //Example: Central Time (US & Canada)
@property (nonatomic, weak, nullable) NSString * divisionId; //Example: <null>
@property (nonatomic, assign) BOOL hasExportableMedia; //Example: 0
@property (nonatomic, assign) NSInteger mediaStorageUsed; //Example: 0
@property (nonatomic, weak, nullable) NSString * sportId; //Example: 7
@property (nonatomic, assign) BOOL isRetired; //Example: 0
@property (nonatomic, assign) BOOL isArchivedSeason; //Example: 0
@property (nonatomic, weak, nullable) NSDate * billedAt; //Example: 2016-11-28T20:51:47Z
@property (nonatomic, weak, nullable) NSDate * lastAccessedAt; //Example: <null>
@property (nonatomic, assign) BOOL isHiddenOnDashboard; //Example: 1
@property (nonatomic, weak, nullable) NSString * seasonName; //Example: **NULL**
@property (nonatomic, weak, nullable) NSString * activeSeasonTeamId; //Example: <null>
@property (nonatomic, weak, nullable) NSString * name; //Example: -1
@property (nonatomic, weak, nullable) NSString * leagueName; //Example: **NULL**
@property (nonatomic, weak, nullable) NSString * humanizedMediaStorageUsed; //Example: 0 B
@property (nonatomic, assign) BOOL isGameDay; //Example: 0
@property (nonatomic, assign) BOOL isGatewayRequiredForSms; //Example: 0
@property (nonatomic, weak, nullable) NSString * divisionName; //Example: **NULL**
@property (nonatomic, assign) BOOL hasPlaayVideo; //Example: 0
@property (nonatomic, weak, nullable) NSString * locationLongitude; //Example: **NULL**
@property (nonatomic, assign) NSInteger playerMemberCount; //Example: 3
@property (nonatomic, assign) BOOL hasReachedMemberLimit; //Example: 0
@property (nonatomic, weak, nullable) NSString * locationState; //Example: **NULL**
@property (nonatomic, weak, nullable) NSString * timeZoneOffset; //Example: -06:00
@property (nonatomic, weak, nullable) NSDate * updatedAt; //Example: 2018-05-23T22:37:12Z
@property (nonatomic, assign) NSInteger canExportMedia; //Example: 0
@property (nonatomic, assign) NSInteger rosterLimit; //Example: 4000
@property (nonatomic, weak, nullable) NSString * timeZoneIanaName; //Example: America/Chicago
@property (nonatomic, assign) NSInteger nonPlayerMemberCount; //Example: 0
@property (nonatomic, weak, nullable) NSString * leagueUrl; //Example: **NULL**
@property (nonatomic, weak, nullable) NSString * locationPostalCode; //Example: 94108
@property (nonatomic, weak, nullable) NSURL * linkTeamMediaGroups;
@property (nonatomic, weak, nullable) NSURL * linkContactEmailAddresses;
@property (nonatomic, weak, nullable) NSURL * linkMembersPreferences;
@property (nonatomic, weak, nullable) NSURL * linkAvailabilities;
@property (nonatomic, weak, nullable) NSURL * linkForumTopics;
@property (nonatomic, weak, nullable) NSURL * linkTeamStores;
@property (nonatomic, weak, nullable) NSURL * linkOwner;
@property (nonatomic, weak, nullable) NSURL * linkTeamMediumComments;
@property (nonatomic, weak, nullable) NSURL * linkForumSubscriptions;
@property (nonatomic, weak, nullable) NSURL * linkEvents;
@property (nonatomic, weak, nullable) NSURL * linkTeamPaypalPreferences;
@property (nonatomic, weak, nullable) NSURL * linkForumPosts;
@property (nonatomic, weak, nullable) NSURL * linkTeamMedia;
@property (nonatomic, weak, nullable) NSURL * linkCalendarWebcal;
@property (nonatomic, weak, nullable) NSURL * linkSport;
@property (nonatomic, weak, nullable) NSURL * linkContacts;
@property (nonatomic, weak, nullable) NSURL * linkMembersCsvExport;
@property (nonatomic, weak, nullable) NSURL * linkTrackedItemStatuses;
@property (nonatomic, weak, nullable) NSURL * linkMemberPhotos;
@property (nonatomic, weak, nullable) NSURL * linkManagers;
@property (nonatomic, weak, nullable) NSURL * linkCommissioners;
@property (nonatomic, weak, nullable) NSURL * linkAvailabilitiesCsvExport;
@property (nonatomic, weak, nullable) NSURL * linkLeagueRegistrantDocuments;
@property (nonatomic, weak, nullable) NSURL * linkStatisticAggregates;
@property (nonatomic, weak, nullable) NSURL * linkOpponents;
@property (nonatomic, weak, nullable) NSURL * linkCalendarHttpGamesOnly;
@property (nonatomic, weak, nullable) NSURL * linkCustomData;
@property (nonatomic, weak, nullable) NSURL * linkTeamPreferences;
@property (nonatomic, weak, nullable) NSURL * linkMobilePlanSelection;
@property (nonatomic, weak, nullable) NSURL * linkCalendarHttp;
@property (nonatomic, weak, nullable) NSURL * linkDivisionTeamStandings;
@property (nonatomic, weak, nullable) NSURL * linkPaymentNotes;
@property (nonatomic, weak, nullable) NSURL * linkPlan;
@property (nonatomic, weak, nullable) NSURL * linkTeamFees;
@property (nonatomic, weak, nullable) NSURL * linkEventsOverview;
@property (nonatomic, weak, nullable) NSURL * linkMemberPhoneNumbers;
@property (nonatomic, weak, nullable) NSURL * linkMemberLinks;
@property (nonatomic, weak, nullable) NSURL * linkTeamStore;
@property (nonatomic, weak, nullable) NSURL * linkBroadcastEmailAttachments;
@property (nonatomic, weak, nullable) NSURL * linkTeamStatistics;
@property (nonatomic, weak, nullable) NSURL * linkMemberEmailAddresses;
@property (nonatomic, weak, nullable) NSURL * linkMessagingPermissions;
@property (nonatomic, weak, nullable) NSURL * linkMembers;
@property (nonatomic, weak, nullable) NSURL * linkStatistics;
@property (nonatomic, weak, nullable) NSURL * linkBatchInvoicesAggregates;
@property (nonatomic, weak, nullable) NSURL * linkSponsors;
@property (nonatomic, weak, nullable) NSURL * linkMemberBalances;
@property (nonatomic, weak, nullable) NSURL * linkStatisticGroups;
@property (nonatomic, weak, nullable) NSURL * linkMemberStatistics;
@property (nonatomic, weak, nullable) NSURL * linkOpponentsResults;
@property (nonatomic, weak, nullable) NSURL * linkPaypalCurrency;
@property (nonatomic, weak, nullable) NSURL * linkTrackedItems;
@property (nonatomic, weak, nullable) NSURL * linkAssignments;
@property (nonatomic, weak, nullable) NSURL * linkTeamResults;
@property (nonatomic, weak, nullable) NSURL * linkTeamPhotoFile;
@property (nonatomic, weak, nullable) NSURL * linkLeagueCustomData;
@property (nonatomic, weak, nullable) NSURL * linkContactPhoneNumbers;
@property (nonatomic, weak, nullable) NSURL * linkMemberFiles;
@property (nonatomic, weak, nullable) NSURL * linkAdvertisements;
@property (nonatomic, weak, nullable) NSURL * linkMemberPayments;
@property (nonatomic, weak, nullable) NSURL * linkLeagueCustomFields;
@property (nonatomic, weak, nullable) NSURL * linkMessages;
@property (nonatomic, weak, nullable) NSURL * linkLocations;
@property (nonatomic, weak, nullable) NSURL * linkCustomFields;
@property (nonatomic, weak, nullable) NSURL * linkSportPositions;
@property (nonatomic, weak, nullable) NSURL * linkBroadcastEmails;
@property (nonatomic, weak, nullable) NSURL * linkStatisticData;
@property (nonatomic, weak, nullable) NSURL * linkTeamLogoPhotoFile;
@property (nonatomic, weak, nullable) NSURL * linkTeamChat;
@property (nonatomic, weak, nullable) NSURL * linkBatchInvoices;
@property (nonatomic, weak, nullable) NSURL * linkEventsCsvExport;
@property (nonatomic, weak, nullable) NSURL * linkCalendarWebcalGamesOnly;
@property (nonatomic, weak, nullable) NSURL * linkEventStatistics;
@property (nonatomic, weak, nullable) NSURL * linkMessageData;
@property (nonatomic, weak, nullable) NSURL * linkBroadcastAlerts;
@property (nonatomic, weak, nullable) NSURL * linkTeamPublicSite;


- (void)setTimeZone:(NSTimeZone *_Nonnull)timeZone;
- (NSTimeZone *_Nullable)timeZone;

- (instancetype _Nullable)initWithName:(NSString *_Nonnull)name locationCountry:(NSString *_Nonnull)locationCountry locationPostalCode:(NSString *_Nullable)locationPostalCode ianaTimeZoneName:(NSString *_Nonnull)ianaTimeZoneName sportId:(NSString *_Nonnull)sportId;
- (void)bulkLoadDataWithTypes:(NSArray *_Nonnull)dataTypes withConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;

- (void)getEventsInDateRange:(NSDate *_Nullable)startDate endDate:(NSDate *_Nullable)endDate withConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKEventArrayCompletionBlock _Nullable)completion;
- (void)getEventWithId:(NSString *_Nonnull)eventId withConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKEventArrayCompletionBlock _Nullable)completion;

- (void)updateTimeZone:(NSTimeZone *_Nonnull)timeZone offsetEventTimes:(BOOL)offsetEventTimes withConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKCompletionBlock _Nullable)completion;
- (void)getMessagesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration type:(TSDKMessageType)type completion:(TSDKMessagesArrayCompletionBlock _Nullable)completion;
-(void)getBatchInvoicesAggregateWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKBatchInvoiceAggregateCompletionBlock _Nonnull)completion;

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

/**
 Sends the Team Owner an email highlighting a paid feature and encouraging them to upgrade.

 @param feature A string describing the feature. Possible values are "alerts", "assignments", "availability", "files", "lineups", "photos", "statistics", "tsl", "tracking".
 @param contactId The contact ID triggering the email.
 @param isOwner Identifies if the sender is the owner of the team
 @param completion Called upon completion.
 */
- (void)emailOwnerForUpsellFeature:(NSString * _Nonnull)feature fromContactId:(NSString * _Nonnull)contactId isOwner:(BOOL)isOwner completion:(TSDKSimpleCompletionBlock _Nullable)completion;

+ (void)queryDivisionSearchPagesize:(NSInteger)pageSize pageNumber:(NSInteger)pageNumber divisionId:(NSString *_Nonnull)divisionId isActive:(BOOL)isActive isCommissioner:(BOOL)isCommissioner WithCompletion:(TSDKTeamArrayCompletionBlock _Nullable)completion;

//Toggles the visibility of teams on the list of active teams, per user. Requires a single id or a comma separated list of 'team_id's
+ (void)actionToggleTeamVisibilityOnDashboardTeamIds:(NSArray <NSString *> *_Nonnull)teamIds completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;
- (void)actionToggleTeamVisibilityOnDashboardWithCompletion:(TSDKTeamArrayCompletionBlock _Nullable)completion;

@end

@interface TSDKTeam (ForwardedMethods)

-(void)getTeamMediaGroupsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamMediaGroupArrayCompletionBlock _Nonnull)completion;
-(void)getContactEmailAddressesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKContactEmailAddressArrayCompletionBlock _Nonnull)completion;
-(void)getMembersPreferencesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getAvailabilitiesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKAvailabilityArrayCompletionBlock _Nonnull)completion;
-(void)getForumTopicsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKForumTopicArrayCompletionBlock _Nonnull)completion;
-(void)getTeamStoresWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getOwnerWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getTeamMediumCommentsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamMediumCommentArrayCompletionBlock _Nonnull)completion;
-(void)getForumSubscriptionsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKForumSubscriptionArrayCompletionBlock _Nonnull)completion;
-(void)getEventsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKEventArrayCompletionBlock _Nonnull)completion;
-(void)getTeamPaypalPreferencesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getForumPostsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKForumPostArrayCompletionBlock _Nonnull)completion;
-(void)getTeamMediaWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamMediumArrayCompletionBlock _Nonnull)completion;
-(void)getCalendarWebcalWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getSportWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKSportArrayCompletionBlock _Nonnull)completion;
-(void)getContactsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKContactArrayCompletionBlock _Nonnull)completion;
-(void)getMembersCsvExportWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getTrackedItemStatusesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTrackedItemStatusArrayCompletionBlock _Nonnull)completion;
-(void)getMemberPhotosWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberPhotoArrayCompletionBlock _Nonnull)completion;
-(void)getManagersWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getCommissionersWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getAvailabilitiesCsvExportWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getLeagueRegistrantDocumentsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getStatisticAggregatesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getOpponentsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKOpponentArrayCompletionBlock _Nonnull)completion;
-(void)getCalendarHttpGamesOnlyWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getCustomDataWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKCustomDatumArrayCompletionBlock _Nonnull)completion;
-(void)getTeamPreferencesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamPreferencesArrayCompletionBlock _Nonnull)completion;
-(void)getMobilePlanSelectionWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getCalendarHttpWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getDivisionTeamStandingsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getPaymentNotesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKPaymentNoteArrayCompletionBlock _Nonnull)completion;
-(void)getPlanWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKPlanArrayCompletionBlock _Nonnull)completion;
-(void)getTeamFeesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamFeeArrayCompletionBlock _Nonnull)completion;
-(void)getEventsOverviewWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getMemberPhoneNumbersWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberPhoneNumberArrayCompletionBlock _Nonnull)completion;
-(void)getMemberLinksWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getTeamStoreWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getBroadcastEmailAttachmentsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getTeamStatisticsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamStatisticArrayCompletionBlock _Nonnull)completion;
-(void)getMemberEmailAddressesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberEmailAddressArrayCompletionBlock _Nonnull)completion;
-(void)getMessagingPermissionsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMessagingPermissionsArrayCompletionBlock _Nonnull)completion;
-(void)getMembersWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberArrayCompletionBlock _Nonnull)completion;
-(void)getStatisticsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKStatisticArrayCompletionBlock _Nonnull)completion;
-(void)getSponsorsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getMemberBalancesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberBalanceArrayCompletionBlock _Nonnull)completion;
-(void)getStatisticGroupsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKStatisticGroupArrayCompletionBlock _Nonnull)completion;
-(void)getMemberStatisticsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberStatisticArrayCompletionBlock _Nonnull)completion;
-(void)getOpponentsResultsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getPaypalCurrencyWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getTrackedItemsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTrackedItemArrayCompletionBlock _Nonnull)completion;
-(void)getAssignmentsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKAssignmentArrayCompletionBlock _Nonnull)completion;
-(void)getTeamResultsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamResultsArrayCompletionBlock _Nonnull)completion;
-(void)getTeamPhotosWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getLeagueCustomDataWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKCustomLeagueDatumArrayCompletionBlock _Nonnull)completion;
-(void)getContactPhoneNumbersWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKContactPhoneNumberArrayCompletionBlock _Nonnull)completion;
-(void)getMemberFilesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getAdvertisementsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKAdvertisementsArrayCompletionBlock _Nonnull)completion;
-(void)getMemberPaymentsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberPaymentArrayCompletionBlock _Nonnull)completion;
-(void)getLeagueCustomFieldsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKLeagueCustomFieldArrayCompletionBlock _Nonnull)completion;
-(void)getLocationsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKLocationArrayCompletionBlock _Nonnull)completion;
-(void)getCustomFieldsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKCustomFieldArrayCompletionBlock _Nonnull)completion;
-(void)getSportPositionsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKSportPositionArrayCompletionBlock _Nonnull)completion;
-(void)getBroadcastEmailsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKBroadcastEmailArrayCompletionBlock _Nonnull)completion;
-(void)getStatisticDataWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKStatisticDatumArrayCompletionBlock _Nonnull)completion;
-(void)getTeamLogoPhotoFileWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getTeamChatWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getBatchInvoicesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKBatchInvoicesArrayCompletionBlock _Nonnull)completion;
-(void)getEventsCsvExportWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getCalendarWebcalGamesOnlyWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getEventStatisticsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKEventStatisticArrayCompletionBlock _Nonnull)completion;
-(void)getMessageDataWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMessagesDatumArrayCompletionBlock _Nonnull)completion;
-(void)getBroadcastAlertsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKBroadcastAlertArrayCompletionBlock _Nonnull)completion;
-(void)getTeamPublicSiteWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
@end
