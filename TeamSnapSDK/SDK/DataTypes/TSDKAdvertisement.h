// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKAdvertisement : TSDKCollectionObject

@property (nonatomic, weak) NSString *_Nullable userId; //Example: 388192
@property (nonatomic, weak) NSString *_Nullable teamId; //Example: 71118
@property (nonatomic, assign) BOOL canDisplayAds; //Example: 1
@property (nonatomic, weak) NSURL *_Nullable linkTeam;
@property (nonatomic, weak) NSURL *_Nullable linkUser;


@end

@interface TSDKAdvertisement (ForwardedMethods)

-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nonnull)completion;
-(void)getUserWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKUserArrayCompletionBlock _Nonnull)completion;


@end
