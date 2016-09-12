//
//  TSDKLeagueCustomDatum.h
//  SDKDeveloperTools
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"
#import "TSDKCustomDatum.h"

@interface TSDKLeagueCustomDatum : TSDKCollectionObject <TSDKCustomDataProtocol>

@property (nonatomic, assign) NSInteger leagueCustomFieldId; //Example: 35598
@property (nonatomic, assign) BOOL teamCanRead; //Example: 1
@property (nonatomic, assign) BOOL teamCanEdit; //Example: 1
@property (nonatomic, weak) NSURL *linkMember;
@property (nonatomic, weak) NSURL *linkLeagueCustomField;
@property (nonatomic, weak) NSURL *linkTeam;

@end

@interface TSDKLeagueCustomDatum (ForwardedMethods)

-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberArrayCompletionBlock)completion;
-(void)getLeagueCustomFieldWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKLeagueCustomFieldArrayCompletionBlock)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion;


@end
