//
//  TSDKRequestConfiguration.h
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 2/22/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSDKRequestConfiguration : NSObject

+ (instancetype)forceReload:(BOOL)forceReload;

@property (nonatomic, assign) BOOL forceReload;

@end
