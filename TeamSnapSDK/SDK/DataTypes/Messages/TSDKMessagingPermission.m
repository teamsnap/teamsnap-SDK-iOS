//
//  TSDKMessagingPermission.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 12/19/17.
//  Copyright © 2017 teamsnap. All rights reserved.
//

#import "TSDKMessagingPermission.h"

@implementation TSDKMessagingPermission

@dynamic message, canSendUserProvidedContent, teamId, linkTeam;

+ (NSString *)SDKType {
    return @"messaging_permission";
}

@end
