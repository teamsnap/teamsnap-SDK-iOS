//
//  TSDKStatistic.h
//  SDKPlayground
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKStatistic : TSDKCollectionObject

@property (nonatomic, assign) BOOL isTeamStatistic; //Example: 0
@property (nonatomic, assign) NSInteger statisticGroupId; //Example: 64018
@property (nonatomic, assign) NSInteger position; //Example: 1
@property (nonatomic, assign) BOOL isInDescendingOrder; //Example: 0
@property (nonatomic, weak) NSString *prettyFormula; //Example: **NULL**
@property (nonatomic, weak) NSString *acronym; //Example: AB
@property (nonatomic, weak) NSString *formula; //Example:
@property (nonatomic, assign) BOOL isPercentage; //Example: <null>
@property (nonatomic, assign) BOOL isTopStatistic; //Example: 0
@property (nonatomic, assign) BOOL isPrivate; //Example: 0
@property (nonatomic, weak) NSString *displayZeroTotals; //Example: **NULL**
@property (nonatomic, weak) NSString *precision; //Example: **NULL**
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, weak) NSString *name; //Example: At Bats
@property (nonatomic, assign) NSInteger alwaysDisplayDecimals; //Example: 0
@property (nonatomic, weak) NSURL *linkStatisticGroup;
@property (nonatomic, weak) NSURL *linkTeamStatistics;
@property (nonatomic, weak) NSURL *linkTeam;
@property (nonatomic, weak) NSURL *linkMemberStatistics;
@property (nonatomic, weak) NSURL *linkStatisticData;

@end
