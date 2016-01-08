//
// Created by Jason Rahaim on 1/29/15.
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKDataRequest.h"
#import "TSDKProcessBulkObjectProtocol.h"

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
@property (nonatomic, weak) NSURL *linkFacebookPages;
@property (nonatomic, weak) NSURL *linkTeams;
@property (nonatomic, weak) NSURL *linkMembers;
@property (nonatomic, weak) NSURL *linkActiveTeams;

// Non Auto-generated
- (void)teamsWithCompletion:(TSDKArrayCompletionBlock)completion;
- (void)TeamsWithIDs:(NSArray *)teamIds completion:(TSDKArrayCompletionBlock)completion;
- (void)myMembersOnTeamsWithCompletion:(TSDKArrayCompletionBlock)completion;
- (NSArray *)myMembersAcrossAllTeams;
- (void)myMembersOnTeamId:(NSInteger)teamId withCompletion:(TSDKArrayCompletionBlock)completion;
- (NSArray *)myMembersOnTeamId:(NSInteger)teamId;
- (void)bulkLoadDataTypes:(NSArray *)objectDataTypes forTeamIds:(NSArray *)teamIds WithCompletion:(TSDKArrayCompletionBlock)completion;
- (void)bulkLoadDataTypes:(NSArray *)objectDataTypes WithCompletion:(TSDKArrayCompletionBlock)completion;
- (void)loadTeamOverviewForMyTeamsWithCompletion:(TSDKArrayCompletionBlock)completion;
@end

@interface TSDKUser (ForwardedMethods)

-(void)getTeamsPreferencesWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getPersonasWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getFacebookPagesWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getTeamsWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getMembersWithCompletion:(TSDKArrayCompletionBlock)completion;
-(void)getActiveTeamsWithCompletion:(TSDKArrayCompletionBlock)completion;

@end