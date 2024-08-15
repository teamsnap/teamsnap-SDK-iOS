//
//  TSDKTslScore.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 12/2/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKTslScore.h"

@implementation TSDKTslScore

+ (NSString *)SDKType {
    return @"tsl_score";
}

+(void)actionSendPushOpponentname:(NSString *_Nonnull)opponentName teamName:(NSString *_Nonnull)teamName timestamp:(NSDate *_Nonnull)timestamp gameState:(NSDictionary *)gameState sportScoreStyle:(NSString *_Nonnull)sportScoreStyle scoreAgainst:(NSInteger)scoreAgainst scoreFor:(NSInteger)scoreFor firebaseId:(NSString *_Nonnull)firebaseId eventId:(NSInteger)eventId teamId:(NSInteger)teamId memberId:(NSInteger)memberId deviceToken:(NSString *_Nonnull)deviceToken WithCompletion:(TSDKCompletionBlock _Nullable)completion {
    
    TSDKCollectionCommand *command = [self commandForKey:@"send_push"];
    if (command) {
        command.data[@"firebase_id"] = firebaseId;
        command.data[@"device_token"] = deviceToken;
        command.data[@"team_id"] = [NSNumber numberWithInteger:teamId];
        if (eventId>0 && (eventId!=NSNotFound)) {
            command.data[@"event_id"] = [NSNumber numberWithInteger:eventId];
        } else {
            [command.data removeObjectForKey:@"event_id"];
        }
        command.data[@"member_id"] = [NSNumber numberWithInteger:memberId];
        command.data[@"timestamp"] = [NSNumber numberWithDouble:[timestamp timeIntervalSince1970]];

        command.data[@"opponent_name"] = opponentName;
        command.data[@"team_name"] = teamName;
        command.data[@"game_state"] = gameState;
        command.data[@"sport_score_style"] = sportScoreStyle;
        command.data[@"score_against"] = [NSNumber numberWithInteger:scoreAgainst];
        command.data[@"score_for"] = [NSNumber numberWithInteger:scoreFor];
        
        [command executeWithCompletion:completion];
    }
}

@end
