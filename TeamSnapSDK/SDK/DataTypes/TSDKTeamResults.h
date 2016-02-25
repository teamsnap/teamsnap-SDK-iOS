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
@property (nonatomic, weak) NSString *overallRecord; //Example: 18-13-2
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, assign) NSInteger wins; //Example: 18
@property (nonatomic, assign) NSInteger overtimeLosses; //Example: 0
@property (nonatomic, assign) NSInteger ties; //Example: 2
@property (nonatomic, weak) NSURL *linkTeam;

@end

@interface TSDKTeamResults (ForwardedMethods)

-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion;


@end
