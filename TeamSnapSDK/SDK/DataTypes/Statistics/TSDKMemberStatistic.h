//
//  TSDKMemberStatistic.h
//  SDKPlayground
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKMemberStatistic : TSDKCollectionObject

@property (nonatomic) NSInteger teamId; //Example: 71118
@property (nonatomic) NSInteger average; //Example: 1.66667
@property (nonatomic) NSInteger statisticId; //Example: 769991
@property (nonatomic) NSInteger memberId; //Example: 3652826
@property (nonatomic) NSInteger averageRanking; //Example: 1
@property (nonatomic) NSInteger total; //Example: 5
@property (nonatomic) NSInteger totalRanking; //Example: 1
@property (nonatomic, weak) NSURL *linkMember;
@property (nonatomic, weak) NSURL *linkStatistic;
@property (nonatomic, weak) NSURL *linkTeam;

@end
