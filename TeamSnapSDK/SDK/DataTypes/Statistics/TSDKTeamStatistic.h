//
//  TSDKTeamStatistic.h
//  SDKPlayground
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKTeamStatistic : TSDKCollectionObject

@property (nonatomic, strong) NSNumber *_Nullable average; //Example: 0
@property (nonatomic, strong) NSNumber *_Nullable total; //Example: 0
@property (nonatomic, strong) NSString *_Nullable statisticId; //Example: 3093146
@property (nonatomic, strong) NSURL *_Nullable linkTeam;
@property (nonatomic, strong) NSURL *_Nullable linkStatistic;

@end
