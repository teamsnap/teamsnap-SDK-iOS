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
#import "TSDKCompletionBlockTypes.h"
NS_ASSUME_NONNULL_BEGIN
@class TSDKBackgroundUploadProgressMonitorDelegate;
@class TSDKDivision;

@protocol TSDKMemberOrContactProtocol <NSObject>

@property (nonatomic, assign) BOOL isPushable; //Example: 1
@property (nonatomic, assign) BOOL isInvitable; //Example: 0
@property (nullable, nonatomic, strong) NSString *addressCity; //Example:
@property (nonatomic, assign) BOOL isAddressHidden; //Example: 0
@property (nullable, nonatomic, strong) NSString *addressZip; //Example: **NULL**
@property (nullable, nonatomic, strong) NSString *invitationCode; //Example: d3e4bd58170967126b089212
@property (nullable, nonatomic, strong) NSString *userId; //Example: **NULL**
@property (nullable, nonatomic, strong) NSString *addressState; //Example:
@property (nonatomic, assign) BOOL isAlertable; //Example: 0
@property (nullable, nonatomic, strong) NSString *lastName; //Example: Rahaim
@property (nonatomic, assign) BOOL isEmailable; //Example: 0
@property (nullable, nonatomic, strong) NSString *addressStreet1; //Example:
@property (nullable, nonatomic, strong) NSString *addressStreet2; //Example:
@property (nullable, nonatomic, strong) NSString *invitationDeclined; //Example: **NULL**
@property (nullable, nonatomic, strong) NSString *firstName; //Example: Jack
@property (nullable, nonatomic, strong) NSDate *createdAt; //Example: 2015-11-02T19:01:32Z
@property (nullable, nonatomic, strong) NSDate *updatedAt; //Example: 2015-11-18T02:20:03Z
@property (nullable, nonatomic, strong) NSString *teamId; //Example: 71118
@property (nonatomic, assign) BOOL isManager; //Example: 1
@property (nonatomic, assign) BOOL isOwner; //Example: 1
@property (nonatomic, assign) BOOL isCommissioner; //Example: 0
@property (nonatomic, assign) BOOL isLeagueOwner; //Example: 0
@property (nonatomic, assign) BOOL isDeletable; //Example: 0

- (NSString *)objectIdentifier;
- (NSString *)fullName;
- (nullable NSString *)fancyAddressString;
- (nullable NSString *)addressString;

/**
 Manager is the lowest level of permission set. Above it is Owner and Commissioner. This convenience method checks isManager OR isOwner OR isCommissioner as that's what most permissions are based on.

 @return true is the member/contact is the manager, or owner, or commissioner.
 */
- (BOOL)isAtLeastManager;

@end

typedef NS_CLOSED_ENUM(NSUInteger, TSDKMemberGender) {
    TSDKMemberGenderFemale,
    TSDKMemberGenderMale,
    TSDKMemberGenderUnknown,
};

@interface TSDKMember : TSDKCollectionObject <TSDKMessageRecipient, TSDKMessageSender, TSDKMemberOrContactProtocol>

