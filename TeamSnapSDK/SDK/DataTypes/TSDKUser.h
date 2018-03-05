//
// Created by Jason Rahaim on 1/29/15.
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKRequestConfiguration.h"
#import "TSDKCompletionBlockTypes.h"
#import "TSDKCollectionObject.h"
#import "TSDKDataRequest.h"
#import "TSDKMessage.h"

typedef NS_ENUM(NSInteger,TSDKHighestRoleType) {
    TSDKHighestRoleTypeNonPlayer = 0,
    TSDKHighestRoleTypePlayer = 1,
    TSDKHighestRoleTypeManager = 2,
    TSDKHighestRoleTypeOwner = 3,
    TSDKHighestRoleTypeCommissioner = 4,
    TSDKHighestRoleTypeLeagueOwner = 5,
    TSDKHighestRoleTypeUnknown = 6
    
};

@interface TSDKUser : TSDKCollectionObject

@property (nonatomic, assign) NSInteger teamsCount;
@property (nonatomic, assign) NSInteger activeTeamsCount;
@property (nonatomic, assign) NSInteger managedDivisionsCount;
@property (nonatomic, assign) NSInteger facebookId;
@property (nonatomic, assign) BOOL receivesNewsletter;
@property (nonatomic, weak, nullable) NSDate * createdAt;
@property (nonatomic, weak, nullable) NSString * addressState;
@property (nonatomic, weak, nullable) NSDate * birthday;
@property (nonatomic, weak, nullable) NSString * firstName;
@property (nonatomic, weak, nullable) NSString * facebookAccessToken;
@property (nonatomic, weak, nullable) NSDate * updatedAt;
@property (nonatomic, weak, nullable) NSString * lastName;
@property (nonatomic, weak, nullable) NSString * email;
@property (nonatomic, weak, nullable) NSString * addressCountry;
@property (nonatomic, assign) BOOL displayAdsOnTeamList;
@property (nonatomic, weak, nullable) NSString * highestRole;
@property (nonatomic, assign) BOOL isAdmin; //Example: 0
@property (nonatomic, assign) BOOL isEligibleForFreeTrial; //Example: 0
@property (nonatomic, assign) BOOL hasCc; //Example: 0 
@property (nonatomic, weak, nullable) NSURL * linkAdvertisements;
@property (nonatomic, weak, nullable) NSURL * linkApnDevices;
@property (nonatomic, weak, nullable) NSURL * linkTeamsPreferences;
@property (nonatomic, weak, nullable) NSURL * linkPersonas;
@property (nonatomic, weak, nullable) NSURL * linkMessages;
@property (nonatomic, weak, nullable) NSURL * linkMessageData;
@property (nonatomic, weak, nullable) NSURL * linkFacebookPages;
@property (nonatomic, weak, nullable) NSURL * linkTeams;
@property (nonatomic, weak, nullable) NSURL * linkMembers;
@property (nonatomic, weak, nullable) NSURL * linkActiveTeams;
@property (nonatomic, weak, nullable) NSURL * linkDivisionMembers;
@property (nonatomic, weak, nullable) NSURL * linkTslMetadatum;
@property (nonatomic, weak, nullable) NSURL * linkDivisions;
@property (nonatomic, weak, nullable) NSURL * linkActiveDivisions;
@property (nonatomic, weak, nullable) NSURL * linkContacts;
@property (nonatomic, weak, nullable) NSURL * linkPayableInvoices;
@property (nonatomic, weak, nullable) NSURL * linkInvoicesAggregates;
@property (nonatomic, weak, nullable) NSURL * linkNextPayableInvoice;

// Non Auto-generated

@property (nonatomic, assign, readonly) TSDKHighestRoleType highestRoleKey;

+ (void)actionSendTrialExpiringReminderForCurrentUserWithCompletion:(TSDKSimpleCompletionBlock _Nullable)completion;
- (void)teamsWithIDs:(NSArray * _Nonnull)teamIds withConfiguration:(TSDKRequestConfiguration * _Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
- (void)bulkLoadDataTypes:(NSArray *_Nonnull)objectDataTypes forTeamIds:(NSArray *_Nonnull)teamIds withConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;

- (NSString *_Nonnull)fullName;
- (NSInteger)age;

@end

@interface TSDKUser (ForwardedMethods)

-(void)getAdvertisementsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKAdvertisementsArrayCompletionBlock _Nonnull)completion;
-(void)getApnDevicesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKApnDevicesArrayCompletionBlock _Nonnull)completion;
-(void)getTeamsPreferencesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamPreferencesArrayCompletionBlock _Nullable)completion;
-(void)getPersonasWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberArrayCompletionBlock _Nullable)completion;
-(void)getFacebookPagesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getTeamsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;
-(void)getMembersWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberArrayCompletionBlock _Nullable)completion;
-(void)getActiveTeamsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;
-(void)getMessagesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration type:(TSDKMessageType)type completion:(TSDKMessagesArrayCompletionBlock _Nullable)completion;
-(void)getMessageDataWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
- (void)getDivisionMembersWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKDivisionMembersArrayCompletionBlock _Nullable)completion;
-(void)getTslMetadatumWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
- (void)getDivisionsWithConfiguration:(TSDKRequestConfiguration * _Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getActiveDivisionsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getContactsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKContactArrayCompletionBlock _Nonnull)completion;
-(void)getPayableInvoicesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getInvoicesAggregatesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;
-(void)getNextPayableInvoiceWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;

@end
