//
//  TSDKPersistenceFilePath.h
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 4/19/17.
//  Copyright © 2017 teamsnap. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TSDKPersistenceFilePath <NSObject>

+ (NSString *)persistenceFilePathWithParentIdentifier:(NSString *)parentIdentifier;

@end
