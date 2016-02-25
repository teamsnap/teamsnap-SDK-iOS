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
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, weak) NSString *opponentRecord; //Example: 0-1
@property (nonatomic, assign) NSInteger overtimeLosses; //Example: 0
@property (nonatomic, assign) NSInteger wins; //Example: 0
@property (nonatomic, assign) NSInteger ties; //Example: 0
@property (nonatomic, weak) NSURL *linkTeam;
@property (nonatomic, weak) NSURL *linkOpponent;

@end

@interface TSDKOpponentResults (ForwardedMethods)

-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion;
-(void)getOpponentWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKOpponentArrayCompletionBlock)completion;


@end
