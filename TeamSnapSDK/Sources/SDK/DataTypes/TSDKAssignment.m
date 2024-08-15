//
//  TSDKAssignment.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 9/1/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKAssignment.h"

@implementation TSDKAssignment

@dynamic assignmentDescription, logoUrl, position, isEditable, createdAt, adUnitId, isSponsored, analyticLabel, updatedAt, managerCreated, teamId, eventId, memberId, linkMember, linkMemberAssignment, linkMemberAssignments, linkEvent, linkTeam;

+ (NSString *)SDKType {
  return @"assignment";
}

+ (void)actionSendAssignmentEmailsEventids:(NSArray <NSString *> *_Nonnull)eventIds sendingMemberId:(NSString *_Nonnull)sendingMemberId teamId:(NSString *_Nonnull)teamId WithCompletion:(TSDKCompletionBlock _Nullable)completion {
    TSDKCollectionCommand *command = [TSDKAssignment commandForKey:@"send_assignment_emails"];
    
    if (command == nil) {
        if (completion != nil) {
            completion(NO, NO, nil, nil);
        }
        return;
    }
    [command.data removeAllObjects];
    command.data[@"sending_member_id"] = sendingMemberId;
    command.data[@"team_id"] = teamId;
    command.data[@"event_ids"] = eventIds;
    
    [command executeWithCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON * _Nullable objects, NSError * _Nullable error) {
        if(completion) {
            completion(success, complete, objects, error);
        }
    }];
}

@end
