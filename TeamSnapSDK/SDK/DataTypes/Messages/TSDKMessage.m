//
//  TSDKMessage.m
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 3/9/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKMessage.h"

@implementation TSDKMessage

@dynamic body, recipients, subject, memberId, smsed, emailed, readAt, createdAt, userId, pushed, contactId, updatedAt, teamId, senderId, status, flags, linkMember, linkSender, linkTeam, linkUser;

+ (NSString *)SDKType {
    return @"message";
}

+ (void)actionMarkMessageAsRead:(TSDKMessage *)message completion:(TSDKCompletionBlock)completion {
    
}

@end
