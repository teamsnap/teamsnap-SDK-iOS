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
@property (nonatomic, strong) NSString *_Nullable shootoutLabel; //Example: **NULL**
@property (nonatomic, strong) NSString *_Nullable overtimeLabel; //Example: **NULL**
@property (nonatomic, assign) BOOL hasCustomizedLanguage; //Example: 1
@property (nonatomic, assign) BOOL isNonSport; //Example: 0
@property (nonatomic, strong) NSString *_Nullable overtimeAbbrev; //Example: **NULL**
@property (nonatomic, assign) BOOL tracksPoints; //Example: 1
@property (nonatomic, assign) BOOL hasOvertime; //Example: 0
@property (nonatomic, assign) BOOL lowScoreWins; //Example: 0
@property (nonatomic, strong) NSString *_Nullable shootoutAbbrev; //Example: **NULL**
@property (nonatomic, strong) NSString *_Nullable name; //Example: Baseball
@property (nonatomic, assign) BOOL tracksOvertimeLosses; //Example: 0
@property (nonatomic, strong) NSURL *_Nullable linkSportLogo;

-(NSString *_Nullable)memberDescription;
-(NSString *_Nullable)membersDescription;
-(NSString *_Nullable)nonMemberDescription;
-(NSString *_Nullable)nonMembersDescription;

@end

@interface TSDKSport (ForwardedMethods)

#if TARGET_OS_IPHONE
-(void)getSportLogoWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKImageCompletionBlock _Nullable)completion;
#endif

@end
