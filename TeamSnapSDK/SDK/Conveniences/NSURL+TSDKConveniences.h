//
//  NSURL+TSDKConveniences.h
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 11/2/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (TSDKConveniences)

- (NSURL *_Nonnull)URLByAppendingQuery:(NSString *_Nonnull)queryItemName value:(NSString *_Nullable)queryItemValue;

@end
