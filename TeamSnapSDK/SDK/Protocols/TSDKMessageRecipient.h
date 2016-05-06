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

@property (nonatomic, assign) NSInteger userId;

- (NSInteger)objectIdentifier;

- (void)getMessagesWithConfiguration:(TSDKRequestConfiguration *)configuration type:(TSDKMessageType)type completion:(TSDKMessagesArrayCompletionBlock)completion;
- (BOOL)canMarkAsRead;

@end
