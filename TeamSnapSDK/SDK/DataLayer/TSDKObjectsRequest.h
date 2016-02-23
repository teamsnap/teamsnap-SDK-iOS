//
//  TSDKObjectsRequest.h
//  SDKPlayground
//
//  Created by Jason Rahaim on 12/9/14.
//  Copyright (c) 2014 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionJSON.h"
#import "TSDKCompletionBlockTypes.h"

@class TSDKTeam, TSDKEvent, TSDKUser;


@interface TSDKObjectsRequest : NSObject

+ (void)listTeams:(NSArray *)teamIds WithCompletion:(TSDKArrayCompletionBlock)completion;
+ (void)bulkLoadTeamData:(TSDKTeam *)team types:(NSArray *)objectDataTypes completion:(TSDKArrayCompletionBlock)completion;
+ (void)bulkLoadTeamDataForTeamIds:(NSArray *)teamIds types:(NSArray *)objectDataTypes completion:(TSDKArrayCompletionBlock)completion;
+ (void)listEventsForTeam:(TSDKTeam *)team completion:(TSDKArrayCompletionBlock)completion;
+ (void)listEventsForTeam:(TSDKTeam *)team startDate:(NSDate *)startDate endDate:(NSDate *)endDate completion:(TSDKArrayCompletionBlock)completion;
+ (void)listRosterForTeam:(TSDKTeam *)team completion:(TSDKArrayCompletionBlock)completion;
+ (void)listTrackedItemsForTeam:(TSDKTeam *)team completion:(TSDKArrayCompletionBlock)completion;
+ (void)invitationStatusForEmailAddress:(NSString *)emailAddress withCompletion:(TSDKInviteStatusCompletionBlock)completionBlock;
+ (TSDKUser *)processLoginCollectionJSON:(TSDKCollectionJSON *)containerCollection;
+ (NSArray *)SDKObjectsFromCollection:(TSDKCollectionJSON *)containerCollection;
+ (NSString *)typeForRel:(NSString *)rel;
+ (NSString *)relForType:(NSString *)type;

@end
