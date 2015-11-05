//
//  TSDKCompletionBlockTypes.h
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 11/3/15.
//  Copyright © 2015 teamsnap. All rights reserved.
//

#ifndef TSDKCompletionBlockTypes_h
#define TSDKCompletionBlockTypes_h
@class TSDKinvitationFinder, UIImage;

typedef void (^TSDKJSONCompletionBlock)(BOOL success, BOOL complete, id objects, NSError *error);
typedef void (^TSDKCompletionBlock)(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error);
typedef void (^TSDKInviteStatusCompletionBlock)(BOOL success, BOOL complete, TSDKinvitationFinder *objects, NSError *error);
typedef void (^TSDKLoginCompletionBlock)(BOOL success, NSString *OAuthToken, NSError *error);
typedef void (^TSDKArrayCompletionBlock)(BOOL success, BOOL complete, NSArray *objects, NSError *error);
typedef void (^TSDKDictionaryCompletionBlock)(BOOL success, BOOL complete, NSDictionary *objects, NSError *error);
typedef void (^TSDKImageCompletionBlock)(UIImage *image);

#endif /* TSDKCompletionBlockTypes_h */
