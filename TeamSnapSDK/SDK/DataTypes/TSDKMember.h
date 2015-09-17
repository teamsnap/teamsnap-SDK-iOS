//
//  TSDKRoster.h
//  SDKPlayground
//
//  Created by Jason Rahaim on 1/31/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"

@interface TSDKMember : TSDKCollectionObject


@property (nonatomic, weak) NSDate *lastLoggedInAt; //Example: 2015-03-19T12:26:11Z
@property (nonatomic) BOOL isInvitable; //Example: <null>
@property (nonatomic) BOOL isNonPlayer; //Example: 0
@property (nonatomic, weak) NSDate *birthday; //Example: 2003-09-07
@property (nonatomic) NSInteger hideAge; //Example: 0
@property (nonatomic, weak) NSString *jerseyNumber; //Example: 10
@property (nonatomic, weak) NSString *addressCity; //Example: Willow Spring
@property (nonatomic, weak) NSString *invitationCode; //Example: **NULL**
@property (nonatomic, weak) NSString *addressZip; //Example: 27592
@property (nonatomic, weak) NSString *position; //Example: 1st, pitcher
@property (nonatomic) NSInteger teamId; //Example: 153832
@property (nonatomic) NSInteger userId; //Example: 581732
@property (nonatomic) BOOL isOwner; //Example: 1
@property (nonatomic, weak) NSString *addressState; //Example: NC
@property (nonatomic, weak) NSDate *updatedAt; //Example: 2015-03-19T12:26:11Z
@property (nonatomic, weak) NSString *lastName; //Example: Cargile
@property (nonatomic) BOOL isOwnershipPending; //Example: <null>
@property (nonatomic) NSInteger hideAddress; //Example: 1
@property (nonatomic, weak) NSString *invitationDeclined; //Example: **NULL**
@property (nonatomic, weak) NSString *addressStreet1; //Example: 7109 Pekin Drive
@property (nonatomic, weak) NSString *gender; //Example: Male
@property (nonatomic, weak) NSDate *createdAt; //Example: 2013-03-19T22:28:03Z
@property (nonatomic, weak) NSString *addressStreet2; //Example: **NULL**
@property (nonatomic, weak) NSString *firstName; //Example: Caden
@property (nonatomic) BOOL isActivated; //Example: <null>
@property (nonatomic) BOOL isManager; //Example: 1
@property (nonatomic, weak) NSURL *linkBroadcastEmails;
@property (nonatomic, weak) NSURL *linkMemberPreferences;
@property (nonatomic, weak) NSURL *linkBroadcastSmses;
@property (nonatomic, weak) NSURL *linkTeam;
@property (nonatomic, weak) NSURL *linkMemberPhoto;
@property (nonatomic, weak) NSURL *linkMemberPhoneNumbers;
@property (nonatomic, weak) NSURL *linkMemberEmailAddresses;
@property (nonatomic, weak) NSURL *linkForumSubscriptions;
@property (nonatomic, weak) NSURL *linkContactPhoneNumbers;
@property (nonatomic, weak) NSURL *linkContactEmailAddresses;
@property (nonatomic, weak) NSURL *linkMemberThumbnail;
@property (nonatomic, weak) NSURL *linkForumTopics;
@property (nonatomic, weak) NSURL *linkTrackedItemStatuses;
@property (nonatomic, weak) NSURL *linkCustomFields;
@property (nonatomic, weak) NSURL *linkAssignments;
@property (nonatomic, weak) NSURL *linkCustomData;
@property (nonatomic, weak) NSURL *linkUser;
@property (nonatomic, weak) NSURL *linkAvailabilities;
@property (nonatomic, weak) NSURL *linkForumPosts;
@property (nonatomic, weak) NSURL *linkMemberPayments;
@property (nonatomic, weak) NSURL *linkMemberLinks;
@property (nonatomic, weak) NSURL *linkContacts;
@property (nonatomic, weak) NSURL *linkMemberFiles;

@property (readonly) NSString *fullName;

@end
