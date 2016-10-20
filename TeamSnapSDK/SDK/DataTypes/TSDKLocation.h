//
//  TSDKLocation.h
//  SDKPlayground
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKLocation : TSDKCollectionObject

@property (nonatomic, weak) NSString *_Nullable phone; //Example:
@property (nonatomic, weak) NSString *_Nullable address; //Example: 611 main st, cary, NC
@property (nonatomic, weak) NSString *_Nullable notes; //Example: Note about this location. It's a long note.
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, weak) NSString *_Nullable name; //Example: Falcon Park
@property (nonatomic, weak) NSString *_Nullable url; //Example: http://www.google.com
@property (nonatomic, weak) NSURL *_Nullable linkTeam;
@property (nonatomic, weak) NSURL *_Nullable linkEvents;

@end

@interface TSDKLocation (ForwardedMethods)

-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;
-(void)getEventsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKEventArrayCompletionBlock _Nullable)completion;


@end
