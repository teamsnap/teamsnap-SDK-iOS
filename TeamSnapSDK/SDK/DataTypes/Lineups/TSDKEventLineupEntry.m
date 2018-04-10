//
//  TSDKEventLinupEntry.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 4/10/18.
//  Copyright © 2018 teamsnap. All rights reserved.
//

#import "TSDKEventLineupEntry.h"

@implementation TSDKEventLineupEntry

@dynamic eventLineupId, memberId, sequence, label, memberName, memberPhoto;

+ (NSString *)SDKType {
    return @"event_lineup_entry";
}

+ (NSString *)SDKREL {
    return @"event_lineup_entries";
}

- (TSDKAvailabilityState)availabilityStatusCode {
    NSInteger result = [super getInteger:@"availability_status_code"];
    if (result == NSNotFound) {
        return TSDKAvailabilityStateIsUnknown;
    } else {
        return result;
    }
}


@end
