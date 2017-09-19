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

@property (nonatomic, weak) NSString *_Nullable helpText; //Example:
@property (nonatomic, weak) NSString *_Nullable name; //Example: Public Field
@property (nonatomic, weak) NSString *_Nullable validationType; //Example: **NULL**
@property (nonatomic, weak) NSString *_Nullable divisionId; //Example: 2040
@property (nonatomic, weak) NSString *_Nullable kind;
@property (nonatomic, assign) NSInteger position; //Example: 3 
@property (nonatomic, assign) BOOL required; //Example: 1
@property (nonatomic, assign) BOOL teamCanEdit; //Example: 1
@property (nonatomic, assign) BOOL teamCanRead; //Example: 1
@property (nonatomic, weak) NSArray<NSString *> *_Nullable options; //Example: **NULL**
@property (nonatomic, weak) NSURL *_Nullable linkTeams;
@property (nonatomic, weak) NSURL *_Nullable linkLeagueCustomData;

- (TSDKCustomDataFieldType)fieldType;

@end

@interface TSDKLeagueCustomField (ForwardedMethods)

-(void)getTeamsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;
-(void)getLeagueCustomDataWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKCustomLeagueDatumArrayCompletionBlock _Nullable)completion;


@end
