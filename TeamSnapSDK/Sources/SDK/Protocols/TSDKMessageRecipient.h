//
//  TSDKMessageRecipient.h
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 4/27/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKMessage.h"
NS_ASSUME_NONNULL_BEGIN
@protocol TSDKMessageRecipient <NSObject>

@property (nonatomic, strong, nullable) NSString *userId;

- (NSString *)objectIdentifier;
- (NSURL * _Nullable)urlForMessageType:(TSDKMessageType)type;
- (void)getMessagesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration type:(TSDKMessageType)type completion:(TSDKMessagesArrayCompletionBlock _Nullable)completion;
- (BOOL)canMarkAsRead;

@end
NS_ASSUME_NONNULL_END
