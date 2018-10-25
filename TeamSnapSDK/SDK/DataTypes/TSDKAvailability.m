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
        NSString *eventId = self.eventId;
        NSString *memberId = self.memberId;
        NSString *teamId = self.teamId;
        if ((memberId == nil) || (eventId == nil) || (teamId == nil)) {
            NSLog(@"* Something missing %@ %@ %@", memberId, eventId, teamId);
            completion(NO, self, [self availabilitySaveError:@"Information missing"]);
            return;
        }
        __typeof__(self) __weak weakSelf = self;
        
        NSLog(@"* Getting event information");
        [TSDKEvent getEventWithId:eventId teamId:teamId completion:^(BOOL success, TSDKEvent * _Nullable event, NSError * _Nullable error) {
            NSLog(@"* Got event information");
            if (event == nil) {
                completion(NO, nil, [weakSelf availabilitySaveError:@"Event Not Found"]);
                return;
            }
            [event getAvailabilitiesWithConfiguration:[TSDKRequestConfiguration new] completion:^(BOOL success, BOOL complete, TSDKAvailabilityGroups *_Nullable availabilities, NSError *_Nullable error) {
                NSLog(@"* Fetched Availabilities!");
                //TODO Here:
                TSDKAvailability *newAvailability = [availabilities availabilityForMemberId:memberId];
                if (newAvailability == nil) {
                    NSLog(@"* Couldn't find availability");
                    completion(NO, nil, [weakSelf availabilitySaveError:@"Event Availabilities Not Found"]);
                    return;
                }
                if (weakSelf) {
                    __typeof__(self) __strong strongSelf = weakSelf;
                    // Option 1
                    /*
                    newAvailability.statusCode = strongSelf.statusCode;
                    newAvailability.notes = strongSelf.notes;
                    NSLog(@"* Saving new availability");
                    [newAvailability saveWithCompletion:completion];
                     */
                    
                    // Option 2
                    [strongSelf.collection setHref:newAvailability.urlForSave];
                    [strongSelf setValue:newAvailability.objectIdentifier forKey:@"id"];
                    NSLog(@"* Saving new availability");
                    [strongSelf saveWithCompletion:completion];
                }
            }];
        }];
    } else {
        [super saveWithCompletion:completion];
    }
}

- (NSError *)availabilitySaveError:(NSString *)errorDescription {
    NSLog(@"* Availability Error %@", errorDescription);
    NSDictionary *userInfo = @{NSLocalizedFailureReasonErrorKey : errorDescription, NSLocalizedDescriptionKey : NSLocalizedString(errorDescription, errorDescription)};
    return NSError errorWithDomain:TSDKTeamSnapSDKErrorDomainKey code:1 userInfo:userInfo];
}

@end
