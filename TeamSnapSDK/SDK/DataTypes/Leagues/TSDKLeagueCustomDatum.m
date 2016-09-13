//
//  TSDKLeagueCustomDatum.m
//  SDKDeveloperTools
//
//  Created by Jason Rahaim on 9/12/16.
//  Copyright © 2016 jasonr. All rights reserved.
//

#import "TSDKLeagueCustomDatum.h"
#import "TSDKCustomField.h"
#import "NSString+TSDKConveniences.h"
#import "NSDate+TSDKConveniences.h"

@implementation TSDKLeagueCustomDatum

@dynamic options, leagueCustomFieldId, value, teamCanRead, teamCanEdit, isPrivate, helpText, teamId, kind, name, memberId, linkMember, linkLeagueCustomField, linkTeam;

+ (NSString *)SDKType {
    return @"league_custom_datum";
}

+ (NSString *)SDKREL {
    return @"league_custom_data";
}

- (NSDate *)dateValue {
    if (self.dataType == TSDKCustomDataTypeDate) {
        return [self.value dateFromJustDate];
    } else {
        return nil;
    }
}

- (void)setDateValue:(NSDate *)dateValue {
    self.value = [dateValue YYYYMMDDString];
}

- (NSString *)displayValue {
    if (self.dataType == TSDKCustomDataTypeDate) {
        return [self.dateValue shortString];
    } else if (self.dataType == TSDKCustomDataTypeBool) {
        if ([self.value isEqualToString:@"1"]) {
            return @"Yes";
        } else {
            return @"No";
        }
    } else {
        return self.value;
    }
}

- (CustomDataFieldType)dataType {
    return [TSDKCustomField fieldTypeForString:self.kind];
}

- (void)setDataType:(CustomDataFieldType)dataType {
    self.kind = [TSDKCustomField fieldTypeStringForFieldType:dataType];
}

@end
