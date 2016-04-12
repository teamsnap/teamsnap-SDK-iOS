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

@property (nonatomic, weak) NSString *status; //Example: Yes. I will be there.
@property (nonatomic, weak) NSString *notes; //Example: **NULL**
@property (nonatomic, weak) NSString *notesAuthorMemberId; //Example: **NULL**
@property (nonatomic, assign) TSDKAvailabilityState statusCode; //Example: 1
@property (nonatomic, assign) NSInteger memberId; //Example: 993324
@property (nonatomic, assign) NSInteger eventId; //Example: 2357548
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, weak) NSDate *createdAt; //Example: 2012-05-18T21:43:47Z
@property (nonatomic, weak) NSDate *updatedAt; //Example: 2014-04-25T00:35:41Z
@property (nonatomic, weak) NSURL *linkEvent;
@property (nonatomic, weak) NSURL *linkMember;
@property (nonatomic, weak) NSURL *linkTeam;

//+(void)actionBulkMarkUnsetAvailabilitiesWithCompletion:(TSDKCompletionBlock)completion; //(null)

@end

@interface TSDKAvailability (ForwardedMethods)

-(void)getEventWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKEventArrayCompletionBlock)completion;
-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberArrayCompletionBlock)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion;

@end
