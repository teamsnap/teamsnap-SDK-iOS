//
//  TSDKAvailability.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 2/12/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKAvailability.h"

@implementation TSDKAvailability

@dynamic status, notes, notesAuthorMemberId, memberId, eventId, teamId, createdAt, updatedAt, linkEvent, linkMember, linkTeam;

+ (NSString *)SDKType {
    return @"availability";
}

+ (NSString *)SDKREL {
    return @"availabilities";
}

- (TSDKAvailabilityState)statusCode {
    NSInteger result = [super getInteger:@"status_code"];
    if (result == NSNotFound) {
        return TSDKAvailabilityStateIsUnknown;
    } else {
        return result;
    }
}

- (void)setStatusCode:(TSDKAvailabilityState)statusCode {
    [super setInteger:statusCode forKey:@"status_code"];
}

@end
