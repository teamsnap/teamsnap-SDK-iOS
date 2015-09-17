//
//  TSDKSport.h
//  SDKPlayground
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKSport : TSDKCollectionObject

@property (nonatomic) NSInteger hasShootouts; //Example: 0
@property (nonatomic) NSInteger hasStatisticTemplate; //Example: 1
@property (nonatomic, weak) NSString *shootoutLabel; //Example: **NULL**
@property (nonatomic, weak) NSString *overtimeLabel; //Example: **NULL**
@property (nonatomic) NSInteger hasCustomizedLanguage; //Example: 1
@property (nonatomic) BOOL isNonSport; //Example: 0
@property (nonatomic, weak) NSString *overtimeAbbrev; //Example: **NULL**
@property (nonatomic) NSInteger tracksPoints; //Example: 1
@property (nonatomic) NSInteger hasOvertime; //Example: 0
@property (nonatomic) NSInteger lowScoreWins; //Example: 0
@property (nonatomic, weak) NSString *shootoutAbbrev; //Example: **NULL**
@property (nonatomic, weak) NSString *name; //Example: Baseball
@property (nonatomic) NSInteger tracksOvertimeLosses; //Example: 0

@end
