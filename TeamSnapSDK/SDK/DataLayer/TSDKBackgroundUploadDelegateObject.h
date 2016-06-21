//
//  TSDKBackgroundUploadDelegateObject.h
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 6/21/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCompletionBlockTypes.h"

@interface TSDKBackgroundUploadDelegateObject : NSObject <NSURLSessionTaskDelegate, NSURLSessionDataDelegate>

@property (nonatomic, copy) TSDKUploadProgressBlock progressBlock;
@property (atomic, assign) NSUInteger totalBytesSent;
@property (atomic, assign) NSUInteger totalBytesExpectedToSend;

-(instancetype)initWithProgressBlock:(TSDKUploadProgressBlock)progressBlock;

@end
