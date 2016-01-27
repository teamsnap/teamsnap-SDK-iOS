//
//  TSDKMemberEmailAddress.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 12/9/15.
//  Copyright © 2015 teamsnap. All rights reserved.
//

#import "TSDKMemberEmailAddress.h"

@implementation TSDKMemberEmailAddress

@dynamic teamId, updatedAt, receivesTeamEmails, createdAt, email, isHidden, label, memberId, invitationState, isInvited, linkMember, linkTeam;

+ (NSString *)SDKType {
    return @"member_email_address";
}

+(void)actionInvite:(NSArray *)emailAddresses asSenderMemberId:(NSInteger)senderMemberId withCompletion:(TSDKCompletionBlock)completion {
    if (emailAddresses && emailAddresses.count>0) {
        TSDKMemberEmailAddress *firstMemberEmailAddress = [emailAddresses objectAtIndex:0];

        TSDKCollectionCommand *command = [self commandForKey:@"invite"];
        
        NSMutableArray *emailAddressIds = [[NSMutableArray alloc] init];
        for (TSDKMemberEmailAddress *emailAddress in emailAddresses) {
            [emailAddressIds addObject:[NSNumber numberWithInteger:emailAddress.objectIdentifier]];
        }
        NSString *emailIds = [emailAddressIds componentsJoinedByString:@","];
        
        command.data[@"team_id"] = [NSNumber numberWithInteger:firstMemberEmailAddress.teamId];
        command.data[@"member_id"] = [NSNumber numberWithInteger:firstMemberEmailAddress.memberId];
        command.data[@"member_email_address_ids"] = emailIds;
        command.data[@"notify_as_member_id"] = [NSNumber numberWithInteger:senderMemberId];
        
        [command executeWithCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
            if (completion) {
                completion(success, complete, objects, error);
            }
        }];
    } else {
        completion(NO, NO, nil, nil);
    }
}

-(void)inviteAsSenderMemberId:(NSInteger)senderMemberId withCompletion:(TSDKCompletionBlock)completion {
    [TSDKMemberEmailAddress actionInvite:@[self] asSenderMemberId:senderMemberId withCompletion:completion];
}

@end
