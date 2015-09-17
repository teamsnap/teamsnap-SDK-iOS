//
// Created by Jason Rahaim on 1/29/15.
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKUser.h"
#import "TSDKObjectsRequest.h"


@implementation TSDKUser {

}

@dynamic teamsCount, facebookId, receivesNewsletter, createdAt, addressState, birthday, firstName, facebookAccessToken, updatedAt, lastName, email, addressCountry, isAdmin, linkMembers, linkTeams;

+ (NSString *)SDKType {
    return @"user";
}


- (void)teamsWithCompletion:(TSDKArrayCompletionBlock)completion {
    [TSDKObjectsRequest listTeamsForUser:self WithCompletion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
        if (completion) {
            completion(success, complete, objects, error);
        }
    }];
}

@end