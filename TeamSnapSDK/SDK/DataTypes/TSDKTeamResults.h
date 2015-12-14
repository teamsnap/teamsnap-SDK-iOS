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

@property (nonatomic, assign) NSInteger losses; //Example: 3
@property (nonatomic, weak) NSString *overallRecord; //Example: 7-3
@property (nonatomic, assign) NSInteger teamId; //Example: 153832
@property (nonatomic, assign) NSInteger wins; //Example: 7
@property (nonatomic, assign) NSInteger overtimeLosses; //Example: 0
@property (nonatomic, assign) NSInteger ties; //Example: 0
@property (nonatomic, weak) NSURL *linkTeam;


-(void)getTeamWithCompletion:(TSDKArrayCompletionBlock)completion;

@end
