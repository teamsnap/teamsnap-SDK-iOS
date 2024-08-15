//
//  TSDKAvailability.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 2/12/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKAvailability.h"
#import "TSDKEvent.h"
#import "TSDKAvailabilityGroups.h"
#import "TSDKConstants.h"

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

- (void)saveWithCompletion:(TSDKSaveCompletionBlock)completion {
    if ([self isNewObject]) {
        // In apiV3, availability objects are created for every new event for historical/compatibility reasons. In the case of a new availability for a new event, we should query the API for a matching availability object, copy the href/ID from the existing object into our object, and save it.
        NSString *eventId = self.eventId;
        NSString *memberId = self.memberId;
        NSString *teamId = self.teamId;
        if ((memberId == nil) || (eventId == nil) || (teamId == nil)) {
            completion(NO, self, [self availabilitySaveError:@"Information missing"]);
            return;
        }
        
        TSDKCollectionQuery *availabilitySearch = [TSDKAvailability queryForKey:@"search"];
        availabilitySearch.data = [@{@"member_id" : memberId,
                                    @"event_id" : eventId,
                                    @"team_id" : teamId
                                    } mutableCopy];
        
        [availabilitySearch executeWithCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON * _Nullable objects, NSError * _Nullable error) {
            TSDKAvailability *availability;
            if(success && ([[objects collection] isKindOfClass:[NSArray class]])) {
                NSArray *availabilities = [TSDKObjectsRequest SDKObjectsFromCollection:objects];
                if([[availabilities firstObject] isKindOfClass:[TSDKAvailability class]]) {
                    availability = (TSDKAvailability *)[availabilities firstObject];
                    [self setCollectionHref:availability.urlForSave];
                    [self setCollectionObject:availability.objectIdentifier forKey:@"id"];
                    [self saveWithCompletion:completion];
                } else {
                    completion(success, nil, [self availabilitySaveError:@"Event Availabilities Not Found"]);
                    return;
                }
                
            } else if(success == NO) {
                completion(success, nil, error);
                return;
            } else {
                completion(success, nil, [self availabilitySaveError:@"Event Availabilities Not Found"]);
                return;
            }
        }];
    } else {
        [super saveWithCompletion:completion];
    }
}

- (NSError *)availabilitySaveError:(NSString *)errorDescription {
    NSLog(@"* Availability Error %@", errorDescription);
    NSDictionary *userInfo = @{NSLocalizedFailureReasonErrorKey : errorDescription, NSLocalizedDescriptionKey : NSLocalizedString(errorDescription, errorDescription)};
    return [NSError errorWithDomain:TSDKTeamSnapSDKErrorDomainKey code:1 userInfo:userInfo];
}

@end
