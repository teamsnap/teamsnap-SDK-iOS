//
//  TSDKCompletionBlockTypes.h
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 11/3/15.
//  Copyright © 2015 teamsnap. All rights reserved.
//

#ifndef TSDKCompletionBlockTypes_h
#define TSDKCompletionBlockTypes_h
@class TSDKinvitationFinder, UIImage, TSDKCollectionJSON, TSDKRootLinks,TSDKCustomDatum,TSDKForumTopic,TSDKContactPhoneNumber,TSDKEventStatistic,TSDKMemberPayment,TSDKMemberPhoneNumber,TSDKTeamMediumComment,TSDKTeamMediaGroup,TSDKStatisticDatum,TSDKAssignment,TSDKTrackedItem,TSDKMember,TSDKEvent,TSDKForumPost,TSDKMemberPreferences,TSDKCollectionObject,TSDKOpponent,TSDKPlan,TSDKContactEmailAddress,TSDKTeamMedium,TSDKinvitationFinder,TSDKTeamStatistic,TSDKTeam,TSDKTrackedItemStatus,TSDKSport,TSDKMemberEmailAddress,TSDKMemberBalance,TSDKContact,TSDKTeamResults,TSDKTslPhotos,TSDKPaymentNote,TSDKRootLinks,TSDKOpponentResults,TSDKStatistic,TSDKStatisticGroup,TSDKAvailability,TSDKUser,TSDKCustomField,TSDKMemberStatistic,TSDKTeamFee,TSDKTeamPreferences,TSDKLocation,TSDKBroadcastEmail,TSDKForumSubscription,TSDKBroadcastAlert, TSDKAvailabilityGroups, TSDKMessage, TSDKMessageDatum, TSDKDivisionMember, TSDKMemberPhoto, TSDKBackgroundUploadProgressMonitorDelegate, TSDKLeagueCustomDatum, TSDKLeagueCustomField, TSDKMemberAssignment, TSDKApnDevice, TSDKAdvertisement, TSDKMessagingPermission, TSDKInvoice, TSDKInvoicesAggregate, TSDKEventLineup, TSDKEventLineupEntry, TSDKSportPosition, TSDKBatchInvoice, TSDKBacthInvoiceLineItem, TSDKInvoiceRecipient, TSDKBatchInvoicesAggregate, TSDKInvoicePayment, TSDKInvoicePaymentTransaction, TSDKInvoiceRecipientsInvoicesAggregate, TSDKWepayAccount, TSDKPartnerPreferences, TSDKStripeAccount, TSDKSuggestedAssignment;

typedef void (^TSDKJSONCompletionBlock)(BOOL success, BOOL complete, id _Nullable objects, NSError *_Nullable error);
typedef void (^TSDKSimpleCompletionBlock)(BOOL success, NSError *_Nullable error);
typedef void (^TSDKRootLinkCompletionBlock)(TSDKRootLinks *_Nullable rootLinks, NSError * _Nullable error);
typedef void (^TSDKCompletionBlock)(BOOL success, BOOL complete, TSDKCollectionJSON *_Nullable objects, NSError *_Nullable error);
typedef void (^TSDKSaveCompletionBlock)(BOOL success, TSDKCollectionObject *_Nullable object, NSError *_Nullable error);
typedef void (^TSDKInviteStatusCompletionBlock)(BOOL success, BOOL complete, TSDKinvitationFinder *_Nullable objects, NSError *_Nullable error);
typedef void (^TSDKTokenCompletionBlock)(BOOL success, NSString *_Nullable OAuthToken, NSError *_Nullable error);
typedef void (^TSDKLoginCompletionBlock)(BOOL success, NSString *_Nullable OAuthToken, TSDKUser *_Nullable user, NSError *_Nullable error);
typedef void (^TSDKDictionaryCompletionBlock)(BOOL success, BOOL complete, NSDictionary *_Nullable objects, NSError *_Nullable error);
typedef void (^TSDKUploadProgressBlock)(TSDKBackgroundUploadProgressMonitorDelegate *_Nullable uploadStatus, NSError *_Nullable error);
//typedef void (^TSDKBatchInvoiceCreatedBlock)(BOOL success, BOOL complete, TSDKBatchInvoice *_Nullable objects, NSArray <TSDKBacthInvoiceLineItem *>*_Nonnull, NSArray <TSDKInvoice *>*_Nonnull, NSError *_Nullable error);
typedef void (^TSDKBatchInvoiceCreatedBlock)(BOOL success, BOOL complete, TSDKBatchInvoice *_Nullable batchInvoice, NSArray *_Nonnull invoiceLineItems, NSArray *_Nonnull invoices, NSError *_Nullable error);