@property (nullable, nonatomic, strong) NSString *lastName; //Example: Seamans
@property (nullable, nonatomic, strong) NSDate *createdAt; //Example: 2016-11-17T20:29:40Z
@property (nullable, nonatomic, strong) NSString *teamId; //Example: 2419116
@property (nonatomic, assign) BOOL hideAddress; //Example: 0
@property (nonatomic, assign) BOOL isOwnershipPending; //Example: 0
@property (nullable, nonatomic, strong) NSString *addressStreet2; //Example: **NULL**
@property (nonatomic, assign) BOOL isPushable; //Example: 1
@property (nullable, nonatomic, strong) NSString *addressState; //Example: **NULL**
@property (nonatomic, assign) BOOL hasFacebookPostScoresEnabled; //Example: 0
@property (nonatomic, assign) BOOL hideAge; //Example: 0
@property (nullable, nonatomic, strong) NSString *invitationDeclined; //Example: **NULL**
@property (nonatomic, assign) BOOL isInvitable; //Example: 0
@property (nullable, nonatomic, strong) NSString *divisionId; //Example: <null>
@property (nullable, nonatomic, strong) NSString *addressZip; //Example: **NULL**
@property (nullable, nonatomic, strong) NSDate *lastLoggedInAt; //Example: <null>
@property (nullable, nonatomic, strong) NSString *invitationCode; //Example: **NULL**
@property (nullable, nonatomic, strong) NSString *position; //Example: **NULL**
@property (nullable, nonatomic, strong) NSDate *birthday; //Example:
@property (nonatomic, assign) BOOL isEmailable; //Example: 1
@property (nonatomic, assign) BOOL isLeagueOwner; //Example: 0
@property (nonatomic, assign) BOOL isInvited; //Example: 0
@property (nonatomic, assign) BOOL isActivated; //Example: 1
@property (nullable, nonatomic, strong) NSString *sourceMemberId; //Example: <null>
@property (nullable, nonatomic, strong) NSString *addressStreet1; //Example: **NULL**
@property (nonatomic, assign) BOOL isNonPlayer; //Example: 0
@property (nullable, nonatomic, strong) NSString *addressCity; //Example: **NULL**
@property (nonatomic, assign) BOOL isAgeHidden; //Example: 0
@property (nullable, nonatomic, strong) NSString *firstName; //Example: Skyler
@property (nonatomic, assign) BOOL isManager; //Example: 1
@property (nullable, nonatomic, strong) NSString *jerseyNumber; //Example: **NULL**
@property (nullable, nonatomic, strong) NSString *userId; //Example: 2971597
@property (nonatomic, assign) BOOL isOwner; //Example: 1
@property (nonatomic, assign) BOOL isAddressHidden; //Example: 0
@property (nullable, nonatomic, strong) NSDate *updatedAt; //Example: 2016-11-17T20:29:40Z
@property (nonatomic, assign) BOOL isCommissioner; //Example: 0
@property (nonatomic, assign) BOOL isAlertable; //Example: 0
@property (nonatomic, assign) BOOL isShownUnreachableForChatBanner; //Example: 0 
@property (nullable, nonatomic, strong) NSURL *linkBroadcastEmails;
@property (nullable, nonatomic, strong) NSURL *linkLeagueCustomFields;
@property (nullable, nonatomic, strong) NSURL *linkForumSubscriptions;
@property (nullable, nonatomic, strong) NSURL *linkMessages;
@property (nullable, nonatomic, strong) NSURL *linkContactEmailAddresses;
@property (nullable, nonatomic, strong) NSURL *linkTeam;
@property (nullable, nonatomic, strong) NSURL *linkLeagueCustomData;
@property (nullable, nonatomic, strong) NSURL *linkMemberStatistics;
@property (nullable, nonatomic, strong) NSURL *linkForumPosts;
@property (nullable, nonatomic, strong) NSURL *linkTeamMedia;
@property (nullable, nonatomic, strong) NSURL *linkMemberPhotos;
@property (nullable, nonatomic, strong) NSURL *linkMessageData;
@property (nullable, nonatomic, strong) NSURL *linkAssignments;
@property (nullable, nonatomic, strong) NSURL *linkMemberRegistrationSignups;
@property (nullable, nonatomic, strong) NSURL *linkMemberAssignments;
@property (nullable, nonatomic, strong) NSURL *linkUser;
@property (nullable, nonatomic, strong) NSURL *linkTeamMediumComments;
@property (nullable, nonatomic, strong) NSURL *linkMemberPhoneNumbers __attribute__((deprecated));
@property (nullable, nonatomic, strong) NSURL *linkContacts;
@property (nullable, nonatomic, strong) NSURL *linkMemberBalances;
@property (nullable, nonatomic, strong) NSURL *linkContactPhoneNumbers;
@property (nullable, nonatomic, strong) NSURL *linkCustomFields;
@property (nullable, nonatomic, strong) NSURL *linkMemberPayments;
@property (nullable, nonatomic, strong) NSURL *linkCustomData;
@property (nullable, nonatomic, strong) NSURL *linkTrackedItemStatuses;
@property (nullable, nonatomic, strong) NSURL *linkBroadcastAlerts;
@property (nullable, nonatomic, strong) NSURL *linkMemberFiles;
@property (nullable, nonatomic, strong) NSURL *linkMemberLinks;
@property (nullable, nonatomic, strong) NSURL *linkAvailabilities;
@property (nullable, nonatomic, strong) NSURL *linkBroadcastEmailAttachments;
@property (nullable, nonatomic, strong) NSURL *linkMemberEmailAddresses __attribute__((deprecated));
@property (nullable, nonatomic, strong) NSURL *linkStatisticData;
@property (nullable, nonatomic, strong) NSURL *linkForumTopics;
@property (nullable, nonatomic, strong) NSURL *linkDivision;
@property (nullable, nonatomic, strong) NSURL *linkLeagueRegistrantDocuments;
@property (nullable, nonatomic, strong) NSURL *linkMemberPreferences;
@property (nullable, nonatomic, strong) NSURL *linkMemberThumbnail;
@property (nullable, nonatomic, strong) NSURL *linkMemberPhoto;
@property (nonatomic, strong, nullable) NSURL * linkMemberPhotoFile;

