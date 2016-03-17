//
//  TSDKNotification.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 3/17/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKNotifications.h"
#import "TSDKCollectionObject.h"

NSString * const TSDKNotificationObjectType = @"TSDKNotificationObjectType";
NSString * const TSDKNotificationObjectClass = @"TSDKNotificationObjectClass";

NSString * const TSDKNotificationSaved = @"TSDKNotificationSaved";
NSString * const TSDKNotificationAdded = @"TSDKNotificationAdded";
NSString * const TSDKNotificationRefreshed = @"TSDKNotificationRefreshed";
NSString * const TSDKNotificationDeleted = @"TSDKNotificationDeleted";

@implementation TSDKNotifications 

+ (void)postObject:(TSDKCollectionObject *)notificationObject type:(NSString *)notificationType {
    if ([notificationObject isKindOfClass:[TSDKCollectionObject class]]) {
        NSDictionary *userInfo = @{@"type": notificationType, @"object":notificationObject};
        
        [[NSNotificationCenter defaultCenter] postNotificationName:TSDKNotificationObjectType object:notificationObject userInfo:userInfo];
        [[NSNotificationCenter defaultCenter] postNotificationName:TSDKNotificationObjectClass object:[[notificationObject class] SDKType] userInfo:userInfo];
    }
}

+ (void)postSavedObject:(TSDKCollectionObject *)notificationObject {
    [self postObject:notificationObject type:TSDKNotificationSaved];
}

+ (void)postDeletedObject:(TSDKCollectionObject *)notificationObject {
    [self postObject:notificationObject type:TSDKNotificationDeleted];
}

+ (void)postNewObject:(TSDKCollectionObject *)notificationObject {
    [self postObject:notificationObject type:TSDKNotificationAdded];
}

+ (void)postRefreshedObject:(TSDKCollectionObject *)notificationObject {
    [self postObject:notificationObject type:TSDKNotificationRefreshed];
}

@end
