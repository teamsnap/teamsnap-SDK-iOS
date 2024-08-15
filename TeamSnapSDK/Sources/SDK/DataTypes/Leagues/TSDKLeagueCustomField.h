//
//  TSDKLeagueCustomField.h
//  SDKDeveloperTools
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"
#import "TSDKCustomField.h"

@interface TSDKLeagueCustomField : TSDKCollectionObject <TSDKCustomField>

@property (nonatomic, strong) NSString *_Nullable helpText; //Example:
@property (nonatomic, strong) NSString *_Nullable name; //Example: Public Field
@property (nonatomic, strong) NSString *_Nullable validationType; //Example: **NULL**
@property (nonatomic, strong) NSString *_Nullable divisionId; //Example: 2040
@property (nonatomic, strong) NSString *_Nullable kind;
@property (nonatomic, assign) NSInteger position; //Example: 3 
@property (nonatomic, assign) BOOL required; //Example: 1
@property (nonatomic, assign) BOOL teamCanEdit; //Example: 1
@property (nonatomic, assign) BOOL teamCanRead; //Example: 1
@property (nonatomic, strong) NSArray<NSString *> *_Nullable options; //Example: **NULL**
@property (nonatomic, strong) NSURL *_Nullable linkTeams;
@property (nonatomic, strong) NSURL *_Nullable linkLeagueCustomData;

- (TSDKCustomDataFieldType)fieldType;

@end

@interface TSDKLeagueCustomField (ForwardedMethods)

-(void)getTeamsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;
-(void)getLeagueCustomDataWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKCustomLeagueDatumArrayCompletionBlock _Nullable)completion;


@end
