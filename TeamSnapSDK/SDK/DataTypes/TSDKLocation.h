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

@property (nonatomic, strong) NSString *_Nullable phone; //Example:
@property (nonatomic, strong) NSString *_Nullable address; //Example: 611 main st, cary, NC
@property (nonatomic, strong) NSString *_Nullable notes; //Example: Note about this location. It's a long note.
@property (nonatomic, strong) NSString *_Nullable teamId; //Example: 71118
@property (nonatomic, strong) NSString *_Nullable name; //Example: Falcon Park
@property (nonatomic, strong) NSString *_Nullable url; //Example: http://www.google.com
@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;
@property (nonatomic, strong) NSURL *_Nullable linkTeam;
@property (nonatomic, strong) NSURL *_Nullable linkEvents;

- (BOOL)hasGeocodedLocation;

@end

@interface TSDKLocation (ForwardedMethods)

-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;
-(void)getEventsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKEventArrayCompletionBlock _Nullable)completion;


@end
