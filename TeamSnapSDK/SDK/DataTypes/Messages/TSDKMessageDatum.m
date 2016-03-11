//
//  TSDKMessageDataum.m
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 3/10/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKMessageDatum.h"

@implementation TSDKMessageDatum

@dynamic unreadCount, memberId, userId, teamId, contactId, linkTeam, linkUser, linkMember;

+ (NSString *)SDKType {
    return @"message_datum";
}

@end
