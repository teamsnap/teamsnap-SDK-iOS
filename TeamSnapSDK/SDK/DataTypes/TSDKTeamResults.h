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

@property (nonatomic) NSInteger losses; //Example: 3
@property (nonatomic, weak) NSString *overallRecord; //Example: 7-3
@property (nonatomic) NSInteger teamId; //Example: 153832
@property (nonatomic) NSInteger wins; //Example: 7
@property (nonatomic) NSInteger overtimeLosses; //Example: 0
@property (nonatomic) NSInteger ties; //Example: 0
@property (nonatomic, weak) NSURL *linkTeam;


-(void)getTeamWithCompletion:(TSDKArrayCompletionBlock)completion;

@end
