//
//  TSDKAvailabilittyGroups.m
//  SDKDeveloperTools
//
//  Created by Jason Rahaim on 2/26/16.
//  Copyright © 2016 jasonr. All rights reserved.
//

#import "TSDKAvailabilityGroups.h"
#import "TSDKAvailability.h"

@implementation TSDKAvailabilityGroups

- (instancetype)initWithAvailabilityArray:(NSArray <TSDKAvailability *> *)availabilities {
    self = [self init];
    if (self) {
        NSIndexSet *availableIndexes = [availabilities indexesOfObjectsPassingTest:^BOOL(TSDKAvailability * _Nonnull availability, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"%ld - %@", (long)availability.statusCode, availability.status);
            return availability.statusCode == TSDKAvailabilityIsAvailable;
        }];
        
        _availabile = [availabilities objectsAtIndexes:availableIndexes];
        
        NSIndexSet *unknownAvailableIndexes = [availabilities indexesOfObjectsPassingTest:^BOOL(TSDKAvailability * _Nonnull availability, NSUInteger idx, BOOL * _Nonnull stop) {
            return availability.statusCode == TSDKAvailabilityIsUnknown;
        }];
        
        _unknwownAvailability = [availabilities objectsAtIndexes:unknownAvailableIndexes];
        
        NSIndexSet *notAvailableIndexes = [availabilities indexesOfObjectsPassingTest:^BOOL(TSDKAvailability * _Nonnull availability, NSUInteger idx, BOOL * _Nonnull stop) {
            return availability.statusCode == TSDKAvailabilityIsNotAvailable;
        }];
        
        _notAvailabile = [availabilities objectsAtIndexes:notAvailableIndexes];
        
        NSIndexSet *maybeAvailableIndexes = [availabilities indexesOfObjectsPassingTest:^BOOL(TSDKAvailability * _Nonnull availability, NSUInteger idx, BOOL * _Nonnull stop) {
            return availability.statusCode == TSDKAvailabilityIsMaybeAvailable;
        }];
        
        _maybeAvailabile = [availabilities objectsAtIndexes:maybeAvailableIndexes];
        self.lastUpdate = [NSDate date];
    }
    return self;
}

- (NSArray *)allAvailabilities {
    return [[[[NSArray arrayWithArray:self.availabile] arrayByAddingObjectsFromArray:self.maybeAvailabile] arrayByAddingObjectsFromArray:self.notAvailabile] arrayByAddingObjectsFromArray:self.unknwownAvailability];
}

- (TSDKAvailability *)availabilityForMemberId:(NSString *)memberId {
    NSArray *allAvailabilities =  [self allAvailabilities];
    
    NSInteger availanilityIndex = [allAvailabilities indexOfObjectPassingTest:^BOOL(TSDKAvailability *  _Nonnull availability, NSUInteger idx, BOOL * _Nonnull stop) {
        return ([availability.memberId isEqualToString:memberId]);
    }];
    
    if (availanilityIndex !=NSNotFound) {
        return [allAvailabilities objectAtIndex:availanilityIndex];
    } else {
        return nil;
    }
}

@end
