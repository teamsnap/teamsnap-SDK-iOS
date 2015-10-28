//
//  TSDKInviteStatus.h
//  SDKDeveloperTools
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKInviteStatus : TSDKCollectionObject

@property (nonatomic) BOOL userExists; //Example: 1
@property (nonatomic) BOOL invitationPending; //Example: 0
@property (nonatomic, weak) NSString *emailAddress;

@end