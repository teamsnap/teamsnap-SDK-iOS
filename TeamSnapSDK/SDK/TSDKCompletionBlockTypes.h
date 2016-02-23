//
//  TSDKCompletionBlockTypes.h
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 11/3/15.
//  Copyright © 2015 teamsnap. All rights reserved.
//

#ifndef TSDKCompletionBlockTypes_h
#define TSDKCompletionBlockTypes_h
@class TSDKinvitationFinder, UIImage, TSDKCollectionJSON, TSDKRootLinks, TSDKLocation,TSDKBroadcastEmail,TSDKBroadcastSms,TSDKContact,TSDKTeamResults,TSDKStatisticGroup,TSDKAvailability,TSDKUser,TSDKCustomField,TSDKMemberStatistic,TSDKTeamFee,TSDKTeamPreferences,TSDKPlan,TSDKContactEmailAddress,TSDKinvitationFinder,TSDKTeamStatistic,TSDKTeam,TSDKMemberPhoneNumber,TSDKCollectionObject,TSDKOpponent,TSDKEvent,TSDKForumPost,TSDKStatistic,TSDKTrackedItemStatus,TSDKSport,TSDKMemberEmailAddress,TSDKStatisticDatum,TSDKAssignment,TSDKTrackedItem,TSDKMember,TSDKCustomDatum,TSDKForumTopic,TSDKContactPhoneNumber;

typedef void (^TSDKJSONCompletionBlock)(BOOL success, BOOL complete, id objects, NSError *error);
typedef void (^TSDKSimpleCompletionBlock)(BOOL success, NSError *error);
typedef void (^TSDKRootLinkCompletionBlock)(TSDKRootLinks *rootLinks);
typedef void (^TSDKCompletionBlock)(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error);
typedef void (^TSDKInviteStatusCompletionBlock)(BOOL success, BOOL complete, TSDKinvitationFinder *objects, NSError *error);
typedef void (^TSDKLoginCompletionBlock)(BOOL success, NSString *OAuthToken, NSError *error);
typedef void (^TSDKArrayCompletionBlock)(BOOL success, BOOL complete, NSArray *objects, NSError *error);
typedef void (^TSDKDictionaryCompletionBlock)(BOOL success, BOOL complete, NSDictionary *objects, NSError *error);
typedef void (^TSDKImageCompletionBlock)(UIImage *image);

typedef void (^TSDKTeamFeeCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKTeamFee *> *teamFees, NSError *error);
typedef void (^TSDKTeamPreferencesCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKTeamPreferences *> *teamPreferencess, NSError *error);
typedef void (^TSDKCustomFieldCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKCustomField *> *customFields, NSError *error);
typedef void (^TSDKMemberStatisticCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKMemberStatistic *> *memberStatistics, NSError *error);
typedef void (^TSDKUserCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKUser *> *users, NSError *error);
typedef void (^TSDKStatisticGroupCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKStatisticGroup *> *statisticGroups, NSError *error);
typedef void (^TSDKAvailabilityCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKAvailability *> *availabilitys, NSError *error);
typedef void (^TSDKContactCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKContact *> *contacts, NSError *error);
typedef void (^TSDKTeamResultsCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKTeamResults *> *teamResultss, NSError *error);
typedef void (^TSDKBroadcastSmsCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKBroadcastSms *> *broadcastSmss, NSError *error);
typedef void (^TSDKBroadcastEmailCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKBroadcastEmail *> *broadcastEmails, NSError *error);
typedef void (^TSDKLocationCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKLocation *> *locations, NSError *error);
typedef void (^TSDKTrackedItemCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKTrackedItem *> *trackedItems, NSError *error);
typedef void (^TSDKMemberCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKMember *> *members, NSError *error);
typedef void (^TSDKAssignmentCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKAssignment *> *assignments, NSError *error);
typedef void (^TSDKMemberEmailAddressCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKMemberEmailAddress *> *memberEmailAddresss, NSError *error);
typedef void (^TSDKStatisticDatumCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKStatisticDatum *> *statisticDatums, NSError *error);
typedef void (^TSDKTrackedItemStatusCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKTrackedItemStatus *> *trackedItemStatuss, NSError *error);
typedef void (^TSDKSportCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKSport *> *sports, NSError *error);
typedef void (^TSDKStatisticCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKStatistic *> *statistics, NSError *error);
typedef void (^TSDKEventCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKEvent *> *events, NSError *error);
typedef void (^TSDKForumPostCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKForumPost *> *forumPosts, NSError *error);
typedef void (^TSDKOpponentCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKOpponent *> *opponents, NSError *error);
typedef void (^TSDKMemberPhoneNumberCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKMemberPhoneNumber *> *memberPhoneNumbers, NSError *error);
typedef void (^TSDKTeamCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKTeam *> *teams, NSError *error);
typedef void (^TSDKinvitationFinderCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKinvitationFinder *> *invitationFinders, NSError *error);
typedef void (^TSDKTeamStatisticCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKTeamStatistic *> *teamStatistics, NSError *error);
typedef void (^TSDKContactEmailAddressCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKContactEmailAddress *> *contactEmailAddresss, NSError *error);
typedef void (^TSDKPlanCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKPlan *> *plans, NSError *error);
typedef void (^TSDKForumTopicCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKForumTopic *> *forumTopics, NSError *error);
typedef void (^TSDKContactPhoneNumberCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKContactPhoneNumber *> *contactPhoneNumbers, NSError *error);
typedef void (^TSDKCustomDatumCompletionBlock)(BOOL success, BOOL complete, NSArray <TSDKCustomDatum *> *customDatums, NSError *error);

#endif /* TSDKCompletionBlockTypes_h */
