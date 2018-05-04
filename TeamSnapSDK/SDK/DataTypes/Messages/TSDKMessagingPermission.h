//
//  TSDKMessagingPermission.h
//  TeamSnapSDK
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKMessagingPermission : TSDKCollectionObject

@property (nonatomic, weak, nullable) NSString * message; //Example:
@property (nonatomic, assign) BOOL canSendUserProvidedContent; //Example: 1
@property (nonatomic, weak, nullable) NSString * teamId; //Example: 71118
@property (nonatomic, weak, nullable) NSURL * linkTeam;

@end

@interface TSDKMessagingPermission (ForwardedMethods)

-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nonnull)completion;

@end