// Not AutoGenerated:
/**
 Returns a URL with the correct cropping parameters appended. This URL uses "smart" fill cropping to crop using face detection.

 @param size the width and height of the image requested
 @return A fully specified URL for the photo
 */
- (NSURL * _Nullable)memberPhotoURL;
- (NSURL * _Nullable)memberPhotoURLForSize:(CGSize)size;

/**
 Deprecated. Use memberPhotoURLForWidth: instead.

 @param width the width of the image
 @param height the height of the image
 @param fitCrop If true, crop = fill
 @param configuration A SDK request configuration object
 @param completion A completion returning the image
 */
- (void)getMemberPhotosForWidth:(NSInteger)width height:(NSInteger)height cropToFit:(BOOL)fitCrop configuration:(nonnull TSDKRequestConfiguration *)configuration completion:(nullable TSDKMemberPhotoArrayCompletionBlock)completion __attribute__((deprecated));

+ (NSURL * _Nullable)commissionerQueryFor:(TSDKDivision * _Nonnull)division;

#if TARGET_OS_IPHONE
+(nonnull TSDKBackgroundUploadProgressMonitorDelegate *)actionUploadMemberPhotoFileURL:(nonnull NSURL *)photoFileURL memberId:(NSString *_Nonnull)memberId progress:(nullable TSDKUploadProgressBlock)progressBlock;

/**
 Deprecated. Use memberPhotoURLForWidth: instead.

 @param configuration A SDK request configuration object
 @param completion A completion returning the image
 */
-(void)getMemberPhotoWithConfiguration:(nonnull TSDKRequestConfiguration *)configuration completion:(nullable TSDKImageCompletionBlock)completion __attribute__((deprecated));

/**
 Deprecated. Use memberPhotoURLForWidth: instead.
 
 @param configuration A SDK request configuration object
 @param completion A completion returning the image
 */
-(void)getMemberThumbnailWithConfiguration:(nonnull TSDKRequestConfiguration *)configuration completion:(nullable TSDKImageCompletionBlock)completion __attribute__((deprecated));

// Returns the object that will receive the progress update callbacks so it can be stored immediately to an associated object and/or directly queried for the upload progress at any time (not just when the progress block is fired).
-(nullable TSDKBackgroundUploadProgressMonitorDelegate *)uploadMemberPhotoFileURL:(nonnull NSURL *)photoFileURL  progress:(nullable TSDKUploadProgressBlock)progressBlock;

#endif

- (NSInteger)age;

- (TSDKMemberGender)gender;
- (void)setGender:(TSDKMemberGender)gender;
+ (nullable NSString *)stringFromGender:(TSDKMemberGender)gender;

//Delete one or many members.
//+(void)actionBulkDeleteMemberid:(NSString *_Nonnull)memberId WithCompletion:(TSDKCompletionBlock _Nullable)completion;

//+(void)actionRemoveMemberPhotoMemberid:(NSString *_Nonnull)memberId WithCompletion:(TSDKCompletionBlock _Nullable)completion;