typedef void (^TSDKCustomDatumArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKCustomDatum *> *_Nonnull customData, NSError *_Nullable error);
typedef void (^TSDKCustomLeagueDatumArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKLeagueCustomDatum *> *_Nonnull customData, NSError *_Nullable error);
typedef void (^TSDKForumTopicArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKForumTopic *> *_Nonnull forumTopics, NSError *_Nullable error);
typedef void (^TSDKContactPhoneNumberArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKContactPhoneNumber *> *_Nonnull contactPhoneNumbers, NSError *_Nullable error);
typedef void (^TSDKEventStatisticArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKEventStatistic *> *_Nonnull eventStatistics, NSError *_Nullable error);
typedef void (^TSDKMemberPaymentArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKMemberPayment *> *_Nonnull memberPayments, NSError *_Nullable error);
typedef void (^TSDKMemberPhoneNumberArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKMemberPhoneNumber *> *_Nonnull memberPhoneNumbers, NSError *_Nullable error);
typedef void (^TSDKTeamMediumCommentArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKTeamMediumComment *> *_Nonnull teamMediumComments, NSError *_Nullable error);
typedef void (^TSDKTeamMediaGroupArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKTeamMediaGroup *> *_Nonnull teamMediaGroups, NSError *_Nullable error);
typedef void (^TSDKStatisticDatumArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKStatisticDatum *> *_Nonnull statisticData, NSError *_Nullable error);
typedef void (^TSDKAssignmentArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKAssignment *> *_Nonnull assignments, NSError *_Nullable error);
typedef void (^TSDKMemberAssignmentArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKMemberAssignment *> *_Nonnull memberAssignments, NSError *_Nullable error);
typedef void (^TSDKApnDevicesArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKApnDevice *> *_Nonnull apnDevices, NSError *_Nullable error);
typedef void (^TSDKTrackedItemArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKTrackedItem *> *_Nonnull trackedItems, NSError *_Nullable error);
typedef void (^TSDKForumPostArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKForumPost *> *_Nonnull forumPosts, NSError *_Nullable error);
typedef void (^TSDKMemberPreferencesArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKMemberPreferences *> *_Nonnull memberPreferenceses, NSError *_Nullable error);
typedef void (^TSDKOpponentArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKOpponent *> *_Nonnull opponents, NSError *_Nullable error);
typedef void (^TSDKPlanArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKPlan *> *_Nonnull plans, NSError *_Nullable error);
typedef void (^TSDKContactEmailAddressArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKContactEmailAddress *> *_Nonnull contactEmailAddresses, NSError *_Nullable error);
typedef void (^TSDKTeamMediumArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKTeamMedium *> *_Nonnull teamMediums, NSError *_Nullable error);
typedef void (^TSDKinvitationFinderArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKinvitationFinder *> *_Nonnull invitationFinders, NSError *_Nullable error);
typedef void (^TSDKTeamStatisticArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKTeamStatistic *> *_Nonnull teamStatistics, NSError *_Nullable error);
typedef void (^TSDKTeamArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKTeam *> *_Nonnull teams, NSError *_Nullable error);

typedef void (^TSDKTrackedItemStatusArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKTrackedItemStatus *> *_Nonnull trackedItemStatuses, NSError *_Nullable error);
typedef void (^TSDKSportArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKSport *> *_Nonnull sports, NSError *_Nullable error);
typedef void (^TSDKMemberEmailAddressArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKMemberEmailAddress *> *_Nonnull memberEmailAddresses, NSError *_Nullable error);
typedef void (^TSDKMemberBalanceArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKMemberBalance *> *_Nonnull memberBalances, NSError *_Nullable error);

