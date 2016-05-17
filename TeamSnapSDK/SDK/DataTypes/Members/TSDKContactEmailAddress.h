//
//  TSDKContactEmailAddress.h
//  TeamSnapSDK
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKContactEmailAddress : TSDKCollectionObject

@property (nonatomic, assign) NSInteger contactId; //Example: 150647
@property (nonatomic, weak) NSURL *linkContact;

@end

@interface TSDKContactEmailAddress (ForwardedMethods)

-(void)getContactWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKContactArrayCompletionBlock)completion;

@end