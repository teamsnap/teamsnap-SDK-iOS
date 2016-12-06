//
//  TSDKOpponentResults.h
//  TeamSnapSDK
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKOpponentResults : TSDKCollectionObject

@property (nonatomic, assign) NSInteger losses; //Example: 1
@property (nonatomic, weak) NSString *_Nullable teamId; //Example: 71118
@property (nonatomic, weak) NSString *_Nullable opponentRecord; //Example: 0-1
@property (nonatomic, assign) NSInteger overtimeLosses; //Example: 0
@property (nonatomic, assign) NSInteger wins; //Example: 0
@property (nonatomic, assign) NSInteger ties; //Example: 0
@property (nonatomic, weak) NSURL *_Nullable linkTeam;
@property (nonatomic, weak) NSURL *_Nullable linkOpponent;

@end

@interface TSDKOpponentResults (ForwardedMethods)

-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;
-(void)getOpponentWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKOpponentArrayCompletionBlock _Nullable)completion;


@end
