//
// Created by Jason Rahaim on 1/29/15.
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKUser.h"
#import "TSDKObjectsRequest.h"
#import "TSDKMember.h"

@interface TSDKUser()

@property (strong, nonatomic) NSMutableArray *myMembersOnTeams;

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

@end