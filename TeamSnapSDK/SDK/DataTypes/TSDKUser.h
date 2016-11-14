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

@interface TSDKUser : TSDKCollectionObject

@property (nonatomic, assign) NSInteger teamsCount;
@property (nonatomic, assign) NSInteger managedDivisionsCount;
@property (nonatomic, assign) NSInteger facebookId;
@property (nonatomic, assign) BOOL receivesNewsletter;
@property (nonatomic, weak) NSDate *_Nullable createdAt;
@property (nonatomic, weak) NSString *_Nullable addressState;
@property (nonatomic, weak) NSDate *_Nullable birthday;
@property (nonatomic, weak) NSString *_Nullable firstName;
@property (nonatomic, weak) NSString *_Nullable facebookAccessToken;
@property (nonatomic, weak) NSDate *_Nullable updatedAt;
@property (nonatomic, weak) NSString *_Nullable lastName;
@property (nonatomic, weak) NSString *_Nullable email;
@property (nonatomic, weak) NSString *_Nullable addressCountry;
@property (nonatomic, assign) BOOL isAdmin; //Example: 0
@property (nonatomic, weak) NSURL *_Nullable linkTeamsPreferences;
@property (nonatomic, weak) NSURL *_Nullable linkPersonas;
@property (nonatomic, weak) NSURL *_Nullable linkMessages;
@property (nonatomic, weak) NSURL *_Nullable linkMessageData;
@property (nonatomic, weak) NSURL *_Nullable linkFacebookPages;
@property (nonatomic, weak) NSURL *_Nullable linkTeams;
@property (nonatomic, weak) NSURL *_Nullable linkMembers;
@property (nonatomic, weak) NSURL *_Nullable linkActiveTeams;
@property (nonatomic, weak) NSURL *_Nullable linkDivisionMembers;

// Non Auto-generated
+ (void)actionSendTrialExpiringReminderForCurrentUserWithCompletion:(TSDKSimpleCompletionBlock _Nullable)completion;

- (void)TeamsWithIDs:(NSArray *_Nonnull)teamIds withConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
- (void)myMembersOnTeamsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
- (void)myMembersOnTeamId:(NSInteger)teamId withConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
- (NSArray *_Nullable)myMembersOnTeamId:(NSInteger)teamId;
- (void)bulkLoadDataTypes:(NSArray *_Nonnull)objectDataTypes forTeamIds:(NSArray *_Nonnull)teamIds withConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
- (void)bulkLoadDataTypes:(NSArray *_Nonnull)objectDataTypes withConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
- (void)loadTeamOverviewForMyTeamsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
//- (void)addTeam:(TSDKTeam *_Nullable)team;

//@property (strong, nonatomic) NSMutableDictionary *_Nullable teams;

@end

@interface TSDKUser (ForwardedMethods)

-(void)getTeamsPreferencesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamPreferencesArrayCompletionBlock _Nullable)completion;
-(void)getPersonasWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberArrayCompletionBlock _Nullable)completion;
-(void)getFacebookPagesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getTeamsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;
-(void)getMembersWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberArrayCompletionBlock _Nullable)completion;
-(void)getActiveTeamsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;
-(void)getMessagesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration type:(TSDKMessageType)type completion:(TSDKMessagesArrayCompletionBlock _Nullable)completion;
-(void)getMessageDataWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
- (void)getDivisionMembersWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKDivisionMembersArrayCompletionBlock _Nullable)completion;
@end
