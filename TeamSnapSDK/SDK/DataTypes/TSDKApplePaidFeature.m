//
//  TSDKApplePaidFeature.m
//  TeamSnapSDK
//
//  Created by Marquez Gallegos on 4/25/17.
//  Copyright © 2017 teamsnap. All rights reserved.
//

#import "TSDKApplePaidFeature.h"

@implementation TSDKApplePaidFeature

@dynamic isFree, isActive, appleProductIdentifier, isEligible;
 
+ (NSString *)SDKType {
     return @"apple_paid_feature";
}

@end
