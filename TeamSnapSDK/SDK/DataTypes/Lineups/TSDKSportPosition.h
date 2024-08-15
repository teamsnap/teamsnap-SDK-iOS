//
//  TSDKSportPositions.h
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 4/9/18.
//  Copyright © 2018 teamsnap. All rights reserved.
//

#import <TeamSnapSDK.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKSportPosition : TSDKCollectionObject

@property (nonatomic, strong) NSString *_Nullable sportId;
@property (nonatomic, strong) NSString *_Nullable label;

@end
