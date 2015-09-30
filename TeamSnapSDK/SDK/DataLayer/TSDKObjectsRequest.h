//
//  TSDKObjectsRequest.h
//  SDKPlayground
//
//  Created by Jason Rahaim on 12/9/14.
//  Copyright (c) 2014 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKDataRequest.h"
#import "TSDKCollectionJSON.h"


@class TSDKTeam, TSDKEvent, TSDKUser;

@interface TSDKObjectsRequest : NSObject

+ (void)listTeamsForUser:(TSDKUser *)user WithCompletion:(TSDKArrayCompletionBlock)completion;
+(void)listTeams:(NSArray *)teamIds WithCompletion:(TSDKArrayCompletionBlock)completion;
+ (void)bulkLoadTeamData:(TSDKTeam *)team types:(NSArray *)objectDataTypes completion:(TSDKArrayCompletionBlock)completion;
+ (void)bulkLoadTeamDataForTeamIds:(NSArray *)teamIds types:(NSArray *)objectDataTypes completion:(TSDKArrayCompletionBlock)completion;
+ (void)listEventsForTeam:(TSDKTeam *)team completion:(TSDKArrayCompletionBlock)completion;
+ (void)listEventsForTeam:(TSDKTeam *)team startDate:(NSDate *)startDate endDate:(NSDate *)endDate completion:(TSDKArrayCompletionBlock)completion;
+ (void)listAvailabilitesForEvent:(TSDKEvent *)event completion:(TSDKArrayCompletionBlock)completion;
+ (void)listRosterForTeam:(TSDKTeam *)team completion:(TSDKArrayCompletionBlock)completion;
+ (void)listTrackedItemsForTeam:(TSDKTeam *)team completion:(TSDKArrayCompletionBlock)completion;

+ (TSDKUser *)processLoginCollectionJSON:(TSDKCollectionJSON *)containerCollection;
+ (NSArray *)SDKObjectsFromCollection:(TSDKCollectionJSON *)containerCollection;

@end
