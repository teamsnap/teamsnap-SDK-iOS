//
//  TSDKCustomDatum.h
//  SDKPlayground
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKCustomDatum : TSDKCollectionObject

@property (nonatomic, weak) NSString *name; //Example: Size
@property (nonatomic, weak) NSString *options; //Example: Y Small, Y Medium,Y Large,Small,Medium,Large
@property (nonatomic, weak) NSString *value; //Example: Small
@property (nonatomic, assign) BOOL isPrivate; //Example: 0
@property (nonatomic, assign) NSInteger memberId; //Example: 1086731
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, weak) NSString *kind; //Example: Menu
@property (nonatomic, assign) NSInteger customFieldId; //Example: 25383
@property (nonatomic, weak) NSString *helpText; //Example:
@property (nonatomic, weak) NSURL *linkCustomField;
@property (nonatomic, weak) NSURL *linkMember;
@property (nonatomic, weak) NSURL *linkTeam;

@end

@interface TSDKCustomDatum (ForwardedMethods)

-(void)getCustomFieldWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKCustomFieldArrayCompletionBlock)completion;
-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberArrayCompletionBlock)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion;


@end
