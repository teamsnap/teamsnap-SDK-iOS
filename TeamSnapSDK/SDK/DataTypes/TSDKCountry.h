//
//  TSDKCountry.h
//  TeamSnapSDK
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKCountry : TSDKCollectionObject <TSDKCollectionObjectBundledDataProtocol>

@property (nonatomic, weak) NSString *name; //Example: Andorra
@property (nonatomic, weak) NSString *isoAlpha2Code; //Example: AD

@end

