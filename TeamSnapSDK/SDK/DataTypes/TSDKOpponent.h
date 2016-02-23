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
@property (nonatomic, weak) NSString *contactsPhone; //Example: 919-TheBulls
@property (nonatomic, weak) NSString *notes; //Example: This is a long opponent note. This is a long opponent note. This is a long opponent note. This is a long opponent note. This is a long opponent note. This is a long opponent note. and done.
@property (nonatomic, weak) NSString *contactsName; //Example: Wool E. Bull
@property (nonatomic, weak) NSString *contactsEmail; //Example: woolebull@durhambulls.com
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, weak) NSString *name; //Example: Bulls
@property (nonatomic, weak) NSURL *linkOpponentResults;
@property (nonatomic, weak) NSURL *linkTeam;
@property (nonatomic, weak) NSURL *linkEvents;

@end

@interface TSDKOpponent (ForwardedMethods)

-(void)getOpponentResultsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion;
-(void)getEventsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKEventArrayCompletionBlock)completion;

@end
