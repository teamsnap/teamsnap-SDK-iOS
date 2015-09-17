//
//  TSDKStatisticDatum.h
//  SDKPlayground
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKStatisticDatum : TSDKCollectionObject

@property (nonatomic) NSInteger ranking; //Example: 1
@property (nonatomic) NSInteger statisticId; //Example: 769991
@property (nonatomic) NSInteger value; //Example: 5
@property (nonatomic) NSInteger memberId; //Example: 3652826
@property (nonatomic) NSInteger teamId; //Example: 71118
@property (nonatomic) NSInteger eventId; //Example: 2357548
@property (nonatomic, weak) NSURL *linkMember;
@property (nonatomic, weak) NSURL *linkStatistic;
@property (nonatomic, weak) NSURL *linkEvent;
@property (nonatomic, weak) NSURL *linkTeam;

@end
