//
//  TSDKTslScore.h
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 12/2/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TeamSnapSDK.h"

@interface TSDKTslScore : TSDKCollectionObject

+(void)actionSendPushOpponentname:(NSString *_Nonnull)opponentName teamName:(NSString *_Nonnull)teamName timestamp:(NSDate *_Nonnull)timestamp gameState:(NSDictionary *_Nonnull)gameState sportScoreStyle:(NSString *_Nonnull)sportScoreStyle scoreAgainst:(NSInteger)scoreAgainst scoreFor:(NSInteger)scoreFor firebaseId:(NSString *_Nonnull)firebaseId eventId:(NSInteger)eventId teamId:(NSInteger)teamId memberId:(NSInteger)memberId deviceToken:(NSString *_Nonnull)deviceToken WithCompletion:(TSDKCompletionBlock _Nullable)completion;

@end
