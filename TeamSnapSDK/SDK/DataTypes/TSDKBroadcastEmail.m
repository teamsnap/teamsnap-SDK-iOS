//
//  TSDKBroadcastEmail.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 9/1/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKBroadcastEmail.h"
#import "TSDKMember.h"
#import "TSDKTeam.h"

@implementation TSDKBroadcastEmail

@dynamic subject, attachmentCount, body, createdAt, fromEmailAddress, recipientCount, recipientNames, isDraft, updatedAt, attachmentNames, teamId, memberId, linkBroadcastEmailAttachments, linkTeam, linkMember;

+ (NSString *)SDKType {
    return @"broadcast_email";
}

- (instancetype)initWithDivisionID:(NSString *)divisionId teams:(NSArray <TSDKTeam *> *)teams managersOnly:(BOOL)managersOnly includeUnassignedPlayers:(BOOL)includeUnassignedPlayers includeCommissioners:(BOOL)includeCommissioners sender:(id<TSDKMessageSender>)sender sendCopyToSelf:(BOOL)sendCopyToSelf body:(NSString *)body subject:(NSString *)subject {
    self = [super init];
    if(self) {
        [super setString:divisionId forKey:@"division_id"]; // This is required. This it the top level division you want to scope everything to. You also must have permission at this division level
        [super setBool:YES forKey:@"is_league"];    // This is required. Must be true in order to send an email at a commissioner level.
        [super setBool:includeCommissioners forKey:@"recipient_all_commissioners"]; // true/false - this will send an email to all commissioners in the division and subdivisions
        [super setBool:includeUnassignedPlayers forKey:@"recipient_unnassigned"];   // true/false - this will send an email to all unnassigned players in that division and subdivisions
        
        NSMutableArray *teamIds = [[NSMutableArray alloc] initWithCapacity:teams.count];
        for(TSDKTeam *team in teams) {
            [teamIds addObject:[team objectIdentifier]];
        }
        if(managersOnly) {
            [super setArray:teamIds forKey:@"recipient_manager_team_ids"];  // this is a list of teams, and it will send an email to all the managers on that team.
        } else {
            [super setArray:teamIds forKey:@"recipient_team_ids"];  // this is a list of teams you want to send an email to. It will send it to everyone on that team.
        }
        
        // Currently unused property:
        // "recipient_division_ids" = "<null>"; this is a list of divisions that you want to send an email to. This will email everyone in the division
        
        [super setString:body forKey:@"body"];
        [super setString:subject forKey:@"subject"];
        [super setString:[sender memberId] forKey:@"member_id"];
        if(sendCopyToSelf) {
            [super setArray:@[[sender memberId]] forKey:@"recipient_ids"];
        }
    }
    return self;
}

- (instancetype)initWithBody:(NSString *)body subject:(NSString *)subject teamId:(NSString *_Nonnull)teamId recipients:(NSArray <TSDKMember *>*)recipients sender:(id<TSDKMessageSender>)sender isDraft:(BOOL)isDraft {
    self = [super init];
    if(self) {
        [super setString:body forKey:@"body"];
        [super setString:subject forKey:@"subject"];
        [super setString:teamId forKey:@"team_id"];
        [super setString:[sender memberId] forKey:@"member_id"];
        if([sender respondsToSelector:@selector(contactId)]) {
            [super setString:[sender contactId] forKey:@"contact_id"];
        }
        NSMutableArray *recipientIDs = [[NSMutableArray alloc] init];
        for(TSDKMember *recipient in recipients) {
            [recipientIDs addObject:recipient.objectIdentifier];
        }
        [super setBool:isDraft forKey:@"is_draft"];
        
        [super setArray:recipientIDs forKey:@"recipient_ids"];
    }
    return self;
}

@end
