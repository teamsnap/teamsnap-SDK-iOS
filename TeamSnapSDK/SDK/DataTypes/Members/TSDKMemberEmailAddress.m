//
//  TSDKMemberEmailAddress.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 12/9/15.
//  Copyright © 2015 teamsnap. All rights reserved.
//

#import "TSDKMemberEmailAddress.h"
#import "TSDKTeamSnap.h"
#import "TSDKRootLinks.h"

@implementation TSDKMemberEmailAddress

@dynamic label, isHidden, createdAt, invitationState, isInvited, receivesTeamEmails, updatedAt, invitationCode, teamId, email, memberId, linkMember, linkTeam;

+ (NSString *)SDKType {
    return @"member_email_address";
}

+(void)actionInvite:(NSArray *)emailAddresses asSenderMemberId:(NSString *_Nonnull)senderMemberId withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKCompletionBlock)completion {
    if (emailAddresses && emailAddresses.count>0) {
        TSDKMemberEmailAddress *firstMemberEmailAddress = [emailAddresses objectAtIndex:0];

        TSDKCollectionCommand *command = [self commandForKey:@"invite"];
        
        NSMutableArray *emailAddressIds = [[NSMutableArray alloc] init];
        for (TSDKMemberEmailAddress *emailAddress in emailAddresses) {
            [emailAddressIds addObject:emailAddress.objectIdentifier];
        }
        NSString *emailIds = [emailAddressIds componentsJoinedByString:@","];
        
        command.data[@"team_id"] = firstMemberEmailAddress.teamId;
        command.data[@"member_id"] = firstMemberEmailAddress.memberId;
        command.data[@"contact_email_address_ids"] = emailIds;
        command.data[@"notify_as_member_id"] = senderMemberId;
        
        [command executeWithCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
            if (completion) {
                completion(success, complete, objects, error);
            }
        }];
    } else {
        completion(NO, NO, nil, nil);
    }
}

-(void)inviteAsSenderMemberId:(NSString *_Nonnull)senderMemberId withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKCompletionBlock)completion {
    [TSDKMemberEmailAddress actionInvite:@[self] asSenderMemberId:senderMemberId withConfiguration:configuration completion:completion];
}

- (void)postNewEmailWithCompletion:(TSDKSaveCompletionBlock _Nullable)completion {
    if ([self isNewObject]) {
        NSURL *URL;
        if ([[self class] classURL]) {
            URL = [[self class] classURL];
        } else {
            URL = [[[TSDKTeamSnap sharedInstance] rootLinks] linkForKey:[[self class] SDKREL]];
        }
        [self saveWithURL:URL completion:^(BOOL success, BOOL complete, NSArray<TSDKCollectionObject *> * _Nonnull objects, NSError * _Nullable error) {
            if(completion) {
                completion(success, [objects firstObject], error);
            }
        }];
    } else {
        if(completion) {
            completion(NO, nil, nil);
        }
    }
}

@end
