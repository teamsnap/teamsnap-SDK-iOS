//
//  TSDKRoster.h
//  SDKPlayground
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"
#import "TSDKMessage.h"
#import "TSDKMessageRecipient.h"
#import "TSDKMessageSender.h"

@class TSDKBackgroundUploadProgressMonitorDelegate;

@protocol TSDKMemberOrContactProtocol <NSObject>

@property (nonatomic, assign) BOOL isPushable; //Example: 1
@property (nonatomic, assign) BOOL isInvitable; //Example: 0
@property (nullable, nonatomic, weak) NSString *addressCity; //Example:
@property (nonatomic, assign) BOOL isAddressHidden; //Example: 0
@property (nullable, nonatomic, weak) NSString *addressZip; //Example: **NULL**
@property (nullable, nonatomic, weak) NSString *invitationCode; //Example: d3e4bd58170967126b089212
@property (nonatomic, weak) NSString *_Nullable userId; //Example: **NULL**
@property (nullable, nonatomic, weak) NSString *addressState; //Example:
@property (nonatomic, assign) BOOL isAlertable; //Example: 0
@property (nullable, nonatomic, weak) NSString *lastName; //Example: Rahaim
@property (nonatomic, assign) BOOL isEmailable; //Example: 0
@property (nullable, nonatomic, weak) NSString *addressStreet1; //Example:
@property (nullable, nonatomic, weak) NSString *addressStreet2; //Example:
@property (nullable, nonatomic, weak) NSString *invitationDeclined; //Example: **NULL**
@property (nullable, nonatomic, weak) NSString *firstName; //Example: Jack
@property (nullable, nonatomic, weak) NSDate *createdAt; //Example: 2015-11-02T19:01:32Z
@property (nullable, nonatomic, weak) NSDate *updatedAt; //Example: 2015-11-18T02:20:03Z
@property (nonatomic, weak) NSString *_Nullable teamId; //Example: 71118

- (nonnull NSString *)fullName;
- (nullable NSString *)fancyAddressString;
- (nullable NSString *)addressString;

@end

@protocol TSDKActiveMemberProtocol <NSObject>

@property (nonatomic, assign) BOOL isManager;
@property (nonatomic, assign) BOOL isOwner;
@property (nonatomic, assign) BOOL isCommissioner;
@property (nullable, nonatomic, weak) NSString *objectIdentifier;
- (nonnull NSString *)fullName;


@end

@interface TSDKMember : TSDKCollectionObject <TSDKMessageRecipient, TSDKMessageSender, TSDKMemberOrContactProtocol, TSDKActiveMemberProtocol>

