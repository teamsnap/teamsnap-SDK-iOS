//
//  TSDKTeamMediumComment.h
//  TeamSnapSDK
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKTeamMediumComment : TSDKCollectionObject

@property (nonatomic, assign) NSInteger teamMediumId; //Example: 4147693
@property (nonatomic, weak) NSString *createdAt; //Example: 2016-02-23T14:50:45.000+00:00
@property (nonatomic, assign) NSInteger memberId; //Example: 993324
@property (nonatomic, weak) NSString *updatedAt; //Example: 2016-02-23T14:50:45.000+00:00
@property (nonatomic, weak) NSString *comment; //Example: Up
@property (nonatomic, weak) NSURL *linkTeam;
@property (nonatomic, weak) NSURL *linkMember;
@property (nonatomic, weak) NSURL *linkTeamMedium;

@end

@interface TSDKTeamMediumComment (ForwardedMethods)

-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion;
-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberArrayCompletionBlock)completion;
-(void)getTeamMediumWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;

@end
