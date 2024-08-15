//
//  TSDKCountry.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 4/22/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKCountry.h"

@implementation TSDKCountry
@dynamic name, isoAlpha2Code;

+ (NSString *)SDKType {
    return @"country";
}

+ (NSString *)SDKREL {
    return @"countries";
}

#pragma mark - TSDKBundledDataProtocol

+ (NSURL *)bundledFileURL {
    return [SWIFTPM_MODULE_BUNDLE URLForResource:[self SDKREL] withExtension:@"json"];
}

@end
