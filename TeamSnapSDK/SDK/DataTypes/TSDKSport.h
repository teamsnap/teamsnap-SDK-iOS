//
//  TSDKSport.h
//  
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

extern const NSInteger TSPSportBaseball;
extern const NSInteger TSPSportSoftBall;
extern const NSInteger TSPSportKickball;
extern const NSInteger TSPSportSlowPitch;
extern const NSInteger TSPSportSoccer;
extern const NSInteger TSPIndoorSoccer;
extern const NSInteger TSPSportFootball;
extern const NSInteger TSPSportHockey;
extern const NSInteger TSPSportBasketball;
extern const NSInteger TSPSportLacrosse;
extern const NSInteger TSPSportRugby;
extern const NSInteger TSPSportFieldHockey;
extern const NSInteger TSPSportWrestling;
extern const NSInteger TSPSportRingette;
extern const NSInteger TSPSportIndoorSoccer;
extern const NSInteger TSPSportInlineHockey;
extern const NSInteger TSPSportWaterPolo;
extern const NSInteger TSPSportFloorHockey;
extern const NSInteger TSPSportAustralianFootball;
extern const NSInteger TSPSportNetball;
extern const NSInteger TSPSportFloorball;
extern const NSInteger TSPSportStreetHockey;
extern const NSInteger TSPSportNonSportGroup;

@interface TSDKSport : TSDKCollectionObject <TSDKCollectionObjectBundledDataProtocol>

@property (nonatomic, assign) BOOL hasShootouts; //Example: 0
@property (nonatomic, assign) BOOL hasStatisticTemplate; //Example: 1
@property (nonatomic, weak) NSString *shootoutLabel; //Example: **NULL**
@property (nonatomic, weak) NSString *overtimeLabel; //Example: **NULL**
@property (nonatomic, assign) BOOL hasCustomizedLanguage; //Example: 1
@property (nonatomic, assign) BOOL isNonSport; //Example: 0
@property (nonatomic, weak) NSString *overtimeAbbrev; //Example: **NULL**
@property (nonatomic, assign) BOOL tracksPoints; //Example: 1
@property (nonatomic, assign) BOOL hasOvertime; //Example: 0
@property (nonatomic, assign) BOOL lowScoreWins; //Example: 0
@property (nonatomic, weak) NSString *shootoutAbbrev; //Example: **NULL**
@property (nonatomic, weak) NSString *name; //Example: Baseball
@property (nonatomic, assign) BOOL tracksOvertimeLosses; //Example: 0
@property (nonatomic, weak) NSURL *linkSportLogo;

-(NSString *)memberDescription;
-(NSString *)membersDescription;
-(NSString *)nonMemberDescription;
-(NSString *)nonMembersDescription;

@end

@interface TSDKSport (ForwardedMethods)

#if TARGET_OS_IPHONE
-(void)getSportLogoWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKImageCompletionBlock)completion;
#endif

@end
