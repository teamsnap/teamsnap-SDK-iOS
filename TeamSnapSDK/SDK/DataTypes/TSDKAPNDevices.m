//
//  TSDKAPNDevices.m
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 11/22/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKAPNDevices.h"

@implementation TSDKApnDevices

@dynamic token, appVersion, linkSelf, linkUser, linkRoot;

+ (NSString *)SDKType {
    return @"apn_devices";
}

+ (NSString *)SDKREL {
    return @"apn_devices";
}

@end
