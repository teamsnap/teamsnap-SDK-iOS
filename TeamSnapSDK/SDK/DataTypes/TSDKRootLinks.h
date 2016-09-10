//
//  TSDKRootLinks.h
//  SDKDeveloperTools
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKRootLinks : TSDKCollectionObject <TSDKCollectionObjectBundledDataProtocol>

@property (nonatomic, weak) NSURL *linkDivisionContactPhoneNumbers;
@property (nonatomic, weak) NSURL *linkDivisions;
@property (nonatomic, weak) NSURL *linkBroadcastAlerts;
@property (nonatomic, weak) NSURL *linkTeamsResults;
@property (nonatomic, weak) NSURL *linkMe;
@property (nonatomic, weak) NSURL *linkLocations;
@property (nonatomic, weak) NSURL *linkTeamMediumComments;
@property (nonatomic, weak) NSURL *linkTeamsPreferences;
@property (nonatomic, weak) NSURL *linkMemberLinks;
@property (nonatomic, weak) NSURL *linkForumTopics;
@property (nonatomic, weak) NSURL *linkTeamMedia;
@property (nonatomic, weak) NSURL *linkEvents;
@property (nonatomic, weak) NSURL *linkStatistics;
@property (nonatomic, weak) NSURL *linkSweet;
@property (nonatomic, weak) NSURL *linkTrackedItemStatuses;
@property (nonatomic, weak) NSURL *linkTslPhotos;
@property (nonatomic, weak) NSURL *linkContactPhoneNumbers;
@property (nonatomic, weak) NSURL *linkContactEmailAddresses;
@property (nonatomic, weak) NSURL *linkTeamPublicSites;
@property (nonatomic, weak) NSURL *linkAssignments;
@property (nonatomic, weak) NSURL *linkDivisionMemberPhoneNumbers;
@property (nonatomic, weak) NSURL *linkDude;
@property (nonatomic, weak) NSURL *linkOpponentsResults;
@property (nonatomic, weak) NSURL *linkTrackedItems;
@property (nonatomic, weak) NSURL *linkSmsGateways;
@property (nonatomic, weak) NSURL *linkDivisionLocations;
@property (nonatomic, weak) NSURL *linkForecasts;
@property (nonatomic, weak) NSURL *linkPublicFeatures;
@property (nonatomic, weak) NSURL *linkTslChats;
@property (nonatomic, weak) NSURL *linkRandom;
@property (nonatomic, weak) NSURL *linkPlansAll;
@property (nonatomic, weak) NSURL *linkMemberStatistics;
@property (nonatomic, weak) NSURL *linkDivisionMembers;
@property (nonatomic, weak) NSURL *linkTeamMediaGroups;
@property (nonatomic, weak) NSURL *linkForumSubscriptions;
@property (nonatomic, weak) NSURL *linkGeocodedLocations;
@property (nonatomic, weak) NSURL *linkReferrals;
@property (nonatomic, weak) NSURL *linkLeagueCustomData;
@property (nonatomic, weak) NSURL *linkSports;
@property (nonatomic, weak) NSURL *linkAvailabilities;
@property (nonatomic, weak) NSURL *linkMemberBalances;
@property (nonatomic, weak) NSURL *linkMemberPayments;
@property (nonatomic, weak) NSURL *linkLeagueCustomFields;
@property (nonatomic, weak) NSURL *linkMembers;
@property (nonatomic, weak) NSURL *linkMembersPreferences;
@property (nonatomic, weak) NSURL *linkTslMetadata;
@property (nonatomic, weak) NSURL *linkDivisionsPreferences;
@property (nonatomic, weak) NSURL *linkOpponents;
@property (nonatomic, weak) NSURL *linkApiv2Root;
@property (nonatomic, weak) NSURL *linkMemberEmailAddresses;
@property (nonatomic, weak) NSURL *linkStatisticData;
@property (nonatomic, weak) NSURL *linkTeamsPaypalPreferences;
@property (nonatomic, weak) NSURL *linkBroadcastEmails;
@property (nonatomic, weak) NSURL *linkTeamStatistics;
@property (nonatomic, weak) NSURL *linkDivisionMembersPreferences;
@property (nonatomic, weak) NSURL *linkPlans;
@property (nonatomic, weak) NSURL *linkSelf;
@property (nonatomic, weak) NSURL *linkDivisionTeamStandings;
@property (nonatomic, weak) NSURL *linkAuthorization;
@property (nonatomic, weak) NSURL *linkDivisionMemberEmailAddresses;
@property (nonatomic, weak) NSURL *linkDivisionContactEmailAddresses;
@property (nonatomic, weak) NSURL *linkSponsors;
@property (nonatomic, weak) NSURL *linkTeams;
@property (nonatomic, weak) NSURL *linkPaypalCurrencies;
@property (nonatomic, weak) NSURL *linkFacebookPages;
@property (nonatomic, weak) NSURL *linkMemberPhoneNumbers;
@property (nonatomic, weak) NSURL *linkEventStatistics;
@property (nonatomic, weak) NSURL *linkCustomData;
@property (nonatomic, weak) NSURL *linkMemberFiles;
@property (nonatomic, weak) NSURL *linkTeamFees;
@property (nonatomic, weak) NSURL *linkBroadcastEmailAttachments;
@property (nonatomic, weak) NSURL *linkTimeZones;
@property (nonatomic, weak) NSURL *linkTslScores;
@property (nonatomic, weak) NSURL *linkLeagueRegistrantDocuments;
@property (nonatomic, weak) NSURL *linkStatisticGroups;
@property (nonatomic, weak) NSURL *linkStatisticAggregates;
@property (nonatomic, weak) NSURL *linkCustomFields;
@property (nonatomic, weak) NSURL *linkDivisionContacts;
@property (nonatomic, weak) NSURL *linkUsers;
@property (nonatomic, weak) NSURL *linkDivisionEvents;
@property (nonatomic, weak) NSURL *linkSchemas;
@property (nonatomic, weak) NSURL *linkRoot;
@property (nonatomic, weak) NSURL *linkXyzzy;
@property (nonatomic, weak) NSURL *linkPaymentNotes;
@property (nonatomic, weak) NSURL *linkForumPosts;
@property (nonatomic, weak) NSURL *linkContacts;
@property (nonatomic, weak) NSURL *linkCountries;