typedef void (^TSDKTslPhotosArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKTslPhotos *> *_Nonnull tslPhotoses, NSError *_Nullable error);
typedef void (^TSDKPaymentNoteArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKPaymentNote *> *_Nonnull paymentNotes, NSError *_Nullable error);
typedef void (^TSDKOpponentResultsArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKOpponentResults *> *_Nonnull opponentResultses, NSError *_Nullable error);
typedef void (^TSDKStatisticArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKStatistic *> *_Nonnull statistics, NSError *_Nullable error);
typedef void (^TSDKStatisticGroupArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKStatisticGroup *> *_Nonnull statisticGroups, NSError *_Nullable error);
typedef void (^TSDKAvailabilityArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKAvailability *> *_Nonnull availabilities, NSError *_Nullable error);
typedef void (^TSDKUserArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKUser *> *_Nonnull users, NSError *_Nullable error);
typedef void (^TSDKCustomFieldArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKCustomField *> *_Nonnull customFields, NSError *_Nullable error);
typedef void (^TSDKLeagueCustomFieldArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKLeagueCustomField *> *_Nonnull customFields, NSError *_Nullable error);
typedef void (^TSDKMemberStatisticArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKMemberStatistic *> *_Nonnull memberStatistics, NSError *_Nullable error);
typedef void (^TSDKTeamFeeArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKTeamFee *> *_Nonnull teamFees, NSError *_Nullable error);

typedef void (^TSDKLocationArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKLocation *> *_Nonnull locations, NSError *_Nullable error);
typedef void (^TSDKBroadcastEmailArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKBroadcastEmail *> *_Nonnull broadcastEmails, NSError *_Nullable error);
typedef void (^TSDKForumSubscriptionArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKForumSubscription *> *_Nonnull forumSubscriptions, NSError *_Nullable error);
typedef void (^TSDKBroadcastAlertArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKBroadcastAlert *> *_Nonnull broadcastAlerts, NSError *_Nullable error);
typedef void (^TSDKAvailabilityGroupCompletionBlock)(BOOL success, BOOL complete, TSDKAvailabilityGroups *_Nullable availabilities, NSError *_Nullable error);

