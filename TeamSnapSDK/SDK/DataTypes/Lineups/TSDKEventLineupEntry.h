//
//  TSDKEventLinupEntry.h
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 4/10/18.
//  Copyright © 2018 teamsnap. All rights reserved.
//

#import <TeamSnapSDK/TeamSnapSDK.h>

@interface TSDKEventLineupEntry : TSDKCollectionObject

@property (nonatomic, strong) NSString *_Nullable eventLineupId;
@property (nonatomic, strong) NSString *_Nullable memberId;
@property (nonatomic, assign) NSInteger sequence;
@property (nonatomic, strong) NSString *_Nullable label; //(max 50)
@property (nonatomic, strong) NSString *_Nullable memberName;
@property (nonatomic, strong) NSString *_Nullable memberPhoto;
@property (nonatomic, assign) TSDKAvailabilityState availabilityStatusCode;

@end
