//
// Created by Jason Rahaim on 1/29/15.
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKUser.h"
#import "TSDKObjectsRequest.h"
#import "TSDKMember.h"
#import "TSDKTeamPreferences.h"
#import "TSDKTeam.h"
#import "TSDKPlan.h"
#import "TSDKTeamResults.h"
#import "NSMutableDictionary+integerKey.h"
#import "NSMutableDictionary+refreshCollectionData.h"

@interface TSDKUser()

@property (strong, nonatomic) NSMutableArray *myMembersOnTeams;

@end

@implementation TSDKUser {

}

@dynamic teamsCount, facebookId, receivesNewsletter, createdAt, addressState, birthday, firstName, facebookAccessToken, updatedAt, lastName, email, addressCountry, isAdmin, linkTeamsPreferences, linkPersonas, linkFacebookPages, linkTeams, linkMembers, linkActiveTeams, linkMessageData;

+ (NSString *)SDKType {
    return @"user";
}

- (NSMutableDictionary *)teams {
    if (!_teams) {
        _teams = [[NSMutableDictionary alloc] init];
    }
    return _teams;
}

- (void)addTeam:(TSDKTeam *)team {
    [self.teams refreshCollectionObject:team];
}

- (NSMutableArray *)myMembersOnTeams {
    if (!_myMembersOnTeams) {
        _myMembersOnTeams = [[NSMutableArray alloc] init];
    }
    return _myMembersOnTeams;
}

- (void)addMember:(TSDKMember *)newMember {
    NSUInteger existingMember = [self.myMembersOnTeams indexOfObjectPassingTest:^BOOL(TSDKMember  *member, NSUInteger idx, BOOL * _Nonnull stop) {
        return (member.objectIdentifier == newMember.objectIdentifier);
    }];
    
    if (existingMember != NSNotFound) {
        [self.myMembersOnTeams removeObjectAtIndex:existingMember];
    }
    [self.myMembersOnTeams addObject:newMember];
}

- (void)myMembersOnTeamsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion {
    if (_myMembersOnTeams) {
        if (completion) {
            completion(YES, YES, _myMembersOnTeams, nil);
        }
    } else {
        [self getPersonasWithConfiguration:configuration completion:completion];
    }
}

-(void)getPersonasWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberArrayCompletionBlock)completion {
    __typeof__(self) __weak weakSelf = self;
    [self arrayFromLink:self.linkPersonas withConfiguration:configuration completion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
        for (TSDKMember *member in objects) {
            [weakSelf addMember:member];
        }
        if (completion) {
            completion(success, complete, weakSelf.myMembersOnTeams, nil);
        }
    }];
}

- (void)myMembersOnTeamId:(NSInteger)teamId withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion {
    [self myMembersOnTeamsWithConfiguration:configuration completion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
        NSArray *resultMembers = nil;
        if (success) {
            NSIndexSet *memberIndexes = [objects indexesOfObjectsPassingTest:^BOOL(TSDKMember *member, NSUInteger idx, BOOL * _Nonnull stop) {
                return (member.teamId == teamId);
            }];
            resultMembers = [objects objectsAtIndexes:memberIndexes];

        }
        if (completion) {
            completion(success, complete, resultMembers, error);
        }
    }];
}

- (NSArray *)myMembersAcrossAllTeams {
    return _myMembersOnTeams;
}

- (NSArray *)myMembersOnTeamId:(NSInteger)teamId {
    NSIndexSet *memberIndexes = [_myMembersOnTeams indexesOfObjectsPassingTest:^BOOL(TSDKMember *member, NSUInteger idx, BOOL * _Nonnull stop) {
        return (member.teamId == teamId);
    }];
    NSArray *resultMembers = [_myMembersOnTeams objectsAtIndexes:memberIndexes];
    return resultMembers;
}

-(void)getTeamsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion {
    [TSDKDataRequest requestObjectsForPath:self.linkTeams withConfiguration:configuration completion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
        [self processGetTeamsResult:objects];
        if (completion) {
            completion(success, complete, self.teams.allValues, error);
        }
    }];
}

-(void)getActiveTeamsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion {
    [TSDKDataRequest requestObjectsForPath:self.linkActiveTeams withConfiguration:configuration completion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
        [self processGetTeamsResult:objects];
        if (completion) {
            completion(success, complete, self.teams.allValues, error);
        }
    }];
}

- (void)processGetTeamsResult:(TSDKCollectionJSON *)objects {
    NSArray *newTeams = [TSDKObjectsRequest SDKObjectsFromCollection:objects];
    
    for (TSDKTeam *team in newTeams) {
        [self.teams refreshCollectionObject:team];
    }
}

- (void)TeamsWithIDs:(NSArray *)teamIds withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion {
    [TSDKObjectsRequest listTeams:teamIds WithConfiguration:configuration completion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
        if (completion) {
            completion(success, complete, objects, error);
        }
    }];
}

- (void)bulkLoadDataTypes:(NSArray *)objectDataTypes forTeamIds:(NSArray *)teamIds withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion {
    [TSDKObjectsRequest bulkLoadTeamDataForTeamIds:teamIds types:objectDataTypes completion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
        if (completion) {
            completion(success, complete, objects, error);
        }
    }];
}

- (void)teamIdsForAllMyTeamsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion {
    [self myMembersOnTeamsWithConfiguration:configuration completion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
        NSMutableArray *teamIds = nil;
        if (success) {
            teamIds = [[NSMutableArray alloc] init];
            for (TSDKMember *member in objects) {
                NSString *teamId = [NSString stringWithFormat:@"%ld", (long)member.teamId];
                if (teamId != 0) {
                    if (![teamIds containsObject:teamId]) {
                        [teamIds addObject:[NSString stringWithFormat:@"%ld", (long)[teamId integerValue]]];
                    }
                }
            }
        }
        if (completion) {
            completion(success, complete, [NSArray arrayWithArray:teamIds], error);
        }
    }];
}

- (void)bulkLoadDataTypes:(NSArray *)objectDataTypes withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion {
    __typeof__(self) __weak weakSelf = self;
    
    [self teamIdsForAllMyTeamsWithConfiguration:configuration completion:^(BOOL success, BOOL complete, NSArray *teamIds, NSError *error) {
        [TSDKObjectsRequest bulkLoadTeamDataForTeamIds:teamIds types:objectDataTypes completion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
            if(success) {
                for (TSDKCollectionObject *object in objects) {
                    if ([object isKindOfClass:[TSDKTeam class]]) {
                        [weakSelf addTeam:(TSDKTeam *)object];
                    }
                }
            }
            if (completion) {
                completion(success, complete, objects, error);
            }
        }];
        
    }];

}

- (void)loadTeamOverviewForMyTeamsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion {
    [self bulkLoadDataTypes:@[[TSDKTeam class], [TSDKTeamPreferences class], [TSDKTeamResults class], [TSDKPlan class]] withConfiguration:configuration completion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
        
        NSIndexSet *indexes = [objects indexesOfObjectsPassingTest:^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            return [obj isKindOfClass:[TSDKTeam class]];
        }];
        
        NSArray *teams = [objects objectsAtIndexes:indexes];
        if (completion) {
            completion(success, complete, teams, error);
        }
    }];
}

- (BOOL)processBulkLoadedObject:(TSDKCollectionObject *)bulkObject {
    BOOL lProcessed = NO;
    if ([bulkObject isKindOfClass:[TSDKMember class]]) {
        lProcessed = YES;
        [self addMember:(TSDKMember *)bulkObject];
    }
    
    return lProcessed;
}


@end