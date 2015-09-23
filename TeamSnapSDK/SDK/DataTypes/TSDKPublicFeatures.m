//
//  TSDKPublic_Feature.m
//  SDKDeveloperTools
//
//  Created by Jason Rahaim on 9/23/15.
//  Copyright © 2015 jasonr. All rights reserved.
//

#import "TSDKPublicFeatures.h"

NSString * const TSDKUserSupportVersion = @"ios_support_ticket_v1";
NSString * const TSDKaysBetweenPushNoteRemindersKey = @"ios_days_between_push_note_reminders";

@implementation TSDKPublicFeatures


- (instancetype) init {
    self = [super init];
    if (self) {
        _features = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (instancetype)initWithCollection:(NSDictionary *)objects {
    self = [self init];
    
    NSArray *arrayOfJSONObjects = [[[TSDKCollectionJSON alloc] initWithJSON:objects] collection];
    
    //NSArray *arrayOfJSONObjects = [[[objects allValues] objectAtIndex:0] objectForKey:@"items"];
    
    
    for (TSDKCollectionJSON *settingData in arrayOfJSONObjects) {
        NSString *feature = [settingData.data valueForKey:@"feature"];
        BOOL isEnabled = ([[settingData.data valueForKey:@"is_enabled"] integerValue] == 1);
        NSString *value = [settingData.data valueForKey:@"value"];
        
        if (feature && value) {
            [_features setValue:value forKey:feature];
        } else if (feature) {
            [_features setValue:[NSNumber numberWithBool:isEnabled] forKey:feature];
        }
    }
    return self;
}

- (BOOL)apiSupportsTicketSubmission {
    if ([self.features objectForKey:TSDKUserSupportVersion]) {
        return [[self.features objectForKey:TSDKUserSupportVersion] boolValue];
    } else {
        return NO;
    }
}

- (NSInteger)daysBetweenPushPermissionPrompt {
    if ([self.features objectForKey:TSDKaysBetweenPushNoteRemindersKey]) {
        return [[self.features objectForKey:TSDKaysBetweenPushNoteRemindersKey] integerValue];
    } else {
        return 14;  // default value if it's not set.
    }
}

@end
