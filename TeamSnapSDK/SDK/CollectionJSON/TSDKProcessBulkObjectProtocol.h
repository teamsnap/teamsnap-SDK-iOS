//
//  TSDKProcessBulkObjectProtocol.h
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 12/14/15.
//  Copyright © 2015 teamsnap. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TSDKProcessBulkObjectProtocol <NSObject>

- (BOOL)processBulkLoadedObject:(TSDKCollectionObject *_Nonnull)bulkObject;

@end
