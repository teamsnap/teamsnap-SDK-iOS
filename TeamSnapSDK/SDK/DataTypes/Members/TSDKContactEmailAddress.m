//
//  TSDKContactEmailAddress.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 12/9/15.
//  Copyright © 2015 teamsnap. All rights reserved.
//

#import "TSDKContactEmailAddress.h"

@implementation TSDKContactEmailAddress

@dynamic label, isHidden, createdAt, receivesTeamEmails, contactId, updatedAt, isAccepted, teamId, email, memberId, linkContact, linkMember, linkTeam;

+ (NSString *)SDKType {
    return @"contact_email_address";
}

+ (void)actionInvite:(NSArray *_Nonnull)contactEmailAddresses fromMemberId:(NSString *_Nonnull)memberId withConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKCompletionBlock _Nullable)completion {
    if (contactEmailAddresses.count > 0) {
        TSDKContactEmailAddress *firstMemberEmailAddress = [contactEmailAddresses objectAtIndex:0];
        
        TSDKCollectionCommand *command = [self commandForKey:@"invite"];
        
        NSMutableArray *emailAddressIds = [[NSMutableArray alloc] init];
        for (TSDKContactEmailAddress *emailAddress in contactEmailAddresses) {
            [emailAddressIds addObject:emailAddress.objectIdentifier];
        }
        NSString *emailIds = [emailAddressIds componentsJoinedByString:@","];
        
        command.data[@"team_id"] = firstMemberEmailAddress.teamId;
        command.data[@"member_id"] = memberId;
        command.data[@"contact_email_address_ids"] = emailIds;
        
        [command executeWithCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
            if (completion) {
                completion(success, complete, objects, error);
            }
        }];
    } else {
        completion(NO, NO, nil, nil);
    }
}

- (void)inviteWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration fromMemberId:(NSString *_Nonnull)memberId completion:(TSDKCompletionBlock _Nullable)completion {
    [TSDKContactEmailAddress actionInvite:@[self] fromMemberId:memberId withConfiguration:configuration completion:completion];
}

@end
