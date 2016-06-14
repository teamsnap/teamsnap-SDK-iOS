//
//  TSDKCompletionBlockTypes.h
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 11/3/15.
//  Copyright © 2015 teamsnap. All rights reserved.
//

#ifndef TSDKCompletionBlockTypes_h
#define TSDKCompletionBlockTypes_h
@class TSDKinvitationFinder, UIImage, TSDKCollectionJSON, TSDKRootLinks,TSDKCustomDatum,TSDKForumTopic,TSDKContactPhoneNumber,TSDKEventStatistic,TSDKMemberPayment,TSDKMemberPhoneNumber,TSDKTeamMediumComment,TSDKTeamMediaGroup,TSDKStatisticDatum,TSDKAssignment,TSDKTrackedItem,TSDKMember,TSDKEvent,TSDKForumPost,TSDKMemberPreferences,TSDKCollectionObject,TSDKOpponent,TSDKPlan,TSDKContactEmailAddress,TSDKTeamMedium,TSDKinvitationFinder,TSDKTeamStatistic,TSDKTeam,TSDKTrackedItemStatus,TSDKSport,TSDKMemberEmailAddress,TSDKMemberBalance,TSDKContact,TSDKTeamResults,TSDKTslPhotos,TSDKPaymentNote,TSDKRootLinks,TSDKOpponentResults,TSDKStatistic,TSDKStatisticGroup,TSDKAvailability,TSDKUser,TSDKCustomField,TSDKMemberStatistic,TSDKTeamFee,TSDKTeamPreferences,TSDKLocation,TSDKBroadcastEmail,TSDKForumSubscription,TSDKBroadcastAlert, TSDKAvailabilityGroups, TSDKMessage, TSDKMessageDatum, TSDKDivisionMember, TSDKMemberPhoto;

typedef void (^TSDKJSONCompletionBlock)(BOOL success, BOOL complete, id _Nullable objects, NSError *_Nullable error);
typedef void (^TSDKSimpleCompletionBlock)(BOOL success, NSError *_Nullable error);
typedef void (^TSDKRootLinkCompletionBlock)(TSDKRootLinks *_Nullable rootLinks);
typedef void (^TSDKCompletionBlock)(BOOL success, BOOL complete, TSDKCollectionJSON *_Nullable objects, NSError *_Nullable error);
typedef void (^TSDKSaveCompletionBlock)(BOOL success, TSDKCollectionObject *_Nullable object, NSError *_Nullable error);
typedef void (^TSDKInviteStatusCompletionBlock)(BOOL success, BOOL complete, TSDKinvitationFinder *_Nullable objects, NSError *_Nullable error);
typedef void (^TSDKLoginCompletionBlock)(BOOL success, NSString *_Nullable OAuthToken, NSError *_Nullable error);
typedef void (^TSDKDictionaryCompletionBlock)(BOOL success, BOOL complete, NSDictionary *_Nullable objects, NSError *_Nullable error);


typedef void (^TSDKCustomDatumArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKCustomDatum *> *_Nullable customData, NSError *_Nullable error);
typedef void (^TSDKForumTopicArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKForumTopic *> *_Nullable forumTopics, NSError *_Nullable error);
typedef void (^TSDKContactPhoneNumberArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKContactPhoneNumber *> *_Nullable contactPhoneNumbers, NSError *_Nullable error);
typedef void (^TSDKEventStatisticArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKEventStatistic *> *_Nullable eventStatistics, NSError *_Nullable error);
typedef void (^TSDKMemberPaymentArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKMemberPayment *> *_Nullable memberPayments, NSError *_Nullable error);
typedef void (^TSDKMemberPhoneNumberArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKMemberPhoneNumber *> *_Nullable memberPhoneNumbers, NSError *_Nullable error);
typedef void (^TSDKTeamMediumCommentArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKTeamMediumComment *> *_Nullable teamMediumComments, NSError *_Nullable error);
typedef void (^TSDKTeamMediaGroupArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKTeamMediaGroup *> *_Nullable teamMediaGroups, NSError *_Nullable error);
typedef void (^TSDKStatisticDatumArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKStatisticDatum *> *_Nullable statisticData, NSError *_Nullable error);
typedef void (^TSDKAssignmentArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKAssignment *> *_Nullable assignments, NSError *_Nullable error);
typedef void (^TSDKTrackedItemArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKTrackedItem *> *_Nullable trackedItems, NSError *_Nullable error);
typedef void (^TSDKForumPostArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKForumPost *> *_Nullable forumPosts, NSError *_Nullable error);
typedef void (^TSDKMemberPreferencesArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKMemberPreferences *> *_Nullable memberPreferenceses, NSError *_Nullable error);
typedef void (^TSDKOpponentArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKOpponent *> *_Nullable opponents, NSError *_Nullable error);
typedef void (^TSDKPlanArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKPlan *> *_Nullable plans, NSError *_Nullable error);
typedef void (^TSDKContactEmailAddressArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKContactEmailAddress *> *_Nullable contactEmailAddresses, NSError *_Nullable error);
typedef void (^TSDKTeamMediumArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKTeamMedium *> *_Nullable teamMediums, NSError *_Nullable error);
typedef void (^TSDKinvitationFinderArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKinvitationFinder *> *_Nullable invitationFinders, NSError *_Nullable error);
typedef void (^TSDKTeamStatisticArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKTeamStatistic *> *_Nullable teamStatistics, NSError *_Nullable error);
typedef void (^TSDKTeamArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKTeam *> *_Nullable teams, NSError *_Nullable error);

typedef void (^TSDKTrackedItemStatusArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKTrackedItemStatus *> *_Nullable trackedItemStatuses, NSError *_Nullable error);
typedef void (^TSDKSportArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKSport *> *_Nullable sports, NSError *_Nullable error);
typedef void (^TSDKMemberEmailAddressArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKMemberEmailAddress *> *_Nullable memberEmailAddresses, NSError *_Nullable error);
typedef void (^TSDKMemberBalanceArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKMemberBalance *> *_Nullable memberBalances, NSError *_Nullable error);

typedef void (^TSDKTslPhotosArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKTslPhotos *> *_Nullable tslPhotoses, NSError *_Nullable error);
typedef void (^TSDKPaymentNoteArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKPaymentNote *> *_Nullable paymentNotes, NSError *_Nullable error);
typedef void (^TSDKOpponentResultsArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKOpponentResults *> *_Nullable opponentResultses, NSError *_Nullable error);
typedef void (^TSDKStatisticArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKStatistic *> *_Nullable statistics, NSError *_Nullable error);
typedef void (^TSDKStatisticGroupArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKStatisticGroup *> *_Nullable statisticGroups, NSError *_Nullable error);
typedef void (^TSDKAvailabilityArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKAvailability *> *_Nullable availabilities, NSError *_Nullable error);
typedef void (^TSDKUserArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKUser *> *_Nullable users, NSError *_Nullable error);
typedef void (^TSDKCustomFieldArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKCustomField *> *_Nullable customFields, NSError *_Nullable error);
typedef void (^TSDKMemberStatisticArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKMemberStatistic *> *_Nullable memberStatistics, NSError *_Nullable error);
typedef void (^TSDKTeamFeeArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKTeamFee *> *_Nullable teamFees, NSError *_Nullable error);

typedef void (^TSDKLocationArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKLocation *> *_Nullable locations, NSError *_Nullable error);
typedef void (^TSDKBroadcastEmailArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKBroadcastEmail *> *_Nullable broadcastEmails, NSError *_Nullable error);
typedef void (^TSDKForumSubscriptionArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKForumSubscription *> *_Nullable forumSubscriptions, NSError *_Nullable error);
typedef void (^TSDKBroadcastAlertArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKBroadcastAlert *> *_Nullable broadcastAlerts, NSError *_Nullable error);
typedef void (^TSDKAvailabilityGroupCompletionBlock)(BOOL success, BOOL complete, TSDKAvailabilityGroups *_Nullable availabilities, NSError *_Nullable error);

typedef void (^TSDKSimpleCompletionBlock)(BOOL success, NSError *_Nullable error);
typedef void (^TSDKMessagesArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKMessage *> * _Nullable messages, NSError *_Nullable error);
typedef void (^TSDKMessagesDatumArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKMessageDatum *> * _Nullable messageDatums, NSError *_Nullable error);
typedef void (^TSDKDivisionMembersArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKDivisionMember *> * _Nullable messages, NSError *_Nullable error);
typedef void (^TSDKCompletionBlock)(BOOL success, BOOL complete, TSDKCollectionJSON *_Nullable objects, NSError *_Nullable error);
typedef void (^TSDKArrayCompletionBlock)(BOOL success, BOOL complete, NSArray *_Nullable objects, NSError *_Nullable error);
typedef void (^TSDKMemberArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKMember *> * _Nullable members, NSError * _Nullable error);
typedef void (^TSDKRootLinkCompletionBlock)(TSDKRootLinks * _Nullable rootLinks);
typedef void (^TSDKTeamPreferencesArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKTeamPreferences *> * _Nullable teamsPreferences, NSError * _Nullable error);
typedef void (^TSDKTeamResultsArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKTeamResults *> * _Nullable teamsResults, NSError * _Nullable error);
typedef void (^TSDKEventArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKEvent *> * _Nullable events, NSError * _Nullable error);
typedef void (^TSDKImageCompletionBlock)(UIImage * _Nullable image);
typedef void (^TSDKContactArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKContact *> * _Nullable contacts, NSError * _Nullable error);
typedef void (^TSDKMemberPhotoArrayCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKMemberPhoto *> *_Nullable memberPhotos, NSError *_Nullable error);

#endif /* TSDKCompletionBlockTypes_h */
