//
//  TSDKBackgroundUploadDelegateObject.h
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 6/21/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCompletionBlockTypes.h"

@interface TSDKBackgroundUploadProgressMonitorDelegate : NSObject <NSURLSessionTaskDelegate, NSURLSessionDataDelegate>

@property (nonatomic, strong) NSNumber *_Nullable totalBytesSent;
@property (nonatomic, strong) NSNumber *_Nullable totalBytesExpectedToSend;
@property (nonatomic, assign) BOOL complete;
@property (nonatomic, assign) BOOL success;

-(NSData *_Nullable)responseData;
-(NSString *_Nullable)responseString;
-(id _Nullable)responseJSON;

-(instancetype _Nonnull)initWithProgressBlock:(TSDKUploadProgressBlock _Nullable)progressBlock;

@end
