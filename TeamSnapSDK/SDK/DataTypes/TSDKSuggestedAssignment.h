//
//  TSDKSuggestedAssignment.h
//  TeamSnapSDK
//
//  Created by Anne Cahalan on 11/5/19.
//  Copyright © 2019 teamsnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKSuggestedAssignment : TSDKCollectionObject

@property (nonatomic, assign) BOOL isSponsored; //Example: 0
@property (nonatomic, strong, nullable) NSString * name; //Example: Water
@property (nonatomic, strong, nullable) NSString * logoUrl; //Example: **NULL**

@end
