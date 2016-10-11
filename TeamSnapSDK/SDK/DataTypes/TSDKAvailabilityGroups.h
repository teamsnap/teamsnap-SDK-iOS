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

@property (nonatomic, strong) NSArray <TSDKAvailability *> *_Nullable availabile;
@property (nonatomic, strong) NSArray <TSDKAvailability *> *_Nullable notAvailabile;
@property (nonatomic, strong) NSArray <TSDKAvailability *> *_Nullable maybeAvailabile;
@property (nonatomic, strong) NSArray <TSDKAvailability *> *_Nullable unknwownAvailability;
@property (nonatomic, strong) NSDate *_Nullable lastUpdate;

- (instancetype _Nonnull)initWithAvailabilityArray:(NSArray <TSDKAvailability *> *_Nullable)availabilities;
- (TSDKAvailability *_Nullable)availabilityForMemberId:(NSInteger)memberId;

@end