typedef void (^TSDKMessagesArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKMessage *> *_Nullable messages, NSError *_Nullable error);
typedef void (^TSDKMessagesDatumArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKMessageDatum *> *_Nullable messageDatums, NSError *_Nullable error);
typedef void (^TSDKDivisionMembersArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKDivisionMember *> *_Nullable messages, NSError *_Nullable error);
typedef void (^TSDKArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKCollectionObject *> *_Nonnull objects, NSError *_Nullable error);
typedef void (^TSDKMemberArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKMember *> *_Nullable members, NSError * _Nullable error);
typedef void (^TSDKRootLinkCompletionBlock)(TSDKRootLinks * _Nullable rootLinks, NSError * _Nullable error);
typedef void (^TSDKTeamPreferencesArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKTeamPreferences *> *_Nullable teamsPreferences, NSError * _Nullable error);
typedef void (^TSDKTeamResultsArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKTeamResults *> *_Nullable teamsResults, NSError * _Nullable error);
typedef void (^TSDKEventArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKEvent *> *_Nullable events, NSError * _Nullable error);
typedef void (^TSDKPagedEventsCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKEvent *> *_Nullable events, NSURL * _Nullable nextPageURL, NSError * _Nullable error);
typedef void (^TSDKPagedEventsAndAvailabilitiesCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKEvent *> *_Nullable events, NSArray <TSDKAvailability *> *_Nullable availability, NSURL * _Nullable nextPageURL, NSError * _Nullable error);
typedef void (^TSDKEventCompletionBlock)(BOOL success, TSDKEvent * _Nullable event, NSError * _Nullable error);
typedef void (^TSDKImageCompletionBlock)(UIImage * _Nullable image);
typedef void (^TSDKContactArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKContact *> *_Nullable contacts, NSError * _Nullable error);
typedef void (^TSDKMemberPhotoArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKMemberPhoto *> *_Nullable memberPhotos, NSError *_Nullable error);
typedef void (^TSDKFirebaseTokenCompletionBlock)(BOOL success, NSString *_Nullable firbaseToken, NSError *_Nullable error);
typedef void (^TSDKAdvertisementsArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKAdvertisement *> *_Nullable advertisements, NSError * _Nullable error);
typedef void (^TSDKMessagingPermissionsArrayCompletionBlock)(BOOL success, BOOL complete, NSArray<TSDKMessagingPermission *> *_Nullable messagingPermissions, NSError * _Nullable error);
typedef void (^TSDKInvoicesArrayCompletionBlock)(BOOL success, BOOL complete, NSArray<TSDKInvoice *> *_Nullable invoices, NSError * _Nullable error);
typedef void (^TSDKInvoiceAggregateCompletionBlock)(BOOL success, BOOL complete, TSDKInvoicesAggregate *_Nullable invoiceAggregate, NSError * _Nullable error);
typedef void (^TSDKBatchInvoicesArrayCompletionBlock)(BOOL success, BOOL complete, NSArray<TSDKBatchInvoice *> *_Nullable invoices, NSError * _Nullable error);
typedef void (^TSDKBatchInvoiceLineItemArrayCompletionBlock)(BOOL success, BOOL complete, NSArray<TSDKBacthInvoiceLineItem *> *_Nullable invoiceLineItems, NSError * _Nullable error);
typedef void (^TSDKBatchInvoiceAggregateCompletionBlock)(BOOL success, BOOL complete, TSDKBatchInvoicesAggregate *_Nullable invoiceAggregate, NSError * _Nullable error);
typedef void (^TSDKInvoiceRecipientsInvoicesAggregateCompletionBlock)(BOOL success, BOOL complete, NSArray<TSDKInvoiceRecipientsInvoicesAggregate *> *_Nullable aggregates, NSError * _Nullable error);
typedef void (^TSDKInvoiceRecipientArrayCompletionBlock)(BOOL success, BOOL complete, NSArray<TSDKInvoiceRecipient *> *_Nullable invoiceLineItems, NSError * _Nullable error);
typedef void (^TSDKEventLineupCompletionBlock)(BOOL success, BOOL complete, TSDKEventLineup *_Nullable eventLineup, NSError *_Nullable error);
typedef void (^TSDKEventLineupEntryArrayCompletionBlock)(BOOL success, BOOL complete, NSArray<TSDKEventLineupEntry *>*_Nullable eventLineupEntries, NSError *_Nullable error);
typedef void  (^TSDKSportPositionArrayCompletionBlock)(BOOL success, BOOL complete, NSArray<TSDKSportPosition *>*_Nullable sportPositions, NSError *_Nullable error);
typedef void  (^TSDKInvoicePaymentsArrayCompletionBlock)(BOOL success, BOOL complete, NSArray<TSDKInvoicePayment *>*_Nullable invoicePayments, NSError *_Nullable error);
typedef void  (^TSDKInvoicePaymentTransactionsArrayCompletionBlock)(BOOL success, BOOL complete, NSArray<TSDKInvoicePaymentTransaction *>*_Nullable invoicePaymentTransactions, NSError *_Nullable error);
typedef void  (^TSDKWepayAccountsArrayCompletionBlock)(BOOL success, BOOL complete, NSArray<TSDKWepayAccount *>*_Nullable accounts, NSError *_Nullable error);
typedef void  (^TSDKWepayAccountCompletionBlock)(BOOL success, BOOL complete, TSDKWepayAccount *_Nullable accounts, NSError *_Nullable error);
typedef void  (^TSDKStripeAccountCompletionBlock)(BOOL success, BOOL complete, NSArray<TSDKStripeAccount *> *_Nullable accounts, NSError *_Nullable error);
typedef void  (^TSDKPartnerPreferencesArrayCompletionBlock)(BOOL success, BOOL complete, NSArray<TSDKPartnerPreferences *>*_Nullable partnerPreferences, NSError *_Nullable error);
typedef void (^TSDKSuggestedAssignmentsArrayCompletionBlock)(BOOL success, BOOL complete, NSArray<TSDKSuggestedAssignment *>*_Nullable suggestedAssignments, NSError *_Nullable error);
#endif /* TSDKCompletionBlockTypes_h */
