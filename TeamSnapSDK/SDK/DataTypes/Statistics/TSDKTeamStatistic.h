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

@property (nonatomic, assign) NSInteger average; //Example: 0
@property (nonatomic, assign) NSInteger total; //Example: 0
@property (nonatomic, weak) NSString *_Nullable statisticId; //Example: 3093146
@property (nonatomic, weak) NSURL *_Nullable linkTeam;
@property (nonatomic, weak) NSURL *_Nullable linkStatistic;

@end
