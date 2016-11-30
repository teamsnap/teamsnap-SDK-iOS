// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKTslMetadatum : TSDKCollectionObject

@property (nonatomic, weak) NSDictionary *_Nullable metadata; //Example: {"persona":"Skyler Seamans","push_preferences":{"859069":{"chat":false,"locker_room":false,"score":false,"game_starting":true,"score_frequency":0},"878422":{"chat":false,"locker_room":true,"score":true,"game_starting":true,"score_frequency":0},"1032779":{"chat":false,"locker_room":true,"score":true,"game_starting":true,"score_frequency":0},"687899":{"chat":true,"locker_room":true,"score":true,"game_starting":true,"score_frequency":5},"0":{"chat":false,"locker_room":true,"score":true,"game_starting":true,"score_frequency":0},"2057290":{"chat":false,"locker_room":true,"score":true,"game_starting":true,"score_frequency":0},"1950434":{"chat":false,"locker_room":true,"score":true,"game_starting":true,"score_frequency":0},"1":{"chat":false,"locker_room":false,"score":true,"game_starting":true,"score_frequency":0},"812893":{"chat":false,"locker_room":true,"score":true,"game_starting":true,"score_frequency":0},"2092958":{"chat":false,"locker_room":false,"score":true,"game_starting":true,"score_frequency":0},"1467874":{"chat":false,"locker_room":true,"score":true,"game_starting":true,"score_frequency":0},"1505619":{"chat":false,"locker_room":true,"score":false,"game_starting":true,"score_frequency":0},"273321":{"chat":false,"locker_room":true,"score":true,"game_starting":true,"score_frequency":0},"722086":{"chat":false,"locker_room":true,"score":true,"game_starting":true,"score_frequency":0},"1467143":{"chat":false,"locker_room":true,"score":true,"game_starting":true,"score_frequency":0},"71118":{"chat":true,"locker_room":true,"score":true,"game_starting":true,"score_frequency":0},"1681009":{"chat":false,"locker_room":true,"score":true,"game_starting":true,"score_frequency":0},"2058142":{"chat":false,"locker_room":true,"score":true,"game_starting":true,"score_frequency":0},"1447929":{"chat":false,"locker_room":true,"score":true,"game_starting":true,"score_frequency":0},"1142510":{"chat":false,"locker_room":true,"score":true,"game_starting":true,"score_frequency":0},"1020721":{"chat":false,"locker_room":true,"score":true,"game_starting":true,"score_frequency":0},"2058232":{"chat":false,"locker_room":true,"score":true,"game_starting":true,"score_frequency":0},"2057308":{"chat":true,"locker_room":true,"score":true,"game_starting":true,"score_frequency":0},"1538601":{"chat":false,"locker_room":true,"score":true,"game_starting":true,"score_frequency":0},"888784":{"chat":false,"locker_room":true,"score":true,"game_starting":true,"score_frequency":0},"856939":{"chat":false,"locker_room":true,"score":true,"game_starting":true,"score_frequency":0},"2358435":{"chat":false,"locker_room":true,"score":true,"game_starting":true,"score_frequency":0}},"profile_extra_label":""}
@property (nonatomic, assign) NSInteger userId; //Example: 2971597
@property (nonatomic, weak) NSDate *_Nullable updatedAt; //Example: 2016-10-28T14:57:34Z
@property (nonatomic, weak) NSDate *_Nullable createdAt; //Example: 2014-11-17T23:18:01Z
@property (nonatomic, weak) NSURL *_Nullable linkUser;




//+(void)querySearchPagesize:(NSString *_Nonnull)pageSize id:(NSString *_Nonnull)id pageNumber:(NSString *_Nonnull)pageNumber userId:(NSString *_Nonnull)userId version:(NSString *_Nonnull)version WithCompletion:(TSDKCompletionBlock _Nullable)completion;



@end

@interface TSDKTslMetadatum (ForwardedMethods)

-(void)getUserWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKUserArrayCompletionBlock _Nonnull)completion;


@end
