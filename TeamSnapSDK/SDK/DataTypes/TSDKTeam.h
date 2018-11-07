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

@property (nonatomic, strong, nullable) NSDate * createdAt; //Example: 2016-11-28T20:51:47Z
@property (nonatomic, assign) BOOL isInLeague; //Example: 0
@property (nonatomic, assign) BOOL hasReachedRosterLimit; //Example: 0
@property (nonatomic, strong, nullable) NSString * planId; //Example: 33
@property (nonatomic, strong, nullable) NSString * locationCountry; //Example: United States
@property (nonatomic, assign) NSInteger memberLimit; //Example: 4000
@property (nonatomic, strong, nullable) NSString * locationLatitude; //Example: **NULL**
@property (nonatomic, strong, nullable) NSString * timeZoneDescription; //Example: Central Time (US & Canada)
@property (nonatomic, strong, nullable) NSString * divisionId; //Example: <null>
@property (nonatomic, assign) BOOL hasExportableMedia; //Example: 0
@property (nonatomic, assign) NSInteger mediaStorageUsed; //Example: 0
@property (nonatomic, strong, nullable) NSString * sportId; //Example: 7
@property (nonatomic, assign) BOOL isRetired; //Example: 0
@property (nonatomic, assign) BOOL isArchivedSeason; //Example: 0
@property (nonatomic, strong, nullable) NSDate * billedAt; //Example: 2016-11-28T20:51:47Z
@property (nonatomic, strong, nullable) NSDate * lastAccessedAt; //Example: <null>
@property (nonatomic, assign) BOOL isHiddenOnDashboard; //Example: 1
@property (nonatomic, strong, nullable) NSString * seasonName; //Example: **NULL**
@property (nonatomic, strong, nullable) NSString * activeSeasonTeamId; //Example: <null>
@property (nonatomic, strong, nullable) NSString * name; //Example: -1
@property (nonatomic, strong, nullable) NSString * leagueName; //Example: **NULL**
@property (nonatomic, strong, nullable) NSString * humanizedMediaStorageUsed; //Example: 0 B
@property (nonatomic, assign) BOOL isGameDay; //Example: 0
@property (nonatomic, assign) BOOL isGatewayRequiredForSms; //Example: 0
@property (nonatomic, strong, nullable) NSString * divisionName; //Example: **NULL**
@property (nonatomic, assign) BOOL hasPlaayVideo; //Example: 0
@property (nonatomic, strong, nullable) NSString * locationLongitude; //Example: **NULL**
@property (nonatomic, assign) NSInteger playerMemberCount; //Example: 3
@property (nonatomic, assign) BOOL hasReachedMemberLimit; //Example: 0
@property (nonatomic, strong, nullable) NSString * locationState; //Example: **NULL**
@property (nonatomic, strong, nullable) NSString * timeZoneOffset; //Example: -06:00
@property (nonatomic, strong, nullable) NSDate * updatedAt; //Example: 2018-05-23T22:37:12Z
@property (nonatomic, assign) NSInteger canExportMedia; //Example: 0
@property (nonatomic, assign) NSInteger rosterLimit; //Example: 4000
@property (nonatomic, strong, nullable) NSString * timeZoneIanaName; //Example: America/Chicago
@property (nonatomic, assign) NSInteger nonPlayerMemberCount; //Example: 0
@property (nonatomic, strong, nullable) NSString * leagueUrl; //Example: **NULL**
@property (nonatomic, strong, nullable) NSString * locationPostalCode; //Example: 94108
@property (nonatomic, strong, nullable) NSURL * linkTeamMediaGroups;
@property (nonatomic, strong, nullable) NSURL * linkContactEmailAddresses;
@property (nonatomic, strong, nullable) NSURL * linkMembersPreferences;
@property (nonatomic, strong, nullable) NSURL * linkAvailabilities;
@property (nonatomic, strong, nullable) NSURL * linkForumTopics;
@property (nonatomic, strong, nullable) NSURL * linkTeamStores;
@property (nonatomic, strong, nullable) NSURL * linkOwner;
@property (nonatomic, strong, nullable) NSURL * linkTeamMediumComments;
@property (nonatomic, strong, nullable) NSURL * linkForumSubscriptions;
@property (nonatomic, strong, nullable) NSURL * linkEvents;
@property (nonatomic, strong, nullable) NSURL * linkTeamPaypalPreferences;
@property (nonatomic, strong, nullable) NSURL * linkForumPosts;
@property (nonatomic, strong, nullable) NSURL * linkTeamMedia;
@property (nonatomic, strong, nullable) NSURL * linkCalendarWebcal;
@property (nonatomic, strong, nullable) NSURL * linkSport;
@property (nonatomic, strong, nullable) NSURL * linkContacts;
@property (nonatomic, strong, nullable) NSURL * linkMembersCsvExport;
@property (nonatomic, strong, nullable) NSURL * linkTrackedItemStatuses;
@property (nonatomic, strong, nullable) NSURL * linkMemberPhotos;
@property (nonatomic, strong, nullable) NSURL * linkManagers;
@property (nonatomic, strong, nullable) NSURL * linkCommissioners;
@property (nonatomic, strong, nullable) NSURL * linkAvailabilitiesCsvExport;
@property (nonatomic, strong, nullable) NSURL * linkLeagueRegistrantDocuments;
@property (nonatomic, strong, nullable) NSURL * linkStatisticAggregates;
@property (nonatomic, strong, nullable) NSURL * linkOpponents;
@property (nonatomic, strong, nullable) NSURL * linkCalendarHttpGamesOnly;
@property (nonatomic, strong, nullable) NSURL * linkCustomData;
@property (nonatomic, strong, nullable) NSURL * linkTeamPreferences;
@property (nonatomic, strong, nullable) NSURL * linkMobilePlanSelection;
@property (nonatomic, strong, nullable) NSURL * linkCalendarHttp;
@property (nonatomic, strong, nullable) NSURL * linkDivisionTeamStandings;
@property (nonatomic, strong, nullable) NSURL * linkPaymentNotes;
@property (nonatomic, strong, nullable) NSURL * linkPlan;
@property (nonatomic, strong, nullable) NSURL * linkTeamFees;
@property (nonatomic, strong, nullable) NSURL * linkEventsOverview;
@property (nonatomic, strong, nullable) NSURL * linkMemberPhoneNumbers;
@property (nonatomic, strong, nullable) NSURL * linkMemberLinks;
@property (nonatomic, strong, nullable) NSURL * linkTeamStore;
@property (nonatomic, strong, nullable) NSURL * linkBroadcastEmailAttachments;
@property (nonatomic, strong, nullable) NSURL * linkTeamStatistics;
@property (nonatomic, strong, nullable) NSURL * linkMemberEmailAddresses;
@property (nonatomic, strong, nullable) NSURL * linkMessagingPermissions;
@property (nonatomic, strong, nullable) NSURL * linkMembers;
@property (nonatomic, strong, nullable) NSURL * linkStatistics;
@property (nonatomic, strong, nullable) NSURL * linkBatchInvoicesAggregates;
@property (nonatomic, strong, nullable) NSURL * linkSponsors;
@property (nonatomic, strong, nullable) NSURL * linkMemberBalances;
@property (nonatomic, strong, nullable) NSURL * linkStatisticGroups;
@property (nonatomic, strong, nullable) NSURL * linkMemberStatistics;
@property (nonatomic, strong, nullable) NSURL * linkOpponentsResults;
@property (nonatomic, strong, nullable) NSURL * linkPaypalCurrency;
@property (nonatomic, strong, nullable) NSURL * linkTrackedItems;
@property (nonatomic, strong, nullable) NSURL * linkAssignments;
@property (nonatomic, strong, nullable) NSURL * linkTeamResults;
@property (nonatomic, strong, nullable) NSURL * linkTeamPhotoFile;
@property (nonatomic, strong, nullable) NSURL * linkLeagueCustomData;
@property (nonatomic, strong, nullable) NSURL * linkContactPhoneNumbers;
@property (nonatomic, strong, nullable) NSURL * linkMemberFiles;
@property (nonatomic, strong, nullable) NSURL * linkAdvertisements;
@property (nonatomic, strong, nullable) NSURL * linkMemberPayments;
@property (nonatomic, strong, nullable) NSURL * linkLeagueCustomFields;
@property (nonatomic, strong, nullable) NSURL * linkMessages;
@property (nonatomic, strong, nullable) NSURL * linkLocations;
@property (nonatomic, strong, nullable) NSURL * linkCustomFields;
@property (nonatomic, strong, nullable) NSURL * linkSportPositions;
@property (nonatomic, strong, nullable) NSURL * linkBroadcastEmails;
@property (nonatomic, strong, nullable) NSURL * linkStatisticData;
@property (nonatomic, strong, nullable) NSURL * linkTeamLogoPhotoFile;
@property (nonatomic, strong, nullable) NSURL * linkTeamChat;
@property (nonatomic, strong, nullable) NSURL * linkBatchInvoices;
@property (nonatomic, strong, nullable) NSURL * linkEventsCsvExport;
@property (nonatomic, strong, nullable) NSURL * linkCalendarWebcalGamesOnly;
@property (nonatomic, strong, nullable) NSURL * linkEventStatistics;
@property (nonatomic, strong, nullable) NSURL * linkMessageData;
@property (nonatomic, strong, nullable) NSURL * linkBroadcastAlerts;
@property (nonatomic, strong, nullable) NSURL * linkTeamPublicSite;
@property (nonatomic, strong, nullable) NSURL * linkInvoiceRecipientsInvoicesAggregates;
@property (nonatomic, strong, nullable) NSURL * linkWepayAccounts;
@property (nonatomic, strong, nullable) NSURL * linkGrantedWepayAccount;

