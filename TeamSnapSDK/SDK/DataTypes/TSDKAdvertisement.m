//
//  TSDKAdvertisement.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 10/9/17.
//  Copyright © 2017 teamsnap. All rights reserved.
//

#import "TSDKAdvertisement.h"

@implementation TSDKAdvertisement

@dynamic userId, teamId, canDisplayAds, linkTeam, linkUser;

+ (NSString *)SDKType {
    return @"advertisement";
}
@end
