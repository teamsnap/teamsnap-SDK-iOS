//
//  TSDKBroadcastAlert.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 9/1/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKBroadcastAlert.h"
#import "TSDKMember.h"

@implementation TSDKBroadcastAlert

@dynamic updatedAt, isDraft, createdAt, memberId, recipientNames, teamId, body, recipientCount, linkTeam, linkMember;

+ (NSString *)SDKType {
    return @"broadcast_alert";
}

- (instancetype)initWithBody:(NSString *)body teamId:(NSString *_Nonnull)teamId recipients:(NSArray <TSDKMember *>*)recipients sender:(id<TSDKMessageSender>)sender {
    self = [super init];
    if(self) {
        [super setString:body forKey:@"body"];
        [super setString:teamId forKey:@"team_id"];
        [super setString:[sender memberId] forKey:@"member_id"];
        if([sender respondsToSelector:@selector(contactId)]) {
            [super setString:[sender contactId] forKey:@"contact_id"];
        }
        NSMutableArray *recipientIDs = [[NSMutableArray alloc] init];
        for(TSDKMember *recipient in recipients) {
            [recipientIDs addObject:recipient.objectIdentifier];
        }
        
        [super setArray:recipientIDs forKey:@"recipient_ids"];
    }
    return self;
}

@end
