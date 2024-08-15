//
//  TSDKAvailability.h
//  SDKPlayground
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

typedef NS_CLOSED_ENUM(NSInteger,TSDKAvailabilityState) {
    TSDKAvailabilityStateIsNotAvailable = 0,
    TSDKAvailabilityStateIsAvailable = 1,
    TSDKAvailabilityStateIsMaybeAvailable = 2,
    TSDKAvailabilityStateIsUnknown = 3
};


@interface TSDKAvailability : TSDKCollectionObject

@property (nonatomic, strong) NSString *_Nullable status; //Example: Yes. I will be there.
@property (nonatomic, strong) NSString *_Nullable notes; //Example: **NULL**
@property (nonatomic, strong) NSString *_Nullable notesAuthorMemberId; //Example: **NULL**
@property (nonatomic, assign) TSDKAvailabilityState statusCode; //Example: 1
@property (nonatomic, strong) NSString *_Nullable memberId; //Example: 993324
@property (nonatomic, strong) NSString *_Nullable eventId; //Example: 2357548
@property (nonatomic, strong) NSString *_Nullable teamId; //Example: 71118
@property (nonatomic, strong) NSDate *_Nullable createdAt; //Example: 2012-05-18T21:43:47Z
@property (nonatomic, strong) NSDate *_Nullable updatedAt; //Example: 2014-04-25T00:35:41Z
@property (nonatomic, strong) NSURL *_Nullable linkEvent;
@property (nonatomic, strong) NSURL *_Nullable linkMember;
@property (nonatomic, strong) NSURL *_Nullable linkTeam;

//+(void)actionBulkMarkUnsetAvailabilitiesWithCompletion:(TSDKCompletionBlock)completion; //(null)

@end

@interface TSDKAvailability (ForwardedMethods)

-(void)getEventWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKEventArrayCompletionBlock _Nullable)completion;
-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberArrayCompletionBlock _Nullable)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;

@end
