// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKPartnerPreferences : TSDKCollectionObject

@property (nonatomic, assign) NSInteger canDisplayPartner; //Example: 0
@property (nonatomic, strong, nullable) NSString * partnerName; //Example: **NULL**
@property (nonatomic, strong, nullable) NSString * userId; //Example: <null>
@property (nonatomic, assign) NSInteger userIsPartner; //Example: 0
@property (nonatomic, strong, nullable) NSString * partnerId; //Example: <null>

@end



