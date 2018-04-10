//
//  TSDKEventLinupEntry.h
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 4/10/18.
//  Copyright © 2018 teamsnap. All rights reserved.
//

#import <TeamSnapSDK/TeamSnapSDK.h>

@interface TSDKEventLineupEntry : TSDKCollectionObject

@property (nonatomic, weak) NSString *_Nullable eventLineupId;
@property (nonatomic, weak) NSString *_Nullable memberId;
@property (nonatomic, assign) NSInteger sequence;
@property (nonatomic, weak) NSString *_Nullable label; //(max 50)
@property (nonatomic, weak) NSString *_Nullable memberName;
@property (nonatomic, weak, readonly) NSString *_Nullable memberPhoto;
@property (nonatomic, assign) TSDKAvailabilityState availabilityStatusCode;

@end
