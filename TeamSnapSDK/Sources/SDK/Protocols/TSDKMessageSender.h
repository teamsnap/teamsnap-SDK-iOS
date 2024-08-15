//
//  TSPMessageCreator.h
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 4/27/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TSDKMessageSender <NSObject>

- (NSString *_Nullable)memberId;

@optional
- (NSString *_Nullable)contactId;

@end