//Given source_member_ids (array) and a destination_team_id, source members and related member data will be imported to the destination team. Newly created members will be returned.
//+(void)actionImportFromTeamDestinationteamid:(NSString *_Nonnull)destinationTeamId sendInvites:(NSString *_Nonnull)sendInvites sourceMemberIds:(NSString *_Nonnull)sourceMemberIds WithCompletion:(TSDKCompletionBlock _Nullable)completion;

//+(void)actionDisableMemberMemberid:(NSString *_Nonnull)memberId WithCompletion:(TSDKCompletionBlock _Nullable)completion;

//+(void)actionUploadMemberPhotoY:(NSString *_Nonnull)y height:(NSString *_Nonnull)height memberId:(NSString *_Nonnull)memberId file:(NSString *_Nonnull)file x:(NSString *_Nonnull)x width:(NSString *_Nonnull)width WithCompletion:(TSDKCompletionBlock _Nullable)completion;

//+(void)actionGenerateMemberThumbnailY:(NSString *_Nonnull)y memberId:(NSString *_Nonnull)memberId x:(NSString *_Nonnull)x width:(NSString *_Nonnull)width height:(NSString *_Nonnull)height WithCompletion:(TSDKCompletionBlock _Nullable)completion;

//+(void)actionSetCommissionerAccessMemberid:(NSString *_Nonnull)memberId divisionId:(NSString *_Nonnull)divisionId WithCompletion:(TSDKCompletionBlock _Nullable)completion;

//Move one or many members to a new division and/or team.
//+(void)actionMoveMemberMemberid:(NSString *_Nonnull)memberId divisionId:(NSString *_Nonnull)divisionId teamId:(NSString *_Nonnull)teamId WithCompletion:(TSDKCompletionBlock _Nullable)completion;

+ (void)querySearchId:(NSString *_Nullable)id pageNumber:(NSInteger)pageNumber userId:(NSString *_Nullable)userId teamId:(NSString *_Nullable)teamId divisionId:(NSString *_Nullable)divisionId pageSize:(NSInteger)pageSize WithCompletion:(TSDKMemberArrayCompletionBlock _Nullable)completion;

+ (void)queryCommissionersTeamid:(NSString *_Nullable)teamId divisionId:(NSString *_Nonnull)divisionId WithCompletion:(TSDKMemberArrayCompletionBlock _Nullable)completion;

//Given a user ID, returns members directly associated with the user as well as members associated with the user via a shared access contact.
//+(void)queryPersonasUserid:(NSString *_Nonnull)userId WithCompletion:(TSDKCompletionBlock _Nullable)completion;

//+(void)queryOwnerTeamid:(NSString *_Nonnull)teamId WithCompletion:(TSDKCompletionBlock _Nullable)completion;

//Given a user ID, returns all members associated with user's active season teams.  If include_archived_teams (boolean) parameter is supplied, members associated with archived teams will be returned as well.
//+(void)queryImportableMembersUserid:(NSString *_Nonnull)userId includeArchivedTeams:(NSString *_Nonnull)includeArchivedTeams WithCompletion:(TSDKCompletionBlock _Nullable)completion;

//BETA: (This endpoint subject to change) Searches the division and subdivision for the members meeting the search criteria. Searches using this endpoint accept additional parameters. You can search for equality by formatting the string as 'operator:equals,value:<SEARCH STRING>'. You may search for additional parameters by sending them as an array, for instance: ?birthday[]=operator:less_than,value:2016-02-02&birthday[]=operator:greater_than,value:2010-02-02.
//+(void)queryAdvancedDivisionSearchEmail:(NSString *_Nonnull)email pageNumber:(NSString *_Nonnull)pageNumber isOwner:(NSString *_Nonnull)isOwner isManager:(NSString *_Nonnull)isManager isCommissioner:(NSString *_Nonnull)isCommissioner isAssigned:(NSString *_Nonnull)isAssigned customField:(NSString *_Nonnull)customField birthday:(NSString *_Nonnull)birthday firstName:(NSString *_Nonnull)firstName registrationFormId:(NSString *_Nonnull)registrationFormId isOwnershipPending:(NSString *_Nonnull)isOwnershipPending pageSize:(NSString *_Nonnull)pageSize lastName:(NSString *_Nonnull)lastName teamId:(NSString *_Nonnull)teamId gender:(NSString *_Nonnull)gender divisionId:(NSString *_Nonnull)divisionId WithCompletion:(TSDKCompletionBlock _Nullable)completion;

