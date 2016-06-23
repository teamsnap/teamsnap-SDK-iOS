//
//  TSDKNotification.h
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 3/17/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * _Nonnull const TSDKNotificationsForObject;
extern NSString * _Nonnull const TSDKNotificationsForObjectClass;

extern NSString * _Nonnull const TSDKObjectSaved;
extern NSString * _Nonnull const TSDKObjectAdded;
extern NSString * _Nonnull const TSDKObjectRefreshed;
extern NSString * _Nonnull const TSDKObjectDeleted;
extern NSString * _Nonnull const TSDKInvalidateAssociatedCaches;

@class  TSDKCollectionObject;

@interface TSDKNotifications : NSObject

+ (void)postSavedObject:(TSDKCollectionObject * _Nonnull)notificationObject;
+ (void)postNewObject:(TSDKCollectionObject * _Nonnull)notificationObject;
+ (void)postRefreshedObject:(TSDKCollectionObject * _Nonnull)notificationObject;
+ (void)postDeletedObject:(TSDKCollectionObject * _Nonnull)notificationObject;
+ (void)postInvalidateAssociatedCaches:(TSDKCollectionObject *)notificationObject;
+ (void)listenToChangesToObject:(TSDKCollectionObject * _Nonnull)collectionObject withObserver:(id _Nonnull)observer selector:(SEL _Nonnull)selector;
+ (void)listenToAllObjectChangesObserver:(id _Nonnull)observer selector:(SEL _Nonnull)selector;
+ (void)listenToChangesToObjectClass:(Class _Nonnull)class withObserver:(id _Nonnull)observer selector:(SEL _Nonnull)selector;
+ (void)removeListenerForObject:(TSDKCollectionObject * _Nonnull)object forObserver:(id _Nonnull)observer;
+ (void)removeListerToAllObjectChangesObserver:(id _Nonnull)observer;
+ (void)removeListenerForClass:(Class _Nonnull)class  forObserver:(id _Nonnull)observer;
+ (void)removeAllListenersForObserver:(id _Nonnull)observer;

@end
