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

@property (nonatomic, weak) NSString *_Nullable ianaName; //Example: Pacific/Pago_Pago
@property (nonatomic, weak) NSString *_Nullable offset; //Example: -11:00
@property (nonatomic, weak) NSString *_Nullable timeZoneDescription; //Example: American Samoa

- (NSTimeZone *_Nullable)nsTimeZone;

@end
