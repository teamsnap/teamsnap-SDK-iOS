//
//  TSDKMemberMessageDatum.m
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 3/9/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKMemberMessageDatum.h"

@implementation TSDKMemberMessageDatum

@dynamic userId, teamId, unreadCount, linkTeam, linkUser;

+ (NSString *)SDKType {
    return @"member_message_datum";
}

@end
