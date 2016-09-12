//
//  TSDKLeagueCustomField.h
//  SDKDeveloperTools
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKLeagueCustomField : TSDKCollectionObject

@property (nonatomic, weak) NSString *helpText; //Example:
@property (nonatomic, weak) NSString *name; //Example: Public Field
@property (nonatomic, weak) NSString *validationType; //Example: **NULL**
@property (nonatomic, assign) NSInteger divisionId; //Example: 2040
@property (nonatomic, assign) NSInteger teamCanEdit; //Example: 1
@property (nonatomic, assign) NSInteger teamCanRead; //Example: 1
@property (nonatomic, weak) NSString *kind; //Example: Text
@property (nonatomic, assign) NSInteger required; //Example: 1
@property (nonatomic, weak) NSString *options; //Example: **NULL**
@property (nonatomic, weak) NSURL *linkTeams;
@property (nonatomic, weak) NSURL *linkLeagueCustomData;




@end

@interface TSDKLeagueCustomField (ForwardedMethods)

-(void)getTeamsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion;
-(void)getLeagueCustomDataWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKCustomLeagueDatumArrayCompletionBlock)completion;


@end
