//
//  TSDKAvailabilittyGroups.h
//  SDKDeveloperTools
//
//  Created by Jason Rahaim on 2/26/16.
//  Copyright © 2016 jasonr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKAvailability.h"

@interface TSDKAvailabilityGroups : NSObject

@property (nonatomic, strong) NSArray <TSDKAvailability *> * availabile;
@property (nonatomic, strong) NSArray <TSDKAvailability *> * notAvailabile;
@property (nonatomic, strong) NSArray <TSDKAvailability *> * maybeAvailabile;
@property (nonatomic, strong) NSArray <TSDKAvailability *> * unknwownAvailability;
@property (nonatomic, strong) NSDate * lastUpdate;

- (instancetype)initWithAvailabilityArray:(NSArray <TSDKAvailability *> *)availabilities;
- (TSDKAvailability *)availabilityForMemberId:(NSInteger)memberId;

@end
