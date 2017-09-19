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

@implementation TSDKCustomDatum
@dynamic name, options, value, isPrivate, memberId, teamId, kind, customFieldId, helpText, linkCustomField, linkMember, linkTeam;

- (instancetype)initWithField:(TSDKCustomField *_Nonnull)field memberId:(NSString *_Nonnull)memberId teamId:(NSString *_Nonnull)teamId {
    self = [super init];
    if(self) {
        self.memberId = memberId;
        self.teamId = teamId;
        self.kind = field.kind;
        self.options = field.options.copy;
        self.customFieldId = field.objectIdentifier;
        self.name = field.name;
    }
    return self;
}

+ (NSString *)SDKType {
    return @"custom_datum";
}

+ (NSString *)SDKREL {
    return @"custom_data";
}

- (NSDate *)dateValue {
    if (self.dataType == TSDKCustomDataFieldTypeDate) {
        return [self.value dateFromJustDate];
    } else {
        return nil;
    }
}

- (void)setDateValue:(NSDate *)dateValue {
    self.value = [dateValue YYYYMMDDString];
}

- (NSString *)displayValue {
    if (self.dataType == TSDKCustomDataFieldTypeDate) {
        return [self.dateValue shortString];
    } else if (self.dataType == TSDKCustomDataFieldTypeBool) {
        if ([self.value isEqualToString:@"1"]) {
            return @"Yes";
        } else {
            return @"No";
        }
    } else {
        return self.value;
    }
}

- (TSDKCustomDataFieldType)dataType {
    return [TSDKCustomField fieldTypeForString:self.kind];
}

- (void)setDataType:(TSDKCustomDataFieldType)dataType {
    self.kind = [TSDKCustomField fieldTypeStringForFieldType:dataType];
}

@end
