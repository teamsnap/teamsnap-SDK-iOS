//
//  TSDKLocation.h
//  SDKPlayground
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKLocation : TSDKCollectionObject

@property (nonatomic, weak) NSString *phone; //Example:
@property (nonatomic, weak) NSString *address; //Example: 611 main st, cary, NC
@property (nonatomic, weak) NSString *notes; //Example: Note about this location. It's a long note.
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, weak) NSString *name; //Example: Falcon Park
@property (nonatomic, weak) NSString *url; //Example: http://www.google.com
@property (nonatomic, weak) NSURL *linkTeam;
@property (nonatomic, weak) NSURL *linkEvents;

@end
