//
//  TSDKSuggestedAssignment.m
//  TeamSnapSDK
//
//  Created by Anne Cahalan on 11/5/19.
//  Copyright © 2019 teamsnap. All rights reserved.
//

#import "TSDKSuggestedAssignment.h"

@implementation TSDKSuggestedAssignment

@dynamic position, analyticLabel, isSponsored, name, logoUrl, linkTeam;

+ (NSString *)SDKType {
  return @"suggested_assignment";
}

@end
