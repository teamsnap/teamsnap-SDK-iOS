//
//  TSDKSuggestedAssignment.h
//  TeamSnapSDK
//
//  Created by Anne Cahalan on 11/5/19.
//  Copyright © 2019 teamsnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKSuggestedAssignment : TSDKCollectionObject

@property (nonatomic, assign) NSInteger position; //Example: 1 
@property (nonatomic, strong, nullable) NSString * analyticLabel; //Example: Gatorade CA 
@property (nonatomic, assign) BOOL isSponsored; //Example: 1
@property (nonatomic, strong, nullable) NSString * name; //Example: Gatorade
@property (nonatomic, strong, nullable) NSString * logoUrl; //Example: https://pod-gatorade.teamsnap.com/images/assignment_sponsorships/gatorade.png
@property (nonatomic, strong, nullable) NSURL * linkTeam;

@end

@interface TSDKSuggestedAssignment (ForwardedMethods)

-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nonnull)completion;

@end
