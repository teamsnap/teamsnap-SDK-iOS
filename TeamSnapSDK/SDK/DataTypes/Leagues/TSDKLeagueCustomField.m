//
//  TSDKLeagueCustomField.m
//  SDKDeveloperTools
//
//  Created by Jason Rahaim on 9/12/16.
//  Copyright © 2016 jasonr. All rights reserved.
//

#import "TSDKLeagueCustomField.h"

@implementation TSDKLeagueCustomField

@dynamic helpText, name, validationType, divisionId, teamCanEdit, teamCanRead, required, options, linkTeams, linkLeagueCustomData;

+ (NSString *)SDKType {
    return @"league_custom_field";
}

- (TSDKCustomDataFieldType)fieldType {
    return [TSDKCustomField fieldTypeForString:[self getString:@"kind"]];
}

- (void)setFieldType:(TSDKCustomDataFieldType)fieldType {
    [self setString:[TSDKCustomField fieldTypeStringForFieldType:fieldType] forKey:@"kind"];
}

@end
