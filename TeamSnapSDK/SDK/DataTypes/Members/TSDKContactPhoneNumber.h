//
//  TSDKContactPhoneNumber.h
//  TeamSnapSDK
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKMemberPhoneNumber.h"
#import "TSDKObjectsRequest.h"

@interface TSDKContactPhoneNumber : TSDKMemberPhoneNumber

@property (nonatomic, assign) NSInteger contactId; //Example: 127451
@property (nonatomic, weak) NSURL *linkContact;

@end

@interface TSDKContactPhoneNumber (ForwardedMethods)

-(void)getContactWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKContactArrayCompletionBlock)completion;

@end

