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

+(void)actionInvite:(TSDKMemberEmailAddress *)memberEmailAddress asSenderMemberId:(NSInteger)senderMemberId withCompletion:(TSDKCompletionBlock)completion {
    TSDKCollectionCommand *command = [self commandForKey:@"invite"];
    command.data[@"team_id"] = [NSNumber numberWithInteger:memberEmailAddress.teamId];
    command.data[@"member_id"] = [NSNumber numberWithInteger:memberEmailAddress.memberId];
    command.data[@"member_email_address_id"] = [NSNumber numberWithInteger:memberEmailAddress.objectIdentifier];
    command.data[@"notify_as_member_id"] = [NSNumber numberWithInteger:senderMemberId];
    
    [command executeWithCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
        if (completion) {
            completion(success, complete, objects, error);
        }
    }];
}

-(void)inviteAsSenderMemberId:(NSInteger)senderMemberId withCompletion:(TSDKCompletionBlock)completion {
    [TSDKMemberEmailAddress actionInvite:self asSenderMemberId:senderMemberId withCompletion:completion];
}

@end
