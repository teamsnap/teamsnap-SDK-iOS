//
//  TSDKCustomDatum.h
//  SDKPlayground
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKCustomDatum : TSDKCollectionObject

@property (nonatomic, weak) NSString *name; //Example: Size
@property (nonatomic, weak) NSString *options; //Example: Y Small, Y Medium,Y Large,Small,Medium,Large
@property (nonatomic, weak) NSString *value; //Example: Small
@property (nonatomic) BOOL isPrivate; //Example: 0
@property (nonatomic) NSInteger memberId; //Example: 1086731
@property (nonatomic) NSInteger teamId; //Example: 71118
@property (nonatomic, weak) NSString *kind; //Example: Menu
@property (nonatomic) NSInteger customFieldId; //Example: 25383
@property (nonatomic, weak) NSString *helpText; //Example:
@property (nonatomic, weak) NSURL *linkCustomField;
@property (nonatomic, weak) NSURL *linkMember;
@property (nonatomic, weak) NSURL *linkTeam;

@end
