//
//  TSDKBroadcastEmail.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 9/1/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKBroadcastEmail.h"

@implementation TSDKBroadcastEmail

@dynamic attachmentCount, body, subject, createdAt, recipientCount, recipientNames, isDraft, updatedAt, attachmentNames, teamId, isSms, memberId, linkBroadcastEmailAttachments, linkTeam, linkMember;

+ (NSString *)SDKType {
    return @"broadcast_email";
}

@end
