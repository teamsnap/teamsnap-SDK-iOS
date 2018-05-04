//
//  TSDKTslChat.h
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 12/2/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import <TeamSnapSDK/TeamSnapSDK.h>

@interface TSDKTslChat : TSDKCollectionObject

+(void)actionSendPushFirebaseid:(NSString *_Nonnull)firebaseId deviceToken:(NSString *_Nonnull)deviceToken message:(NSString *_Nonnull)message teamId:(NSInteger)teamId memberId:(NSInteger)memberId eventId:(NSInteger)eventId timestamp:(NSDate *_Nullable)timestamp type:(NSInteger)type url:(NSString *_Nullable)url username:(NSString *_Nonnull)username completion:(TSDKCompletionBlock _Nullable)completion;

+(void)actionLogDeletedFirebaseId:(NSString *_Nonnull)firebaseId deviceToken:(NSString *_Nullable)deviceToken teamId:(NSString *_Nonnull)teamId eventId:(NSString *_Nullable)eventId completion:(TSDKSimpleCompletionBlock _Nullable)completion;

@end
