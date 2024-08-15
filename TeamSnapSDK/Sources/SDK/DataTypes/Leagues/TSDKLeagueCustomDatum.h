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

@property (nonatomic, strong) NSString *_Nullable leagueCustomFieldId; //Example: 35598
@property (nonatomic, assign) BOOL teamCanRead; //Example: 1
@property (nonatomic, assign) BOOL teamCanEdit; //Example: 1
@property (nonatomic, strong) NSURL *_Nullable linkMember;
@property (nonatomic, strong) NSURL *_Nullable linkLeagueCustomField;
@property (nonatomic, strong) NSURL *_Nullable linkTeam;

- (NSString *_Nullable)displayValue;
- (NSString * _Nullable)customFieldId;

- (instancetype _Nonnull)initWithField:(TSDKLeagueCustomField *_Nonnull)field memberId:(NSString *_Nonnull)memberId teamId:(NSString *_Nonnull)teamId;

@end

@interface TSDKLeagueCustomDatum (ForwardedMethods)

-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberArrayCompletionBlock _Nullable)completion;
-(void)getLeagueCustomFieldWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKLeagueCustomFieldArrayCompletionBlock _Nullable)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;


@end


