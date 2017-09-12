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

- (NSString * _Nullable)customFieldId {
    return self.leagueCustomFieldId;
}

@end
