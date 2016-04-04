//
// Created by Jason Rahaim on 1/29/15.
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKRequestConfiguration.h"
#import "TSDKCompletionBlockTypes.h"
#import "TSDKCollectionObject.h"
#import "TSDKDataRequest.h"
#import "TSDKProcessBulkObjectProtocol.h"
#import "TSDKMessage.h"

@interface TSDKUser : TSDKCollectionObject <TSDKProcessBulkObjectProtocol>

@property (nonatomic, assign) NSInteger teamsCount;
@property (nonatomic, assign) NSInteger facebookId;
@property (nonatomic, assign) BOOL receivesNewsletter;
@property (nonatomic, weak) NSDate *createdAt;
@property (nonatomic, weak) NSString *addressState;
@property (nonatomic, weak) NSDate *birthday;
@property (nonatomic, weak) NSString *firstName;
@property (nonatomic, weak) NSString *facebookAccessToken;
@property (nonatomic, weak) NSDate *updatedAt;
@property (nonatomic, weak) NSString *lastName;
@property (nonatomic, weak) NSString *email;
@property (nonatomic, weak) NSString *addressCountry;
@property (nonatomic, assign) BOOL isAdmin; //Example: 0
@property (nonatomic, weak) NSURL *linkTeamsPreferences;
@property (nonatomic, weak) NSURL *linkPersonas;
@property (nonatomic, weak) NSURL *linkMessages;
@property (nonatomic, weak) NSURL *linkMessageData;
@property (nonatomic, weak) NSURL *linkFacebookPages;
@property (nonatomic, weak) NSURL *linkTeams;
@property (nonatomic, weak) NSURL *linkMembers;
@property (nonatomic, weak) NSURL *linkActiveTeams;

// Non Auto-generated
+ (void)actionSendTrialExpiringReminderForCurrentUserWithCompletion:(TSDKSimpleCompletionBlock)completion;

- (void)TeamsWithIDs:(NSArray *)teamIds withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
- (void)myMembersOnTeamsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
- (NSArray *)myMembersAcrossAllTeams;
- (void)myMembersOnTeamId:(NSInteger)teamId withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
- (NSArray *)myMembersOnTeamId:(NSInteger)teamId;
- (void)bulkLoadDataTypes:(NSArray *)objectDataTypes forTeamIds:(NSArray *)teamIds withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
- (void)bulkLoadDataTypes:(NSArray *)objectDataTypes withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
- (void)loadTeamOverviewForMyTeamsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
- (void)addTeam:(TSDKTeam *)team;

@property (strong, nonatomic) NSMutableDictionary *teams;

@end

@interface TSDKUser (ForwardedMethods)

-(void)getTeamsPreferencesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamPreferencesArrayCompletionBlock)completion;
-(void)getPersonasWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberArrayCompletionBlock)completion;
-(void)getFacebookPagesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getTeamsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion;
-(void)getMembersWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberArrayCompletionBlock)completion;
-(void)getActiveTeamsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion;
-(void)getMessagesWithConfiguration:(TSDKRequestConfiguration *)configuration type:(TSDKMessageType)type completion:(TSDKMessagesArrayCompletionBlock)completion;
-(void)getMessageDataWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;@end