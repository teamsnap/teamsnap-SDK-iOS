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
extern NSString * _Nonnull const TSDKInvalidateAssociatedObjects;

@class  TSDKCollectionObject;

@interface TSDKNotifications : NSObject

+ (void)postSavedObject:(TSDKCollectionObject * _Nonnull)notificationObject;
+ (void)postNewObject:(TSDKCollectionObject * _Nonnull)notificationObject;

+ (void)postRefreshedObject:(TSDKCollectionObject * _Nonnull)notificationObject;
+ (void)postRefreshedObjectCollection:(NSArray <TSDKCollectionObject *> * _Nonnull)objectCollection;

+ (void)postDeletedObject:(TSDKCollectionObject * _Nonnull)notificationObject;
+ (void)postInvalidateAssociatedObjects:(TSDKCollectionObject *_Nonnull)notificationObject;

+ (void)listenToChangesToObject:(TSDKCollectionObject * _Nonnull)collectionObject withObserver:(id _Nonnull)observer selector:(SEL _Nonnull)selector;
+ (void)listenToAllObjectChangesObserver:(id _Nonnull)observer selector:(SEL _Nonnull)selector;
+ (void)listenToAllChangesToObjectClass:(Class _Nonnull)class withObserver:(id _Nonnull)observer selector:(SEL _Nonnull)selector;

/**
 This method will fire a notification _once_ each time a collection containing objects of the class passed in the class variable is fetched. This differs from listenToChangesToObject which fires for each object contained in the collection

 @param class The TSDKCollectionObject subclass to observe
 @param observer An observer that will receive the notification
 @param selector A selector that will be called upon notification receipt
 */
+ (void)listenToCollectionRefreshForObjectClass:(Class _Nonnull)class withObserver:(id _Nonnull)observer selector:(SEL _Nonnull)selector;

+ (void)removeListenerForObject:(TSDKCollectionObject * _Nonnull)object forObserver:(id _Nonnull)observer;
+ (void)removeListerToAllObjectChangesObserver:(id _Nonnull)observer;
+ (void)removeListenerForClass:(Class _Nonnull)class  forObserver:(id _Nonnull)observer;
+ (void)removeAllListenersForObserver:(id _Nonnull)observer;

@end
