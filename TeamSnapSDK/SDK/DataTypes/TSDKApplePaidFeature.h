//
//  TSDKApplePaidFeature.h
//  TeamSnapSDK
//
//  Created by Marquez Gallegos on 4/25/17.
//  Copyright © 2017 teamsnap. All rights reserved.
//

#import <TeamSnapSDK/TeamSnapSDK.h>

@interface TSDKApplePaidFeature : TSDKCollectionObject

@property (nonatomic, assign) BOOL isFree; //Example: <null>
@property (nonatomic, assign) BOOL isActive; //Example: 1
@property (nonatomic, weak) NSString *_Nullable appleProductIdentifier; //Example: com.teamsnap.events_across_teams
@property (nonatomic, assign) BOOL isEligible; //Example: <null>

@end
