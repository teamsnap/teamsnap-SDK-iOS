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
@property (nonatomic, weak) NSString *_Nullable statisticGroupId; //Example: 64018
@property (nonatomic, assign) NSInteger position; //Example: 1
@property (nonatomic, assign) BOOL isInDescendingOrder; //Example: 0
@property (nonatomic, weak) NSString *_Nullable prettyFormula; //Example: **NULL**
@property (nonatomic, weak) NSString *_Nullable acronym; //Example: AB
@property (nonatomic, weak) NSString *_Nullable formula; //Example:
@property (nonatomic, assign) BOOL isPercentage; //Example: <null>
@property (nonatomic, assign) BOOL isTopStatistic; //Example: 0
@property (nonatomic, assign) BOOL isPrivate; //Example: 0
@property (nonatomic, weak) NSString *_Nullable displayZeroTotals; //Example: **NULL**
@property (nonatomic, weak) NSString *_Nullable precision; //Example: **NULL**
@property (nonatomic, weak) NSString *_Nullable teamId; //Example: 71118
@property (nonatomic, weak) NSString *_Nullable name; //Example: At Bats
@property (nonatomic, assign) NSInteger alwaysDisplayDecimals; //Example: 0
@property (nonatomic, weak) NSURL *_Nullable linkStatisticGroup;
@property (nonatomic, weak) NSURL *_Nullable linkTeamStatistics;
@property (nonatomic, weak) NSURL *_Nullable linkTeam;
@property (nonatomic, weak) NSURL *_Nullable linkMemberStatistics;
@property (nonatomic, weak) NSURL *_Nullable linkStatisticData;

@end
