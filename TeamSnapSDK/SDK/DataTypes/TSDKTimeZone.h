//
//  TSDKTimeZone.h
//  TeamSnapSDK
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKTimeZone : TSDKCollectionObject <TSDKCollectionObjectBundledDataProtocol>

@property (nonatomic, weak) NSString *ianaName; //Example: Pacific/Pago_Pago
@property (nonatomic, weak) NSString *offset; //Example: -11:00
@property (nonatomic, weak) NSString *timeZoneDescription; //Example: American Samoa


@end
