//
//  TSDKBackgroundUploadDelegateObject.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 6/21/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKBackgroundUploadDelegateObject.h"
#import "NSHTTPURLResponse+convenience.h"

@implementation TSDKBackgroundUploadDelegateObject

-(instancetype)initWithProgressBlock:(TSDKUploadProgressBlock)progressBlock {
    self = [super init];
    if (self) {
        _progressBlock = progressBlock;
    }
    return self;
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    if (self.progressBlock) {
        BOOL success = NO;
        
        if ([task.response isKindOfClass:[NSHTTPURLResponse class]]) {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)task.response;
            success = [httpResponse wasSuccess];
        }
        
        self.totalBytesSent =  @(task.countOfBytesSent);
        self.totalBytesExpectedToSend = @(task.countOfBytesExpectedToSend);
        
        if (self.progressBlock) {
            self.progressBlock(success, YES, @(task.countOfBytesSent), @(task.countOfBytesExpectedToSend), error);
        }
    }
}

-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didSendBodyData:(int64_t)bytesSent totalBytesSent:(int64_t)totalBytesSent totalBytesExpectedToSend:(int64_t)totalBytesExpectedToSend {
    
    self.totalBytesSent = @(totalBytesSent);
    self.totalBytesExpectedToSend = @(totalBytesExpectedToSend);
    if (self.progressBlock) {
        self.progressBlock(YES, NO, @(totalBytesSent), @(totalBytesExpectedToSend), nil);
    }
}




@end
