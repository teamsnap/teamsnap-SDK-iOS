//
//  TSDKTrackedItemStatus.h
//  SDKPlayground
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

typedef NS_CLOSED_ENUM(NSInteger, TSDKTrackedItemStatusCode) {
    TSDKTrackedItemStatusCodeNotFound = -1,
    TSDKTrackedItemStatusCodeNo = 0,
    TSDKTrackedItemStatusCodeYes = 1,
    TSDKTrackedItemStatusCodeNotApplicable = 2
};

@interface TSDKTrackedItemStatus : TSDKCollectionObject

@property (nonatomic, strong) NSString *_Nullable status; //Example: Complete
@property (nonatomic, assign) NSInteger statusCode; //Example: 1
@property (nonatomic, strong) NSDate *_Nullable createdAt; //Example: 2015-02-25T16:52:48Z
@property (nonatomic, strong) NSString *_Nullable memberId; //Example: 10757149
@property (nonatomic, strong) NSString *_Nullable teamId; //Example: 71118
@property (nonatomic, strong) NSDate *_Nullable updatedAt; //Example: 2015-02-25T16:52:48Z
@property (nonatomic, strong) NSString *_Nullable trackedItemId; //Example: 286943
@property (nonatomic, strong) NSURL *_Nullable linkMember;
@property (nonatomic, strong) NSURL *_Nullable linkTeam;
@property (nonatomic, strong) NSURL *_Nullable linkTrackedItem;

@end

@interface TSDKTrackedItemStatus (ForwardedMethods)

-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberArrayCompletionBlock _Nullable)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;
-(void)getTrackedItemWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTrackedItemArrayCompletionBlock _Nullable)completion;


@end
