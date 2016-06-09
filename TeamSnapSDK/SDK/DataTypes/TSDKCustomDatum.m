//
//  TSDKCustomDatum.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 9/1/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKCustomDatum.h"
#import "NSString+TSDKConveniences.h"
#import "NSDate+TSDKConveniences.h"

NSString * _Nonnull const TSDKCustomDataTypeDate = @"Date";
NSString * _Nonnull const TSDKCustomDataTypeMenu = @"Menu";
NSString * _Nonnull const TSDKCustomDataTypeBool = @"Check Box";
NSString * _Nonnull const TSDKCustomDataTypeText = @"Text";

@implementation TSDKCustomDatum
@dynamic name, options, value, isPrivate, memberId, teamId, kind, customFieldId, helpText, linkCustomField, linkMember, linkTeam;

// "Menu"
// "Check Box"
// "Text"
// "Date"

+ (NSString *)SDKType {
    return @"custom_datum";
}

+ (NSString *)SDKREL {
    return @"custom_data";
}

- (NSDate *)dateValue {
    if ([self.kind isEqualToString:TSDKCustomDataTypeDate]) {
        return [self.value dateFromJustDate];
    } else {
        return nil;
    }
}

- (void)setDateValue:(NSDate *)dateValue {
    self.value = [dateValue YYYYMMDDString];
}

- (NSString *)displayValue {
    if ([self.kind isEqualToString:TSDKCustomDataTypeDate]) {
        return [self.dateValue shortString];
    } else if ([self.kind isEqualToString:TSDKCustomDataTypeBool]) {
        if ([self.value isEqualToString:@"1"]) {
            return @"Yes";
        } else {
            return @"No";
        }
    } else {
        return self.value;
    }
}


@end
