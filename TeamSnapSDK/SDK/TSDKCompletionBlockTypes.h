//
//  TSDKCompletionBlockTypes.h
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 11/3/15.
//  Copyright © 2015 teamsnap. All rights reserved.
//

#ifndef TSDKCompletionBlockTypes_h
#define TSDKCompletionBlockTypes_h
@class TSDKinvitationFinder, UIImage, TSDKCollectionJSON, TSDKRootLinks, TSDKStatisticGroup,TSDKStatistic,TSDKMemberPreferences,TSDKCustomField,TSDKUser,TSDKAvailability,TSDKTeamStatistic,TSDKinvitationFinder,TSDKTeamMedium,TSDKContactEmailAddress,TSDKSport,TSDKTrackedItemStatus,TSDKTeam,TSDKTeamMediaGroup,TSDKTeamMediumComment,TSDKMemberEmailAddress,TSDKTrackedItem,TSDKAssignment,TSDKStatisticDatum,TSDKOpponentResults,TSDKRootLinks,TSDKTeamPreferences,TSDKTeamFee,TSDKMemberStatistic,TSDKBroadcastEmail,TSDKLocation,TSDKContact,TSDKMemberBalance,TSDKBroadcastSms,TSDKForumSubscription,TSDKPaymentNote,TSDKTslPhotos,TSDKTeamResults,TSDKContactPhoneNumber,TSDKForumTopic,TSDKCustomDatum,TSDKMemberPayment,TSDKCollectionObject,TSDKMemberPhoneNumber,TSDKPlan,TSDKOpponent,TSDKMember,TSDKForumPost,TSDKEvent;

typedef void (^TSDKJSONCompletionBlock)(BOOL success, BOOL complete, id objects, NSError *error);
typedef void (^TSDKSimpleCompletionBlock)(BOOL success, NSError *error);
typedef void (^TSDKRootLinkCompletionBlock)(TSDKRootLinks *rootLinks);
typedef void (^TSDKCompletionBlock)(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error);
typedef void (^TSDKInviteStatusCompletionBlock)(BOOL success, BOOL complete, TSDKinvitationFinder *objects, NSError *error);
typedef void (^TSDKLoginCompletionBlock)(BOOL success, NSString *OAuthToken, NSError *error);
typedef void (^TSDKArrayCompletionBlock)(BOOL success, BOOL complete, NSArray *objects, NSError *error);
typedef void (^TSDKDictionaryCompletionBlock)(BOOL success, BOOL complete, NSDictionary *objects, NSError *error);
typedef void (^TSDKImageCompletionBlock)(UIImage *image);

typedef void (^TSDKStatisticGroupArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKStatisticGroup *> *statisticGroups, NSError *error);
typedef void (^TSDKStatisticArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKStatistic *> *statistics, NSError *error);
typedef void (^TSDKMemberPreferencesArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKMemberPreferences *> *memberPreferenceses, NSError *error);
typedef void (^TSDKCustomFieldArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKCustomField *> *customFields, NSError *error);
typedef void (^TSDKUserArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKUser *> *users, NSError *error);
typedef void (^TSDKAvailabilityArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKAvailability *> *availabilities, NSError *error);
typedef void (^TSDKTeamStatisticArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKTeamStatistic *> *teamStatistics, NSError *error);
typedef void (^TSDKinvitationFinderArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKinvitationFinder *> *invitationFinders, NSError *error);
typedef void (^TSDKTeamMediumArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKTeamMedium *> *teamMediums, NSError *error);
typedef void (^TSDKContactEmailAddressArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKContactEmailAddress *> *contactEmailAddresses, NSError *error);
typedef void (^TSDKSportArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKSport *> *sports, NSError *error);
typedef void (^TSDKTrackedItemStatusArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKTrackedItemStatus *> *trackedItemStatuses, NSError *error);
typedef void (^TSDKTeamArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKTeam *> *teams, NSError *error);
typedef void (^TSDKTeamMediaGroupArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKTeamMediaGroup *> *teamMediaGroups, NSError *error);
typedef void (^TSDKTeamMediumCommentArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKTeamMediumComment *> *teamMediumComments, NSError *error);
typedef void (^TSDKMemberEmailAddressArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKMemberEmailAddress *> *memberEmailAddresses, NSError *error);
typedef void (^TSDKTrackedItemArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKTrackedItem *> *trackedItems, NSError *error);
typedef void (^TSDKAssignmentArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKAssignment *> *assignments, NSError *error);
typedef void (^TSDKStatisticDatumArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKStatisticDatum *> *statisticData, NSError *error);
typedef void (^TSDKOpponentResultsArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKOpponentResults *> *opponentResultses, NSError *error);
typedef void (^TSDKTeamPreferencesArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKTeamPreferences *> *teamsPreferences, NSError *error);
typedef void (^TSDKTeamFeeArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKTeamFee *> *teamFees, NSError *error);
typedef void (^TSDKMemberStatisticArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKMemberStatistic *> *memberStatistics, NSError *error);
typedef void (^TSDKBroadcastEmailArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKBroadcastEmail *> *broadcastEmails, NSError *error);
typedef void (^TSDKLocationArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKLocation *> *locations, NSError *error);
typedef void (^TSDKContactArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKContact *> *contacts, NSError *error);
typedef void (^TSDKMemberBalanceArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKMemberBalance *> *memberBalances, NSError *error);
typedef void (^TSDKBroadcastSmsArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKBroadcastSms *> *broadcastSmses, NSError *error);
typedef void (^TSDKForumSubscriptionArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKForumSubscription *> *forumSubscriptions, NSError *error);
typedef void (^TSDKPaymentNoteArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKPaymentNote *> *paymentNotes, NSError *error);
typedef void (^TSDKTslPhotosArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKTslPhotos *> *tslPhotoses, NSError *error);
typedef void (^TSDKTeamResultsArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKTeamResults *> *teamResultses, NSError *error);
typedef void (^TSDKContactPhoneNumberArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKContactPhoneNumber *> *contactPhoneNumbers, NSError *error);
typedef void (^TSDKForumTopicArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKForumTopic *> *forumTopics, NSError *error);
typedef void (^TSDKCustomDatumArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKCustomDatum *> *customData, NSError *error);
typedef void (^TSDKMemberPaymentArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKMemberPayment *> *memberPayments, NSError *error);
typedef void (^TSDKMemberPhoneNumberArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKMemberPhoneNumber *> *memberPhoneNumbers, NSError *error);
typedef void (^TSDKPlanArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKPlan *> *plans, NSError *error);
typedef void (^TSDKOpponentArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKOpponent *> *opponents, NSError *error);
typedef void (^TSDKMemberArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKMember *> *members, NSError *error);
typedef void (^TSDKForumPostArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKForumPost *> *forumPosts, NSError *error);
typedef void (^TSDKEventArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKEvent *> *events, NSError *error);

#endif /* TSDKCompletionBlockTypes_h */
