//
//  TSDKOpponent.m
//  SDKPlayground
//
//  Created by Jason Rahaim on 9/1/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKOpponent.h"

@implementation TSDKOpponent
@dynamic isLeagueControlled, contactsPhone, notes, contactsName, contactsEmail, teamId, name, linkOpponentResults, linkTeam, linkEvents;

+ (NSString *)SDKType {
    return @"opponent";
}

@end
