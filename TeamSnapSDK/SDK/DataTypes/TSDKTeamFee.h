//
//  TSDKTeamFee.h
//  SDKPlayground
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKTeamFee : TSDKCollectionObject

@property (nonatomic, weak) NSString *amount; //Example: 15.00
@property (nonatomic, weak) NSString *notes;
@property (nonatomic, weak) NSDate *createdAt; //Example: 2015-02-27T14:58:37.000+00:00
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, weak) NSString *teamFeeDescription; //Example: Hat
@property (nonatomic, weak) NSString *balance; //Example: 500.01
@property (nonatomic, weak) NSDate *updatedAt; //Example: 2015-06-22T19:25:34.000+00:00
@property (nonatomic, weak) NSURL *linkTeam;
@property (nonatomic, weak) NSURL *linkMemberPayments;

@end
