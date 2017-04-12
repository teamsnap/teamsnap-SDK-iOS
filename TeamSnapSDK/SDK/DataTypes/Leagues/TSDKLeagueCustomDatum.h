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

@property (nonatomic, weak) NSString *_Nullable leagueCustomFieldId; //Example: 35598
@property (nonatomic, assign) BOOL teamCanRead; //Example: 1
@property (nonatomic, assign) BOOL teamCanEdit; //Example: 1
@property (nonatomic, weak) NSURL *_Nullable linkMember;
@property (nonatomic, weak) NSURL *_Nullable linkLeagueCustomField;
@property (nonatomic, weak) NSURL *_Nullable linkTeam;

@end

@interface TSDKLeagueCustomDatum (ForwardedMethods)

-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberArrayCompletionBlock _Nullable)completion;
-(void)getLeagueCustomFieldWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKLeagueCustomFieldArrayCompletionBlock _Nullable)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;


@end
