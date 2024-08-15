//
//  TSDKMemberPhoto.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 6/14/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKMemberPhoto.h"

@implementation TSDKMemberPhoto

@dynamic memberId, originalFileSize, teamId, updatedAt, linkMember, linkImageUrl, linkTeam, linkUser;

+ (NSString *)SDKType {
    return @"member_photo";
}

@end
