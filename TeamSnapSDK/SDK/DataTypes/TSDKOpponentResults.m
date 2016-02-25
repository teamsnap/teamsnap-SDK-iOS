//
//  TSDKOpponentResults.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 2/23/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKOpponentResults.h"

@implementation TSDKOpponentResults
@dynamic losses, teamId, opponentRecord, overtimeLosses, wins, ties, linkTeam, linkOpponent;

+ (NSString *)SDKType {
    return @"opponent_results";
}
@end