//+(void)actionWelcomeClientid:(NSString *)clientId redirectUri:(NSString *)redirectUri emailAddress:(NSString *)emailAddress WithCompletion:(TSDKCompletionBlock)completion; //Send a welcome email to an unregistered user to start the registration process
//+(void)actionInitiateRegistrationClientid:(NSString *)clientId redirectUri:(NSString *)redirectUri emailAddress:(NSString *)emailAddress WithCompletion:(TSDKCompletionBlock)completion; //Send a signup email to an unregistered user to start the registration process
//+(void)actionSendInvitationsEmailaddress:(NSString *)emailAddress WithCompletion:(TSDKCompletionBlock)completion; //Send any pending invitations for a specified email address

-(void)getSchemasArrayWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getSchemasWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKSimpleCompletionBlock)completion;

+(void)actionSendInvitationsToEmailaddress:(NSString *)emailAddress WithCompletion:(TSDKCompletionBlock)completion; //Send any pending invitations for a specified email address
+(void)actionWelcomeEmailAddress:(NSString *)emailAddress withCallbackURL:(NSURL *)callbackURL withCompletion:(TSDKSimpleCompletionBlock)completion;

+(void)queryGenerateFirebaseTokenTeamid:(NSInteger)teamId version:(NSString *)version WithCompletion:(TSDKCompletionBlock)completion;

@end

@interface TSDKRootLinks (ForwardedMethods)

-(void)getDivisionContactPhoneNumbersWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getDivisionsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getBroadcastAlertsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKBroadcastAlertArrayCompletionBlock)completion;
-(void)getTeamsResultsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getMeWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getLocationsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKLocationArrayCompletionBlock)completion;
-(void)getTeamMediumCommentsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamMediumCommentArrayCompletionBlock)completion;
-(void)getTeamsPreferencesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamPreferencesArrayCompletionBlock)completion;
-(void)getMemberLinksWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getForumTopicsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKForumTopicArrayCompletionBlock)completion;
-(void)getTeamMediaWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getEventsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKEventArrayCompletionBlock)completion;
-(void)getStatisticsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKStatisticArrayCompletionBlock)completion;
-(void)getSweetWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getTrackedItemStatusesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTrackedItemStatusArrayCompletionBlock)completion;
-(void)getTslPhotosWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTslPhotosArrayCompletionBlock)completion;
-(void)getContactPhoneNumbersWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKContactPhoneNumberArrayCompletionBlock)completion;
-(void)getContactEmailAddressesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKContactEmailAddressArrayCompletionBlock)completion;
-(void)getTeamPublicSitesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getAssignmentsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKAssignmentArrayCompletionBlock)completion;
-(void)getDivisionMemberPhoneNumbersWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getDudeWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getOpponentsResultsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getTrackedItemsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTrackedItemArrayCompletionBlock)completion;
-(void)getSmsGatewaysWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getDivisionLocationsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getForecastsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getPublicFeaturesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getTslChatsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getRandomWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getPlansAllWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getMemberStatisticsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberStatisticArrayCompletionBlock)completion;
-(void)getDivisionMembersWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getTeamMediaGroupsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamMediaGroupArrayCompletionBlock)completion;
-(void)getForumSubscriptionsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKForumSubscriptionArrayCompletionBlock)completion;
-(void)getGeocodedLocationsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getReferralsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getLeagueCustomDataWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getSportsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKSportArrayCompletionBlock)completion;
-(void)getAvailabilitiesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKAvailabilityArrayCompletionBlock)completion;
-(void)getMemberBalancesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberBalanceArrayCompletionBlock)completion;
-(void)getMemberPaymentsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberPaymentArrayCompletionBlock)completion;
-(void)getLeagueCustomFieldsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getMembersWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberArrayCompletionBlock)completion;
-(void)getMembersPreferencesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getTslMetadataWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getDivisionsPreferencesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getOpponentsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKOpponentArrayCompletionBlock)completion;
-(void)getApiv2RootWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getMemberEmailAddressesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberEmailAddressArrayCompletionBlock)completion;
-(void)getStatisticDataWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKStatisticDatumArrayCompletionBlock)completion;
-(void)getTeamsPaypalPreferencesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getBroadcastEmailsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKBroadcastEmailArrayCompletionBlock)completion;
-(void)getTeamStatisticsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamStatisticArrayCompletionBlock)completion;
-(void)getDivisionMembersPreferencesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getPlansWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKPlanArrayCompletionBlock)completion;
-(void)getSelfWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getDivisionTeamStandingsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getAuthorizationWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getDivisionMemberEmailAddressesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getDivisionContactEmailAddressesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getSponsorsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getTeamsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion;
-(void)getPaypalCurrenciesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getFacebookPagesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getMemberPhoneNumbersWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberPhoneNumberArrayCompletionBlock)completion;
-(void)getEventStatisticsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKEventStatisticArrayCompletionBlock)completion;
-(void)getCustomDataWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKCustomDatumArrayCompletionBlock)completion;
-(void)getMemberFilesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getTeamFeesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamFeeArrayCompletionBlock)completion;
-(void)getBroadcastEmailAttachmentsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getTimeZonesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getTslScoresWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getLeagueRegistrantDocumentsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getStatisticGroupsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKStatisticGroupArrayCompletionBlock)completion;
-(void)getStatisticAggregatesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getCustomFieldsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKCustomFieldArrayCompletionBlock)completion;
-(void)getDivisionContactsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getUsersWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKUserArrayCompletionBlock)completion;
-(void)getDivisionEventsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getSchemasWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getRootWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getXyzzyWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getPaymentNotesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKPaymentNoteArrayCompletionBlock)completion;
-(void)getForumPostsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKForumPostArrayCompletionBlock)completion;
-(void)getContactsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKContactArrayCompletionBlock)completion;
-(void)getCountriesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;

@end
