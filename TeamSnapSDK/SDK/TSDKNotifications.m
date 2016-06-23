//
//  TSDKNotification.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 3/17/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKNotifications.h"
#import "TSDKCollectionObject.h"

NSString * const TSDKNotificationsForObject = @"TSDKNotificationsForObject";
NSString * const TSDKNotificationsForObjectClass = @"TSDKNotificationsForObjectClass";

NSString * const TSDKObjectSaved = @"TSDKNotificationSaved";
NSString * const TSDKObjectAdded = @"TSDKNotificationAdded";
NSString * const TSDKObjectRefreshed = @"TSDKNotificationRefreshed";
NSString * const TSDKObjectDeleted = @"TSDKNotificationDeleted";
NSString * const TSDKInvalidateAssociatedCaches = @"TSDKInvalidateAssociatedCaches";

@implementation TSDKNotifications 

+ (void)postObject:(TSDKCollectionObject *)notificationObject type:(NSString *)notificationType {
    if ([notificationObject isKindOfClass:[TSDKCollectionObject class]]) {
        NSDictionary *userInfo = @{@"type": notificationType, @"object":notificationObject};
        
        [[NSNotificationCenter defaultCenter] postNotificationName:TSDKNotificationsForObject object:notificationObject userInfo:userInfo];
        [[NSNotificationCenter defaultCenter] postNotificationName:TSDKNotificationsForObjectClass object:[[notificationObject class] SDKType] userInfo:userInfo];
    }
}

+ (void)postSavedObject:(TSDKCollectionObject *)notificationObject {
    [self postObject:notificationObject type:TSDKObjectSaved];
}

+ (void)postDeletedObject:(TSDKCollectionObject *)notificationObject {
    [self postObject:notificationObject type:TSDKObjectDeleted];
}

+ (void)postNewObject:(TSDKCollectionObject *)notificationObject {
    [self postObject:notificationObject type:TSDKObjectAdded];
}

+ (void)postRefreshedObject:(TSDKCollectionObject *)notificationObject {
    [self postObject:notificationObject type:TSDKObjectRefreshed];
}

+ (void)postInvalidateAssociatedCaches:(TSDKCollectionObject *)notificationObject {
    [self postObject:notificationObject type:TSDKInvalidateAssociatedCaches];
}

+ (void)listenToChangesToObject:(TSDKCollectionObject * _Nonnull)collectionObject withObserver:(id _Nonnull)observer selector:(SEL _Nonnull)selector {
    [self removeListenerForObject:collectionObject forObserver:observer];
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:selector name:TSDKNotificationsForObject object:collectionObject];
}

+ (void)listenToAllObjectChangesObserver:(id _Nonnull)observer selector:(SEL _Nonnull)selector {
    [self removeAllListenersForObserver:observer];
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:selector name:TSDKNotificationsForObject object:nil];
}

+ (void)listenToChangesToObjectClass:(Class _Nonnull)class withObserver:(id _Nonnull)observer selector:(SEL _Nonnull)selector {
    [self removeListenerForClass:class forObserver:observer];
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:selector name:TSDKNotificationsForObjectClass object:[class SDKType]];
}

+ (void)removeListenerForObject:(TSDKCollectionObject * _Nonnull)object forObserver:(id _Nonnull)observer {
    [[NSNotificationCenter defaultCenter] removeObserver:observer name:TSDKNotificationsForObject object:object];
}

+ (void)removeListerToAllObjectChangesObserver:(id _Nonnull)observer {
    [[NSNotificationCenter defaultCenter] removeObserver:observer name:TSDKNotificationsForObject object:nil];
}

+ (void)removeListenerForClass:(Class _Nonnull)class  forObserver:(id _Nonnull)observer {
    [[NSNotificationCenter defaultCenter] removeObserver:observer name:TSDKNotificationsForObjectClass object:[class SDKType]];
}

+ (void)removeAllListenersForObserver:(id _Nonnull)observer {
    [[NSNotificationCenter defaultCenter] removeObserver:observer name:TSDKNotificationsForObject object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:observer name:TSDKNotificationsForObjectClass object:nil];
}


@end
