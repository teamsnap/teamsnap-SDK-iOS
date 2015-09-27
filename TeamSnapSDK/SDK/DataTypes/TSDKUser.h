//
// Created by Jason Rahaim on 1/29/15.
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKDataRequest.h"


@interface TSDKUser : TSDKCollectionObject

@property (nonatomic) NSInteger teamsCount;
@property (nonatomic) NSInteger facebookId;
@property (nonatomic) BOOL receivesNewsletter;
@property (nonatomic, weak) NSDate *createdAt;
@property (nonatomic, weak) NSString *addressState;
@property (nonatomic, weak) NSDate *birthday;
@property (nonatomic, weak) NSString *firstName;
@property (nonatomic, weak) NSString *facebookAccessToken;
@property (nonatomic, weak) NSDate *updatedAt;
@property (nonatomic, weak) NSString *lastName;
@property (nonatomic, weak) NSString *email;
@property (nonatomic, weak) NSString *addressCountry;
@property (nonatomic) BOOL isAdmin; //Example: 0
@property (nonatomic, weak) NSURL *linkMembers;
@property (nonatomic, weak) NSURL *linkTeams;

-(void)getMembersWithCompletion:(TSDKArrayCompletionBlock)completion;

// Non Auto-generated
- (void)teamsWithCompletion:(TSDKArrayCompletionBlock)completion;
- (void)TeamsWithIDs:(NSArray *)teamIds completion:(TSDKArrayCompletionBlock)completion;
- (void)myMembersOnTeamsWithCompletion:(TSDKArrayCompletionBlock)completion;
- (void)myMembersOnTeamId:(NSInteger)teamId withCompletion:(TSDKArrayCompletionBlock)completion;

@end