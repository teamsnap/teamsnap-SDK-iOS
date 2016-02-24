// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKCustomField : TSDKCollectionObject

@property (nonatomic, weak) NSString *name; //Example: Size
@property (nonatomic, assign) NSInteger teamId; //Example: 71118
@property (nonatomic, weak) NSString *kind; //Example: Menu
@property (nonatomic, weak) NSArray *options;
@property (nonatomic, weak) NSString *helpText; //Example:
@property (nonatomic, weak) NSURL *linkTeam;
@property (nonatomic, weak) NSURL *linkCustomData;

@end

@interface TSDKCustomField (ForwardedMethods)

-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion;
-(void)getCustomDataWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKCustomDatumArrayCompletionBlock)completion;

@end
