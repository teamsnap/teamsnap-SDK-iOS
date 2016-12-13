//
//  TSDKBroadcastEmail.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 9/1/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKBroadcastEmail.h"
#import "TSDKMember.h"

@implementation TSDKBroadcastEmail

@dynamic subject, attachmentCount, body, createdAt, fromEmailAddress, recipientCount, recipientNames, isDraft, updatedAt, attachmentNames, teamId, memberId, linkBroadcastEmailAttachments, linkTeam, linkMember;

+ (NSString *)SDKType {
    return @"broadcast_email";
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
