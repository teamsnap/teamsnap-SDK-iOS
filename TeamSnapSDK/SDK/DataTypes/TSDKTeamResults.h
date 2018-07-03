//
//  TSDKTeamResults.h
//  SDKDeveloperTools
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKTeamResults : TSDKCollectionObject

@property (nonatomic, assign) NSInteger losses; //Example: 13
@property (nonatomic, strong) NSString *_Nullable overallRecord; //Example: 18-13-2
@property (nonatomic, strong) NSString *_Nullable teamId; //Example: 71118
@property (nonatomic, assign) NSInteger wins; //Example: 18
@property (nonatomic, assign) NSInteger overtimeLosses; //Example: 0
@property (nonatomic, assign) NSInteger ties; //Example: 2
@property (nonatomic, strong) NSURL *_Nullable linkTeam;

@end

@interface TSDKTeamResults (ForwardedMethods)

-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;


@end
