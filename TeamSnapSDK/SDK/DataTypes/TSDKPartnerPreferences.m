//
//  TSDKPartnerPreferences.m
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 3/5/19.
//  Copyright © 2019 teamsnap. All rights reserved.
//

#import "TSDKPartnerPreferences.h"

@implementation TSDKPartnerPreferences

@dynamic canDisplayPartner, partnerName, userId, userIsPartner, partnerId;
 
 + (NSString *)SDKType {
     return @"partner_preferences";
 }

@end
