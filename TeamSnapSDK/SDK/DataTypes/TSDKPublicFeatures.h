//
//  TSDKPublic_Feature.h
//  SDKDeveloperTools
//
//  Created by Jason Rahaim on 9/23/15.
//  Copyright © 2015 jasonr. All rights reserved.
//

#import "TSDKCollectionObject.h"

@interface TSDKPublicFeatures : NSObject

@property (strong, nonatomic) NSDictionary *_Nullable features;

- (instancetype _Nullable)initWithCollection:(NSDictionary *_Nonnull)objects;
- (BOOL)apiSupportsTicketSubmission;
- (NSInteger)daysBetweenPushPermissionPrompt;

@end
