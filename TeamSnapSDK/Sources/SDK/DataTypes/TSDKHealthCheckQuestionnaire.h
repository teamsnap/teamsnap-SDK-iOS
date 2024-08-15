//// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKHealthCheckQuestionnaire : TSDKCollectionObject

@property (nonatomic, strong, nullable) NSString * status; //Example: unknown
@property (nonatomic, strong, nullable) NSDate * createdAt; //Example: <null>
@property (nonatomic, strong, nullable) NSDate * completedAt; //Example: <null>
@property (nonatomic, strong, nullable) NSString * memberId; //Example: 134
@property (nonatomic, strong, nullable) NSString * eventId; //Example: 206
@property (nonatomic, strong, nullable) NSDate * updatedAt; //Example: <null>
@property (nonatomic, strong, nullable) NSURL * linkEvent;
@property (nonatomic, strong, nullable) NSURL * linkMember;

@end

@interface TSDKHealthCheckQuestionnaire (ForwardedMethods)

-(void)getEventWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKEventArrayCompletionBlock _Nonnull)completion;
-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberArrayCompletionBlock _Nonnull)completion;

@end
