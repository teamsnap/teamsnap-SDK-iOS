//
//  TSDKCustomField.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 9/1/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKCustomField.h"

NSString * _Nonnull const TSDKCustomDataTypeDateString = @"Date";
NSString * _Nonnull const TSDKCustomDataTypeMenuString = @"Menu";
NSString * _Nonnull const TSDKCustomDataTypeBoolString = @"Check Box";
NSString * _Nonnull const TSDKCustomDataTypeTextString = @"Text";

@implementation TSDKCustomField
@dynamic name, teamId, kind, options, helpText, linkTeam, linkCustomData;

+ (NSString *)SDKType {
    return @"custom_field";
}

+ (CustomDataFieldType)fieldTypeForString:(NSString *)kind {
    if ([[kind uppercaseString] isEqualToString:[TSDKCustomDataTypeDateString uppercaseString]]) {
        return TSDKCustomDataTypeDate;
    } else if ([[kind uppercaseString] isEqualToString:[TSDKCustomDataTypeMenuString uppercaseString]]) {
        return TSDKCustomDataTypeMenu;
    } else if ([[kind uppercaseString] isEqualToString:[TSDKCustomDataTypeBoolString uppercaseString]]) {
        return TSDKCustomDataTypeBool;
    } else if ([[kind uppercaseString] isEqualToString:[TSDKCustomDataTypeMenuString uppercaseString]]) {
        return TSDKCustomDataTypeMenu;
    } else {
        return TSDKCustomDataTypeText;
    }
}

+ (NSString *)fieldTypeStringForFieldType:(CustomDataFieldType)fieldType {
    NSArray *fieldTypeStringArray = @[TSDKCustomDataTypeDateString,
                                       TSDKCustomDataTypeMenuString,
                                       TSDKCustomDataTypeBoolString,
                                       TSDKCustomDataTypeTextString];
    if (fieldType != TSDKCustomDataTypeUnknown) {
        return fieldTypeStringArray[fieldType];
    } else {
        return TSDKCustomDataTypeTextString;
    }
}

- (CustomDataFieldType)dataType {
    return [TSDKCustomField fieldTypeForString:self.kind];
}

- (void)setDataType:(CustomDataFieldType)dataType {
    self.kind = [TSDKCustomField fieldTypeStringForFieldType:dataType];
}

@end
