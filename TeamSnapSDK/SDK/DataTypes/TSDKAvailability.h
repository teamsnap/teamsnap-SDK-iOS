//
//  TSDKAvailability.h
//  SDKPlayground
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

typedef enum TSDKAvailabilityState : NSInteger  {
    TSDKAvailabilityIsNotAvailable = 0,
    TSDKAvailabilityIsAvailable = 1,
    TSDKAvailabilityIsMaybeAvailable = 2,
    TSDKAvailabilityIsUnknown = 3
} TSDKAvailabilityState;


@interface TSDKAvailability : TSDKCollectionObject

@property (nonatomic, weak) NSString *_Nullable status; //Example: Yes. I will be there.
@property (nonatomic, weak) NSString *_Nullable notes; //Example: **NULL**
@property (nonatomic, assign) NSInteger notesAuthorMemberId; //Example: **NULL**
@property (nonatomic, assign) TSDKAvailabilityState statusCode; //Example: 1
@property (nonatomic, assign) NSInteger memberId; //Example: 993324
@property (nonatomic, assign) NSInteger eventId; //Example: 2357548
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, weak) NSDate *_Nullable createdAt; //Example: 2012-05-18T21:43:47Z
@property (nonatomic, weak) NSDate *_Nullable updatedAt; //Example: 2014-04-25T00:35:41Z
@property (nonatomic, weak) NSURL *_Nullable linkEvent;
@property (nonatomic, weak) NSURL *_Nullable linkMember;
@property (nonatomic, weak) NSURL *_Nullable linkTeam;

//+(void)actionBulkMarkUnsetAvailabilitiesWithCompletion:(TSDKCompletionBlock)completion; //(null)

@end

@interface TSDKAvailability (ForwardedMethods)

-(void)getEventWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKEventArrayCompletionBlock _Nullable)completion;
-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberArrayCompletionBlock _Nullable)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;

@end
