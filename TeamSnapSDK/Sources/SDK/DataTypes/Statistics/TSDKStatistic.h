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
@property (nonatomic, strong) NSString *_Nullable statisticGroupId; //Example: 64018
@property (nonatomic, assign) NSInteger position; //Example: 1
@property (nonatomic, assign) BOOL isInDescendingOrder; //Example: 0
@property (nonatomic, strong) NSString *_Nullable prettyFormula; //Example: **NULL**
@property (nonatomic, strong) NSString *_Nullable acronym; //Example: AB
@property (nonatomic, strong) NSString *_Nullable formula; //Example:
@property (nonatomic, assign) BOOL isPercentage; //Example: <null>
@property (nonatomic, assign) BOOL isTopStatistic; //Example: 0
@property (nonatomic, assign) BOOL isPrivate; //Example: 0
@property (nonatomic, assign) BOOL displayZeroTotals; //Example: **NULL**
@property (nonatomic, assign) NSInteger precision; //Example: **NULL**
@property (nonatomic, strong) NSString *_Nullable teamId; //Example: 71118
@property (nonatomic, strong) NSString *_Nullable name; //Example: At Bats
@property (nonatomic, assign) BOOL alwaysDisplayDecimals; //Example: 0
@property (nonatomic, strong) NSURL *_Nullable linkStatisticGroup;
@property (nonatomic, strong) NSURL *_Nullable linkTeamStatistics;
@property (nonatomic, strong) NSURL *_Nullable linkTeam;
@property (nonatomic, strong) NSURL *_Nullable linkMemberStatistics;
@property (nonatomic, strong) NSURL *_Nullable linkStatisticData;

- (NSString *_Nonnull)displayStringForStatisticValue:(NSNumber *_Nonnull)statValue;

@end
