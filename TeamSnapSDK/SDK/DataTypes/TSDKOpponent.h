//
//  TSDKOpponent.h
//  SDKPlayground
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKOpponent : TSDKCollectionObject

@property (nonatomic, assign) BOOL isLeagueControlled; //Example: 0
@property (nonatomic, weak) NSString *_Nullable contactsPhone; //Example: 919-TheBulls
@property (nonatomic, weak) NSString *_Nullable notes; //Example: This is a long opponent note. This is a long opponent note. This is a long opponent note. This is a long opponent note. This is a long opponent note. This is a long opponent note. and done.
@property (nonatomic, weak) NSString *_Nullable contactsName; //Example: Wool E. Bull
@property (nonatomic, weak) NSString *_Nullable contactsEmail; //Example: woolebull@durhambulls.com
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, weak) NSString *_Nullable name; //Example: Bulls
@property (nonatomic, weak) NSURL *_Nullable linkOpponentResults;
@property (nonatomic, weak) NSURL *_Nullable linkTeam;
@property (nonatomic, weak) NSURL *_Nullable linkEvents;

@end

@interface TSDKOpponent (ForwardedMethods)

-(void)getOpponentResultsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;
-(void)getEventsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKEventArrayCompletionBlock _Nullable)completion;

@end