@property (nonatomic, assign) BOOL isPushable; //Example: 1
@property (nullable, nonatomic, weak) NSString *lastName; //Example: Invite
@property (nullable, nonatomic, weak) NSDate *createdAt; //Example: 2015-11-02T19:01:32Z
@property (nonatomic, weak) NSString *_Nullable teamId; //Example: 71118
@property (nonatomic, assign) BOOL isOwnershipPending; //Example: <null>
@property (nullable, nonatomic, weak) NSString *addressStreet2; //Example: **NULL**
@property (nullable, nonatomic, weak) NSString *addressState; //Example: **NULL**
@property (nonatomic, assign) BOOL hasFacebookPostScoresEnabled; //Example: 0
@property (nullable, nonatomic, weak) NSString *invitationDeclined; //Example: **NULL**
@property (nonatomic, assign) BOOL isInvitable; //Example: 1
@property (nullable, nonatomic, weak) NSString *addressZip; //Example: **NULL**
@property (nullable, nonatomic, weak) NSString *lastLoggedInAt; //Example: **NULL**
@property (nullable, nonatomic, weak) NSString *invitationCode; //Example: d3e4bd58170967126b089212
@property (nullable, nonatomic, weak) NSString *position; //Example: **NULL**
@property (nullable, nonatomic, weak) NSDate *birthday; //Example:
@property (nonatomic, assign) BOOL isEmailable; //Example: 1
@property (nonatomic, assign) BOOL isInvited; //Example: 1
@property (nonatomic, assign) BOOL isActivated; //Example: 0
@property (nullable, nonatomic, weak) NSString *addressStreet1; //Example: **NULL**
@property (nonatomic, assign) BOOL isNonPlayer; //Example: 0
@property (nullable, nonatomic, weak) NSString *addressCity; //Example: **NULL**
@property (nonatomic, assign) BOOL isAgeHidden; //Example: <null>
@property (nullable, nonatomic, weak) NSString *firstName; //Example: 2nd
@property (nonatomic, assign) BOOL isManager; //Example: 0
@property (nullable, nonatomic, weak) NSString *jerseyNumber; //Example: **NULL**
@property (nonatomic, weak) NSString *_Nullable userId; //Example: **NULL**
@property (nullable, nonatomic, weak) NSString *gender; //Example: Male
@property (nonatomic, assign) BOOL isOwner; //Example: 0
@property (nonatomic, assign) BOOL isAddressHidden; //Example: <null>
@property (nullable, nonatomic, weak) NSDate *updatedAt; //Example: 2015-11-18T02:20:03Z
@property (nonatomic, assign) BOOL isAlertable; //Example: 0
@property (nonatomic, weak) NSString *_Nullable sourceMemberId;
@property (nullable, nonatomic, weak) NSURL *linkBroadcastEmails;
@property (nullable, nonatomic, weak) NSURL *linkBroadcastEmailAttachments;
@property (nullable, nonatomic, weak) NSURL *linkMemberLinks;
@property (nullable, nonatomic, weak) NSURL *linkMemberPreferences;
@property (nullable, nonatomic, weak) NSURL *linkTeam;
@property (nullable, nonatomic, weak) NSURL *linkMemberPhoneNumbers;
@property (nullable, nonatomic, weak) NSURL *linkMessages;
@property (nullable, nonatomic, weak) NSURL *linkMemberEmailAddresses;
@property (nullable, nonatomic, weak) NSURL *linkStatisticData;
@property (nullable, nonatomic, weak) NSURL *linkForumSubscriptions;
@property (nullable, nonatomic, weak) NSURL *linkLeagueCustomData;
@property (nullable, nonatomic, weak) NSURL *linkContactPhoneNumbers;
@property (nullable, nonatomic, weak) NSURL *linkContactEmailAddresses;
@property (nullable, nonatomic, weak) NSURL *linkTeamMedia;
@property (nullable, nonatomic, weak) NSURL *linkTrackedItemStatuses;
@property (nullable, nonatomic, weak) NSURL *linkForumTopics;
@property (nullable, nonatomic, weak) NSURL *linkTeamMediumComments;
@property (nullable, nonatomic, weak) NSURL *linkCustomFields;
@property (nullable, nonatomic, weak) NSURL *linkAssignments;
@property (nullable, nonatomic, weak) NSURL *linkCustomData;
@property (nullable, nonatomic, weak) NSURL *linkMemberStatistics;
@property (nullable, nonatomic, weak) NSURL *linkAvailabilities;
@property (nullable, nonatomic, weak) NSURL *linkMemberBalances;
@property (nullable, nonatomic, weak) NSURL *linkForumPosts;
@property (nullable, nonatomic, weak) NSURL *linkBroadcastAlerts;
@property (nullable, nonatomic, weak) NSURL *linkMemberPayments;
@property (nullable, nonatomic, weak) NSURL *linkLeagueCustomFields;
@property (nullable, nonatomic, weak) NSURL *linkLeagueRegistrantDocuments;
@property (nullable, nonatomic, weak) NSURL *linkContacts;
@property (nullable, nonatomic, weak) NSURL *linkMemberFiles;
@property (nullable, nonatomic, weak) NSURL *linkMemberPhoto;
@property (nullable, nonatomic, weak) NSURL *linkMemberThumbnail;
@property (nullable, nonatomic, weak) NSURL *linkMemberPhotos;

