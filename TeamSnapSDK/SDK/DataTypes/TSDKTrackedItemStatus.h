//
//  TSDKTrackedItemStatus.h
//  SDKPlayground
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

typedef NS_ENUM(NSInteger, TSDKTrackedItemStatusCode) {
    TSDKTrackedItemStatusCodeNotFound = -1,
    TSDKTrackedItemStatusCodeNo = 0,
    TSDKTrackedItemStatusCodeYes = 1,
    TSDKTrackedItemStatusCodeNotApplicable = 2
};

@interface TSDKTrackedItemStatus : TSDKCollectionObject

@property (nonatomic, weak) NSString *_Nullable status; //Example: Complete
@property (nonatomic, assign) NSInteger statusCode; //Example: 1
@property (nonatomic, weak) NSDate *_Nullable createdAt; //Example: 2015-02-25T16:52:48Z
@property (nonatomic, weak) NSString *_Nullable memberId; //Example: 10757149
@property (nonatomic, weak) NSString *_Nullable teamId; //Example: 71118
@property (nonatomic, weak) NSDate *_Nullable updatedAt; //Example: 2015-02-25T16:52:48Z
@property (nonatomic, weak) NSString *_Nullable trackedItemId; //Example: 286943
@property (nonatomic, weak) NSURL *_Nullable linkMember;
@property (nonatomic, weak) NSURL *_Nullable linkTeam;
@property (nonatomic, weak) NSURL *_Nullable linkTrackedItem;

@end

@interface TSDKTrackedItemStatus (ForwardedMethods)

-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberArrayCompletionBlock _Nullable)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;
-(void)getTrackedItemWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTrackedItemArrayCompletionBlock _Nullable)completion;


@end
