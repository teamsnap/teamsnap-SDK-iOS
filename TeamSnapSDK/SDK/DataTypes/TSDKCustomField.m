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
@dynamic name, teamId, options, helpText, kind, linkTeam, linkCustomData;

+ (NSString *)SDKType {
    return @"custom_field";
}

- (TSDKCustomDataFieldType)fieldType {
    return [TSDKCustomField fieldTypeForString:self.kind];
}

- (void)setFieldType:(TSDKCustomDataFieldType)fieldType {
    [self setString:[TSDKCustomField fieldTypeStringForFieldType:fieldType] forKey:@"kind"];
}

- (BOOL)teamCanEdit {
    return YES; // Team level fields always return true. This field is used for League Custom Fields.
}

- (BOOL)teamCanRead {
    return YES; // Team level fields always return true. This field is used for League Custom Fields.
}

- (BOOL)required {
    return NO;  // Team level fields are never required. This field is used for League Custom Fields.
}


+ (TSDKCustomDataFieldType)fieldTypeForString:(NSString *)kind {
    if ([[kind uppercaseString] isEqualToString:[TSDKCustomDataTypeDateString uppercaseString]]) {
        return TSDKCustomDataFieldTypeDate;
    } else if ([[kind uppercaseString] isEqualToString:[TSDKCustomDataTypeMenuString uppercaseString]]) {
        return TSDKCustomDataFieldTypeMenu;
    } else if ([[kind uppercaseString] isEqualToString:[TSDKCustomDataTypeBoolString uppercaseString]]) {
        return TSDKCustomDataFieldTypeBool;
    } else if ([[kind uppercaseString] isEqualToString:[TSDKCustomDataTypeTextString uppercaseString]]) {
        return TSDKCustomDataFieldTypeText;
    } else {
        return TSDKCustomDataFieldTypeUnknown;
    }
}

+ (NSString *)fieldTypeStringForFieldType:(TSDKCustomDataFieldType)fieldType {
    NSArray *fieldTypeStringArray = @[TSDKCustomDataTypeDateString,
                                       TSDKCustomDataTypeMenuString,
                                       TSDKCustomDataTypeBoolString,
                                       TSDKCustomDataTypeTextString];
    if (fieldType != TSDKCustomDataFieldTypeUnknown) {
        return fieldTypeStringArray[fieldType];
    } else {
        return TSDKCustomDataTypeTextString;
    }
}

@end