//BETA: (This endpoint subject to change) Searches the division and subdivision for the members meeting the search criteria.
//+(void)queryDivisionSearchPagenumber:(NSString *_Nonnull)pageNumber divisionId:(NSString *_Nonnull)divisionId isCommissioner:(NSString *_Nonnull)isCommissioner isActivated:(NSString *_Nonnull)isActivated isUnassigned:(NSString *_Nonnull)isUnassigned isOwnershipPending:(NSString *_Nonnull)isOwnershipPending pageSize:(NSString *_Nonnull)pageSize WithCompletion:(TSDKCompletionBlock _Nullable)completion;

//+(void)queryManagersTeamid:(NSString *_Nonnull)teamId WithCompletion:(TSDKCompletionBlock _Nullable)completion;

@end

@interface TSDKMember (ForwardedMethods)

-(void)getBroadcastEmailsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKBroadcastEmailArrayCompletionBlock _Nonnull)completion;
-(void)getLeagueCustomFieldsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKLeagueCustomFieldArrayCompletionBlock _Nonnull)completion;
-(void)getForumSubscriptionsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKForumSubscriptionArrayCompletionBlock _Nonnull)completion;
-(void)getMessagesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getContactEmailAddressesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKContactEmailAddressArrayCompletionBlock _Nonnull)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nonnull)completion;
-(void)getLeagueCustomDataWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getMemberStatisticsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberStatisticArrayCompletionBlock _Nonnull)completion;
-(void)getForumPostsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKForumPostArrayCompletionBlock _Nonnull)completion;
-(void)getTeamMediaWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamMediumArrayCompletionBlock _Nonnull)completion;
-(void)getMemberPhotosWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberPhotoArrayCompletionBlock _Nonnull)completion;
-(void)getMessageDataWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getAssignmentsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKAssignmentArrayCompletionBlock _Nonnull)completion;
-(void)getMemberRegistrationSignupsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getMemberAssignmentsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberAssignmentArrayCompletionBlock _Nonnull)completion;
-(void)getUserWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKUserArrayCompletionBlock _Nonnull)completion;
-(void)getTeamMediumCommentsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamMediumCommentArrayCompletionBlock _Nonnull)completion;
-(void)getMemberPhoneNumbersWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberPhoneNumberArrayCompletionBlock _Nonnull)completion __attribute__((deprecated));
-(void)getContactsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKContactArrayCompletionBlock _Nonnull)completion;
-(void)getMemberBalancesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberBalanceArrayCompletionBlock _Nonnull)completion;
-(void)getContactPhoneNumbersWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKContactPhoneNumberArrayCompletionBlock _Nonnull)completion;
-(void)getCustomFieldsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKCustomFieldArrayCompletionBlock _Nonnull)completion;
-(void)getMemberPaymentsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberPaymentArrayCompletionBlock _Nonnull)completion;
-(void)getCustomDataWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKCustomDatumArrayCompletionBlock _Nonnull)completion;
-(void)getTrackedItemStatusesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTrackedItemStatusArrayCompletionBlock _Nonnull)completion;
-(void)getBroadcastAlertsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKBroadcastAlertArrayCompletionBlock _Nonnull)completion;
-(void)getMemberFilesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getMemberLinksWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getAvailabilitiesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKAvailabilityArrayCompletionBlock _Nonnull)completion;
-(void)getBroadcastEmailAttachmentsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getMemberEmailAddressesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberEmailAddressArrayCompletionBlock _Nonnull)completion __attribute__((deprecated)); 
-(void)getStatisticDataWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKStatisticDatumArrayCompletionBlock _Nonnull)completion;
-(void)getForumTopicsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKForumTopicArrayCompletionBlock _Nonnull)completion;
-(void)getDivisionWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getLeagueRegistrantDocumentsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getMemberPreferencesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberPreferencesArrayCompletionBlock _Nonnull)completion;


@end
NS_ASSUME_NONNULL_END
