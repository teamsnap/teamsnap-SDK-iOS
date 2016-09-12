//
//  TSDKLeagueCustomDatum.h
//  SDKDeveloperTools
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKLeagueCustomDatum : TSDKCollectionObject

@property (nonatomic, weak) NSString *options; //Example: **NULL**
@property (nonatomic, assign) NSInteger leagueCustomFieldId; //Example: 35598
@property (nonatomic, weak) NSString *value; //Example: DataPublic
@property (nonatomic, assign) NSInteger teamCanRead; //Example: 1
@property (nonatomic, assign) NSInteger teamCanEdit; //Example: 1
@property (nonatomic, assign) BOOL isPrivate; //Example: 0
@property (nonatomic, weak) NSString *helpText; //Example:
@property (nonatomic, assign) NSInteger teamId; //Example: 148875
@property (nonatomic, weak) NSString *kind; //Example: Text
@property (nonatomic, weak) NSString *name; //Example: Public Field
@property (nonatomic, assign) NSInteger memberId; //Example: 1887784
@property (nonatomic, weak) NSURL *linkMember;
@property (nonatomic, weak) NSURL *linkLeagueCustomField;
@property (nonatomic, weak) NSURL *linkTeam;

@end

@interface TSDKLeagueCustomDatum (ForwardedMethods)

-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberArrayCompletionBlock)completion;
-(void)getLeagueCustomFieldWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKLeagueCustomFieldArrayCompletionBlock)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion;


@end
