//
//  TSDKAPNDevices.m
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 11/22/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKAPNDevice.h"

@implementation TSDKApnDevice

@dynamic token, appVersion, linkSelf, linkUser, linkRoot;

+ (NSString *)SDKType {
    return @"apn_device";
}

+ (NSString *)SDKREL {
    return @"apn_devices";
}

@end
