//
//  TSDKEventLineup.h
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 4/10/18.
//  Copyright © 2018 teamsnap. All rights reserved.
//

#import <TeamSnapSDK/TeamSnapSDK.h>

@interface TSDKEventLineup : TSDKCollectionObject

@property (nonatomic, weak) NSString *_Nullable eventId;
@property (nonatomic, assign) BOOL isPublished;
@property (nonatomic, weak) NSDate *_Nullable createdAt;
@property (nonatomic, weak) NSDate *_Nullable updatedAt;

@end
