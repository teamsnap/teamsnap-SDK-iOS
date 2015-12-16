//
//  TSDKTrackedItem.h
//  SDKPlayground
//
//  Created by Jason Rahaim on 2/25/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKTrackedItem : TSDKCollectionObject

@property (nonatomic, weak) NSDate *createdAt; //Example: 2014-08-14T11:43:37Z
@property (nonatomic, weak) NSDate *updatedAt; //Example: 2014-08-14T11:43:37Z
@property (nonatomic, weak) NSString *name; //Example: Birth Certificate
@property (nonatomic, assign) NSInteger teamId; //Example: 153832
@property (nonatomic, weak) NSURL *linkTeam;
@property (nonatomic, weak) NSURL *linkTrackedItemStatuses;


@end
