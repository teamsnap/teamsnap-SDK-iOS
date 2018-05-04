//
//  TSDKPersistenceFilePath.h
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 4/19/17.
//  Copyright © 2017 teamsnap. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TSDKPersistenceFilePath <NSObject>


/**
 The document directory file path where objects conforming to NSCoding will be encoded and stored.

 @param parentObject The parent of the data to be stored. Team is the parent of Events, for example.
 @return A fully specified URL where objects can be encoded for persistence. Documents directory is recommended.
 */
+ (NSURL * _Nullable)persistenceFilePathWithParentObject:(TSDKCollectionObject * _Nonnull)parentObject;


/**
 The base path where objects will be persisted.

 @return  The base URL that will contain subdirectories for objects to be stored. persistenceFilePathWithParentIdentifier should build off this path. A good default is /teamsnap
 */
+ (NSURL * _Nullable)persistenceBaseFilePath;

@end
