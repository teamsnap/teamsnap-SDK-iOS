//
//  TSDKMessageRecipient.h
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 4/27/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKMessage.h"

@protocol TSDKMessageRecipient <NSObject>

@property (nonatomic, weak) NSString *_Nullable userId;

- (NSString * _Nonnull)objectIdentifier;

- (void)getMessagesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration type:(TSDKMessageType)type completion:(TSDKMessagesArrayCompletionBlock _Nullable)completion;
- (BOOL)canMarkAsRead;

@end
