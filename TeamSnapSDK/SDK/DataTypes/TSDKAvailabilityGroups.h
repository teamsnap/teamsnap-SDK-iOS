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

@property (nonatomic, strong) NSArray *availabile;
@property (nonatomic, strong) NSArray *notAvailabile;
@property (nonatomic, strong) NSArray *maybeAvailabile;
@property (nonatomic, strong) NSArray *unknwownAvailability;

- (instancetype)initWithAvailabilityArray:(NSArray <TSDKAvailability *> *)availabilities;

@end
