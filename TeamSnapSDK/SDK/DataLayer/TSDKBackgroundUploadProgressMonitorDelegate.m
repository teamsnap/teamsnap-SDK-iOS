//
//  TSDKBackgroundUploadDelegateObject.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 6/21/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKBackgroundUploadProgressMonitorDelegate.h"
#import "NSHTTPURLResponse+convenience.h"

@interface TSDKBackgroundUploadProgressMonitorDelegate()

@property (nonatomic, copy) TSDKUploadProgressBlock progressBlock;
@property (nonatomic, strong) NSData *responseData;

@end

@implementation TSDKBackgroundUploadProgressMonitorDelegate

-(instancetype)initWithProgressBlock:(TSDKUploadProgressBlock)progressBlock {
    self = [super init];
    if (self) {
        _progressBlock = progressBlock;
        _complete = NO;
        _success = NO;
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
        self.complete = YES;
        self.success = success;
        
        if (self.progressBlock) {
            self.progressBlock(self, error);
        }
    }
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    _responseData =  data;
}

-(NSData *)responseData {
    return _responseData;
}

-(NSString *)responseString {
    return [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding];
}

-(id)responseJSON {
    NSError *error;
    return [NSJSONSerialization JSONObjectWithData:self.responseData options:0 error:&error];
}

-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didSendBodyData:(int64_t)bytesSent totalBytesSent:(int64_t)totalBytesSent totalBytesExpectedToSend:(int64_t)totalBytesExpectedToSend {
    self.totalBytesSent = @(totalBytesSent);
    self.totalBytesExpectedToSend = @(totalBytesExpectedToSend);
    if (self.progressBlock) {
        self.progressBlock(self, nil);
    }
}

@end
