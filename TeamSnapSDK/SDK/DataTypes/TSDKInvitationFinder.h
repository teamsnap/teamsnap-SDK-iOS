//
//  TSDKInvitationFinder.h
//  SDKDeveloperTools
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKInvitationFinder : TSDKCollectionObject

@property (nonatomic, assign) BOOL isExistingUser; //Example: 1
@property (nonatomic, assign) BOOL isInvitationPending; //Example: 0
@property (nonatomic, weak) NSString *_Nullable emailAddress;

@end
