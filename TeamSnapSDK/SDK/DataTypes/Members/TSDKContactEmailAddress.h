//
//  TSDKContactEmailAddress.h
//  TeamSnapSDK
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKObjectsRequest.h"
#import "TSDKMemberEmailAddress.h"

@interface TSDKContactEmailAddress : TSDKMemberEmailAddress

@property (nonatomic, weak) NSString *_Nullable contactId; //Example: 150647
@property (nonatomic, weak) NSURL *_Nullable linkContact;

@end

@interface TSDKContactEmailAddress (ForwardedMethods)

-(void)getContactWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKContactArrayCompletionBlock _Nullable)completion;

@end