//+(void)actionRemoveMemberPhotoWithCompletion:(TSDKCompletionBlock)completion; //(null)
//+(void)actionDisableMemberWithCompletion:(TSDKCompletionBlock)completion; //(null)
//+(void)actionUploadMemberPhotoWithCompletion:(TSDKCompletionBlock)completion; //(null)
//+(void)actionGenerateMemberThumbnailWithCompletion:(TSDKCompletionBlock)completion; //(null)
//+(void)actionImportFromTeamWithCompletion:(TSDKCompletionBlock)completion; //(null)

// Not AutoGenerated:
- (void)getMemberPhotosForWidth:(NSInteger)width height:(NSInteger)height cropToFit:(BOOL)fitCrop configuration:(nonnull TSDKRequestConfiguration *)configuration completion:(nullable TSDKMemberPhotoArrayCompletionBlock)completion;

#if TARGET_OS_IPHONE
+(nonnull TSDKBackgroundUploadProgressMonitorDelegate *)actionUploadMemberPhotoFileURL:(nonnull NSURL *)photoFileURL memberId:(NSString *_Nonnull)memberId progress:(nullable TSDKUploadProgressBlock)progressBlock;
-(void)getMemberPhotoWithConfiguration:(nonnull TSDKRequestConfiguration *)configuration completion:(nullable TSDKImageCompletionBlock)completion;
-(void)getMemberThumbnailWithConfiguration:(nonnull TSDKRequestConfiguration *)configuration completion:(nullable TSDKImageCompletionBlock)completion;

// Returns the object that will receive the progress update callbacks so it can be stored immediately to an associated object and/or directly queried for the upload progress at any time (not just when the progress block is fired).
-(nullable TSDKBackgroundUploadProgressMonitorDelegate *)uploadMemberPhotoFileURL:(nonnull NSURL *)photoFileURL  progress:(nullable TSDKUploadProgressBlock)progressBlock;

#endif

@property (nonatomic, assign) BOOL isCommissioner;
- (BOOL)isAtLeastManager;
- (BOOL)isAtLeastOwner;


- (NSInteger)age;

@end

@interface TSDKMember (ForwardedMethods)

