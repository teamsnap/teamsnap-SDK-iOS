//
//  TSDKRoster.h
//  SDKPlayground
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"
#import "TSDKProcessBulkObjectProtocol.h"

@interface TSDKMember : TSDKCollectionObject <TSDKProcessBulkObjectProtocol>

@property (nonatomic, assign) BOOL isInvited; //Example: 0
@property (nonatomic, assign) BOOL isInvitable; //Example: 0
@property (nonatomic, weak) NSDate *birthday; //Example: 1967-05-12
@property (nonatomic, assign) NSInteger hideAge; //Example: 0
@property (nonatomic, assign) BOOL isNonPlayer; //Example: 1
@property (nonatomic, weak) NSString *jerseyNumber; //Example: 19
@property (nonatomic, weak) NSString *addressCity; //Example: Fuquay-Varina
@property (nonatomic, weak) NSString *invitationCode; //Example: r53e4a619e54e39f2d93e14d2
@property (nonatomic, weak) NSString *addressZip; //Example: 27526
@property (nonatomic, weak) NSDate *lastLoggedInAt; //Example: 2015-09-16T22:34:28Z
@property (nonatomic, weak) NSString *position; //Example:
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, weak) NSString *addressState; //Example: NC
@property (nonatomic, assign) BOOL isOwner; //Example: 1
@property (nonatomic, assign) NSInteger userId; //Example: 388192
@property (nonatomic, weak) NSDate *updatedAt; //Example: 2015-09-16T22:34:28Z
@property (nonatomic, weak) NSString *lastName; //Example: R
@property (nonatomic, assign) BOOL hasFacebookPostScoresEnabled; //Example: 1
@property (nonatomic, assign) BOOL isOwnershipPending; //Example: <null>
@property (nonatomic, assign) NSInteger hideAddress; //Example: 0
@property (nonatomic, weak) NSString *invitationDeclined; //Example: **NULL**
@property (nonatomic, weak) NSString *addressStreet1; //Example: 716 Papsworth Ct.
@property (nonatomic, weak) NSString *gender; //Example: Male
@property (nonatomic, weak) NSDate *createdAt; //Example: 2012-03-25T23:46:02Z
@property (nonatomic, weak) NSString *addressStreet2; //Example: **NULL**
@property (nonatomic, weak) NSString *firstName; //Example: Jason
@property (nonatomic, assign) BOOL isActivated; //Example: 1
@property (nonatomic, assign) BOOL isManager; //Example: 1
@property (nonatomic, weak) NSURL *linkBroadcastEmails;
@property (nonatomic, weak) NSURL *linkBroadcastEmailAttachments;
@property (nonatomic, weak) NSURL *linkBroadcastSmses;
@property (nonatomic, weak) NSURL *linkMemberLinks;
@property (nonatomic, weak) NSURL *linkMemberPreferences;
@property (nonatomic, weak) NSURL *linkTeam;
@property (nonatomic, weak) NSURL *linkMemberPhoneNumbers;
@property (nonatomic, weak) NSURL *linkMemberPhoto;
@property (nonatomic, weak) NSURL *linkMemberEmailAddresses;
@property (nonatomic, weak) NSURL *linkStatisticData;
@property (nonatomic, weak) NSURL *linkForumSubscriptions;
@property (nonatomic, weak) NSURL *linkLeagueCustomData;
@property (nonatomic, weak) NSURL *linkContactPhoneNumbers;
@property (nonatomic, weak) NSURL *linkContactEmailAddresses;
@property (nonatomic, weak) NSURL *linkTeamMedia;
@property (nonatomic, weak) NSURL *linkMemberThumbnail;
@property (nonatomic, weak) NSURL *linkForumTopics;
@property (nonatomic, weak) NSURL *linkTeamMediumComments;
@property (nonatomic, weak) NSURL *linkCustomFields;
@property (nonatomic, weak) NSURL *linkAssignments;
@property (nonatomic, weak) NSURL *linkCustomData;
@property (nonatomic, weak) NSURL *linkMemberStatistics;
@property (nonatomic, weak) NSURL *linkAvailabilities;
@property (nonatomic, weak) NSURL *linkMemberBalances;
@property (nonatomic, weak) NSURL *linkTrackedItemStatuses;
@property (nonatomic, weak) NSURL *linkUser;
@property (nonatomic, weak) NSURL *linkForumPosts;
@property (nonatomic, weak) NSURL *linkMemberPayments;
@property (nonatomic, weak) NSURL *linkLeagueCustomFields;
@property (nonatomic, weak) NSURL *linkLeagueRegistrantDocuments;
@property (nonatomic, weak) NSURL *linkContacts;
@property (nonatomic, weak) NSURL *linkMemberFiles;

-(void)getBroadcastEmailsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getBroadcastEmailAttachmentsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getBroadcastSmsesWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getMemberLinksWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getMemberPreferencesWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getTeamWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getMemberPhoneNumbersWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getMemberEmailAddressesWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getStatisticDataWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getForumSubscriptionsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getLeagueCustomDataWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getContactPhoneNumbersWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getContactEmailAddressesWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getTeamMediaWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getForumTopicsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getTeamMediumCommentsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getCustomFieldsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getAssignmentsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getCustomDataWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getMemberStatisticsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getAvailabilitiesWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getMemberBalancesWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getTrackedItemStatusesWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getUserWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getForumPostsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getMemberPaymentsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getLeagueCustomFieldsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getLeagueRegistrantDocumentsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getContactsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getMemberFilesWithCompletion:(TSDKArrayCompletionBlock)completion;


// Not AutoGenerated:
-(void)getMemberPhotoWithCompletion:(TSDKImageCompletionBlock)completion;
-(void)getMemberThumbnailWithCompletion:(TSDKImageCompletionBlock)completion;


@property (readonly) NSString *fullName;
@property (assign, nonatomic) TSDKTeam *team;
@property (strong, nonatomic) NSMutableDictionary *contacts;
@property (strong, nonatomic) NSMutableDictionary *emailAddresses;
@property (strong, nonatomic) NSMutableDictionary *phoneNumbers;


- (BOOL)isAtLeastManager;
- (BOOL)isAtLeastOwner;

- (NSInteger)age;

@end
