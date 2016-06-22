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

@property (nonatomic, strong) NSNumber *totalBytesSent;
@property (nonatomic, strong) NSNumber *totalBytesExpectedToSend;
@property (nonatomic, assign) BOOL complete;
@property (nonatomic, assign) BOOL success;

-(NSData *)responseData;
-(NSString *)responseString;
-(id)responseJSON;

-(instancetype)initWithProgressBlock:(TSDKUploadProgressBlock)progressBlock;

@end
