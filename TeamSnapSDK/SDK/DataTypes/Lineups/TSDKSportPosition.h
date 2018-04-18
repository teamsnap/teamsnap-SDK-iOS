//
//  TSDKSportPositions.h
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 4/9/18.
//  Copyright © 2018 teamsnap. All rights reserved.
//

#import <TeamSnapSDK/TeamSnapSDK.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKSportPosition : TSDKCollectionObject

@property (nonatomic, weak) NSString *_Nullable sportId;
@property (nonatomic, weak) NSString *_Nullable label;
@property (nonatomic, weak) NSDate *_Nullable createdAt;
@property (nonatomic, weak) NSDate *_Nullable updatedAt;

@end
