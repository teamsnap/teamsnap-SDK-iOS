//
//  TSDKTslChat.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 12/2/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKTslChat.h"

@implementation TSDKTslChat

+ (NSString *)SDKType {
    return @"tsl_chat";
}

+(void)actionSendPushFirebaseid:(NSString *_Nonnull)firebaseId deviceToken:(NSString *_Nonnull)deviceToken message:(NSString *_Nonnull)message teamId:(NSInteger)teamId memberId:(NSInteger)memberId eventId:(NSInteger)eventId timestamp:(NSDate *_Nullable)timestamp type:(NSInteger)type url:(NSString *_Nullable)url username:(NSString *_Nonnull)username completion:(TSDKCompletionBlock _Nullable)completion {
    
    TSDKCollectionCommand *command = [self commandForKey:@"send_push"];
    if (command) {
        command.data[@"firebase_id"] = firebaseId;
        command.data[@"device_token"] = deviceToken;
        command.data[@"message"] = message;
        command.data[@"team_id"] = [NSNumber numberWithInteger:teamId];
        if (eventId>0 && (eventId!=NSNotFound)) {
            command.data[@"event_id"] = [NSNumber numberWithInteger:eventId];
        } else {
            [command.data removeObjectForKey:@"event_id"];
        }
        command.data[@"member_id"] = [NSNumber numberWithInteger:memberId];
        command.data[@"timestamp"] = [NSNumber numberWithInteger:round([timestamp timeIntervalSince1970])];
        command.data[@"type"] = [NSNumber numberWithInteger:type];
        command.data[@"username"] = username;
        if (url) {
            command.data[@"url"] = url;
        } else {
            [command.data removeObjectForKey:@"url"];
        }
        
        [command executeWithCompletion:completion];
    }
}

@end
