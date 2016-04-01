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

- (instancetype)initWithBody:(NSString *)body subject:(NSString *)subject teamId:(NSInteger)teamId recipients:(NSArray <TSDKMember *>*)recipients sender:(TSDKMember *)sender {
    self = [super init];
    if(self) {
        [super setString:body forKey:@"body"];
        [super setString:subject forKey:@"subject"];
        [super setInteger:teamId forKey:@"team_id"];
        [super setInteger:sender.objectIdentifier forKey:@"member_id"];
        NSMutableArray *recipientIDs = [[NSMutableArray alloc] init];
        for(TSDKMember *recipient in recipients) {
            [recipientIDs addObject:[NSString stringWithFormat:@"%ld", (long)recipient.objectIdentifier]];
        }
        
        [super setArray:recipientIDs forKey:@"recipient_ids"];
    }
    return self;
}
/*
 
 "data": [{
 "name": "attachments",
 "value": null
 }, {
 "name": "body",
 "value": null
 }, {
 "name": "from_email_address",
 "value": null
 }, {
 "name": "is_draft",
 "value": null
 }, {
 "name": "member_id",
 "value": null
 }, {
 "name": "recipient_ids",
 "value": null
 }, {
 "name": "subject",
 "value": null
 }, {
 "name": "team_id",
 "value": null
 }, {
 "name": "type",
 "value": "broadcast_email"
 }]
 
 */
@end
