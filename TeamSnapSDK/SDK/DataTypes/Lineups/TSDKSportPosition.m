//
//  TSDKSportPositions.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 4/9/18.
//  Copyright © 2018 teamsnap. All rights reserved.
//

#import "TSDKSportPosition.h"

@implementation TSDKSportPosition

@dynamic sportId, label, createdAt, updatedAt;

+ (NSString *)SDKType {
    return @"sport_position";
}

@end
