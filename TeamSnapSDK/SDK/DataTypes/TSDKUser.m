//
// Created by Jason Rahaim on 1/29/15.
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKUser.h"
#import "TSDKObjectsRequest.h"
#import "TSDKMember.h"
#import "TSDKTeam.h"
#import "NSMutableDictionary+integerKey.h"

@interface TSDKUser()

@property (strong, atomic) NSMutableArray *myMembersOnTeams;
@property (strong, atomic) NSDictionary *teams;

@end

@implementation TSDKUser {

}

@dynamic teamsCount, facebookId, receivesNewsletter, createdAt, addressState, birthday, firstName, facebookAccessToken, updatedAt, lastName, email, addressCountry, isAdmin, linkMembers, linkTeams;

+ (NSString *)SDKType {
    return @"user";
}

- (void)myMembersOnTeamsWithCompletion:(TSDKArrayCompletionBlock)completion {
    if (_myMembersOnTeams) {
        if (completion) {
            completion(YES, YES, _myMembersOnTeams, nil);
        }
    } else {
        __typeof__(self) __weak weakSelf = self;
        [self getMembersWithCompletion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
            weakSelf.myMembersOnTeams = [NSMutableArray arrayWithArray:objects];
            if (completion) {
                completion(success, complete, weakSelf.myMembersOnTeams, nil);
            }
        }];
    }
}

- (void)myMembersOnTeamId:(NSInteger)teamId withCompletion:(TSDKArrayCompletionBlock)completion {
    [self myMembersOnTeamsWithCompletion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
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

- (void)teamsWithCompletion:(TSDKArrayCompletionBlock)completion {
    [TSDKObjectsRequest listTeamsForUser:self WithCompletion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
        if (completion) {
            completion(success, complete, objects, error);
        }
    }];
}

- (void)TeamsWithIDs:(NSArray *)teamIds completion:(TSDKArrayCompletionBlock)completion {
    [TSDKObjectsRequest listTeams:teamIds WithCompletion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
        if (completion) {
            completion(success, complete, objects, error);
        }
    }];
}

- (void)bulkLoadDataTypes:(NSArray *)objectDataTypes forTeamIds:(NSArray *)teamIds WithCompletion:(TSDKArrayCompletionBlock)completion {
    [TSDKObjectsRequest bulkLoadTeamDataForTeamIds:teamIds types:objectDataTypes completion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
        if (completion) {
            completion(success, complete, objects, error);
        }
    }];
}

- (void)bulkLoadDataTypes:(NSArray *)objectDataTypes WithCompletion:(TSDKArrayCompletionBlock)completion {
    __typeof__(self) __weak weakSelf = self;
    
    [self myMembersOnTeamsWithCompletion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
        NSMutableArray *teamIds = [[NSMutableArray alloc] init];
        for (TSDKMember *member in objects) {
            NSString *teamId = [NSString stringWithFormat:@"%ld", (long)member.teamId];
            
            if (![teamIds containsObject:teamId]) {
                [teamIds addObject:[NSString stringWithFormat:@"%ld", (long)[teamId integerValue]]];
            }
        }
        [TSDKObjectsRequest bulkLoadTeamDataForTeamIds:teamIds types:objectDataTypes completion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
            NSMutableDictionary *teams = [[NSMutableDictionary alloc] init];
            if(success) {
                for (TSDKCollectionObject *object in objects) {
                    if ([object isKindOfClass:[TSDKTeam class]]) {
                        [teams setObject:object forIntegerKey:object.objectIdentifier];
                    }
                }
            }
            weakSelf.teams = [NSDictionary dictionaryWithDictionary:teams];
            if (completion) {
                completion(success, complete, [teams allValues], error);
            }
        }];
        
    }];

}

- (void)loadTeamOverviewForMyTeamsWithCompletion:(TSDKArrayCompletionBlock)completion {
    [self bulkLoadDataTypes:@[@"team", @"team_preferences", @"team_results", @"plan"] WithCompletion:completion];
}

@end