- (void)setTimeZone:(NSTimeZone *_Nonnull)timeZone;
- (NSTimeZone *_Nullable)timeZone;

- (instancetype _Nullable)initWithName:(NSString *_Nonnull)name locationCountry:(NSString *_Nonnull)locationCountry locationPostalCode:(NSString *_Nullable)locationPostalCode ianaTimeZoneName:(NSString *_Nonnull)ianaTimeZoneName sportId:(NSString *_Nonnull)sportId;
- (void)bulkLoadDataWithTypes:(NSArray *_Nonnull)dataTypes withConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;

- (void)getEventsInDateRange:(NSDate *_Nullable)startDate endDate:(NSDate *_Nullable)endDate withConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKPagedEventsCompletionBlock _Nullable)completion;
- (void)getEventsStartingAfter:(NSDate *_Nonnull)date pageSize:(NSNumber *_Nullable)pageSize pageNumber:(NSNumber *_Nullable)pageNumber configuration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKPagedEventsCompletionBlock _Nullable)completion;
- (void)getEventsStartingBefore:(NSDate *_Nonnull)date pageSize:(NSNumber *_Nullable)pageSize pageNumber:(NSNumber *_Nullable)pageNumber configuration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKPagedEventsCompletionBlock _Nullable)completion;

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
-(void)getInvoiceRecipientsInvoicesAggregatesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKInvoiceRecipientsInvoicesAggregateCompletionBlock _Nonnull)completion;
-(void)getWepayAccountsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKWepayAccountsArrayCompletionBlock _Nonnull)completion;
-(void)getGrantedWepayAccountWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKWepayAccountsArrayCompletionBlock _Nonnull)completion;

@end
