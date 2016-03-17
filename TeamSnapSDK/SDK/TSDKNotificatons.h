//
//  TSDKNotification.h
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 3/17/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const TSDKNotificationObjectType;
extern NSString * const TSDKNotificationObjectClass;


extern NSString * const TSDKNotificationSaved;
extern NSString * const TSDKNotificationAdded;
extern NSString * const TSDKNotificationRefreshed;
extern NSString * const TSDKNotificationDeleted;

@class  TSDKCollectionObject;

@interface TSDKNotifications : NSObject

+ (void)postSavedObject:(TSDKCollectionObject *)notificationObject;
+ (void)postNewObject:(TSDKCollectionObject *)notificationObject;
+ (void)postRefreshedObject:(TSDKCollectionObject *)notificationObject;
+ (void)postDeletedObject:(TSDKCollectionObject *)notificationObject;

@end