-(void)getBroadcastEmailsWithConfiguration:(nonnull TSDKRequestConfiguration *)configuration completion:(nullable TSDKBroadcastEmailArrayCompletionBlock)completion;
-(void)getBroadcastEmailAttachmentsWithConfiguration:(nonnull TSDKRequestConfiguration *)configuration completion:(nullable TSDKArrayCompletionBlock)completion;
-(void)getMemberLinksWithConfiguration:(nonnull TSDKRequestConfiguration *)configuration completion:(nullable TSDKArrayCompletionBlock)completion;
-(void)getMemberPreferencesWithConfiguration:(nonnull TSDKRequestConfiguration *)configuration completion:(nullable TSDKMemberPreferencesArrayCompletionBlock)completion;
-(void)getTeamWithConfiguration:(nonnull TSDKRequestConfiguration *)configuration completion:(nullable TSDKTeamArrayCompletionBlock)completion;
-(void)getMemberPhoneNumbersWithConfiguration:(nonnull TSDKRequestConfiguration *)configuration completion:(nullable TSDKMemberPhoneNumberArrayCompletionBlock)completion;
-(void)getMessagesWithConfiguration:(nonnull TSDKRequestConfiguration *)configuration type:(TSDKMessageType)type completion:(nullable TSDKMessagesArrayCompletionBlock)completion;
-(void)getMemberEmailAddressesWithConfiguration:(nonnull TSDKRequestConfiguration *)configuration completion:(nullable TSDKMemberEmailAddressArrayCompletionBlock)completion;
-(void)getStatisticDataWithConfiguration:(nonnull TSDKRequestConfiguration *)configuration completion:(nullable TSDKStatisticDatumArrayCompletionBlock)completion;
-(void)getForumSubscriptionsWithConfiguration:(nonnull TSDKRequestConfiguration *)configuration completion:(nullable TSDKForumSubscriptionArrayCompletionBlock)completion;
-(void)getLeagueCustomDataWithConfiguration:(nonnull TSDKRequestConfiguration *)configuration completion:(nullable TSDKCustomLeagueDatumArrayCompletionBlock)completion;
-(void)getContactPhoneNumbersWithConfiguration:(nonnull TSDKRequestConfiguration *)configuration completion:(nullable TSDKContactPhoneNumberArrayCompletionBlock)completion;
-(void)getContactEmailAddressesWithConfiguration:(nonnull TSDKRequestConfiguration *)configuration completion:(nullable TSDKContactEmailAddressArrayCompletionBlock)completion;
-(void)getTeamMediaWithConfiguration:(nonnull TSDKRequestConfiguration *)configuration completion:(nullable TSDKArrayCompletionBlock)completion;
-(void)getTrackedItemStatusesWithConfiguration:(nonnull TSDKRequestConfiguration *)configuration completion:(nullable TSDKTrackedItemStatusArrayCompletionBlock)completion;
-(void)getForumTopicsWithConfiguration:(nonnull TSDKRequestConfiguration *)configuration completion:(nullable TSDKForumTopicArrayCompletionBlock)completion;
-(void)getTeamMediumCommentsWithConfiguration:(nonnull TSDKRequestConfiguration *)configuration completion:(nullable TSDKTeamMediumCommentArrayCompletionBlock)completion;
-(void)getCustomFieldsWithConfiguration:(nonnull TSDKRequestConfiguration *)configuration completion:(nullable TSDKCustomFieldArrayCompletionBlock)completion;
-(void)getAssignmentsWithConfiguration:(nonnull TSDKRequestConfiguration *)configuration completion:(nullable TSDKAssignmentArrayCompletionBlock)completion;
-(void)getCustomDataWithConfiguration:(nonnull TSDKRequestConfiguration *)configuration completion:(nullable TSDKCustomDatumArrayCompletionBlock)completion;
-(void)getMemberStatisticsWithConfiguration:(nonnull TSDKRequestConfiguration *)configuration completion:(nullable TSDKMemberStatisticArrayCompletionBlock)completion;
-(void)getAvailabilitiesWithConfiguration:(nonnull TSDKRequestConfiguration *)configuration completion:(nullable TSDKAvailabilityArrayCompletionBlock)completion;
-(void)getMemberBalancesWithConfiguration:(nonnull TSDKRequestConfiguration *)configuration completion:(nullable TSDKMemberBalanceArrayCompletionBlock)completion;
-(void)getUserWithConfiguration:(nonnull TSDKRequestConfiguration *)configuration completion:(nullable TSDKUserArrayCompletionBlock)completion;
-(void)getForumPostsWithConfiguration:(nonnull TSDKRequestConfiguration *)configuration completion:(nullable TSDKForumPostArrayCompletionBlock)completion;
-(void)getBroadcastAlertsWithConfiguration:(nonnull TSDKRequestConfiguration *)configuration completion:(nullable TSDKBroadcastAlertArrayCompletionBlock)completion;
-(void)getMemberPaymentsWithConfiguration:(nonnull TSDKRequestConfiguration *)configuration completion:(nullable TSDKMemberPaymentArrayCompletionBlock)completion;
-(void)getLeagueCustomFieldsWithConfiguration:(nonnull TSDKRequestConfiguration *)configuration completion:(nullable TSDKLeagueCustomFieldArrayCompletionBlock)completion;
-(void)getLeagueRegistrantDocumentsWithConfiguration:(nonnull TSDKRequestConfiguration *)configuration completion:(nullable TSDKArrayCompletionBlock)completion;
-(void)getContactsWithConfiguration:(nonnull TSDKRequestConfiguration *)configuration completion:(nullable TSDKContactArrayCompletionBlock)completion;
-(void)getMemberFilesWithConfiguration:(nonnull TSDKRequestConfiguration *)configuration completion:(nullable TSDKArrayCompletionBlock)completion;

@end
