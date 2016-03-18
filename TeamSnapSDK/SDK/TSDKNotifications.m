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

+ (void)listenToChangesToObject:(TSDKCollectionObject * _Nonnull)collectionObject withObserver:(id _Nonnull)observer selector:(SEL _Nonnull)selector {
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:selector name:TSDKNotificationsForObject object:collectionObject];
}

+ (void)listenToAllObjectChangesObserver:(id _Nonnull)observer selector:(SEL _Nonnull)selector {
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:selector name:TSDKNotificationsForObject object:nil];
}

+ (void)listenToChangesToObjectClass:(Class _Nonnull)class withObserver:(id _Nonnull)observer selector:(SEL _Nonnull)selector {
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:selector name:TSDKNotificationsForObjectClass object:[class SDKType]];
}

@end
