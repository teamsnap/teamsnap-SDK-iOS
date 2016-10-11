//
//  TSDKObjectsRequest.h
//  SDKPlayground
//
//  Created by Jason Rahaim on 12/9/14.
//  Copyright (c) 2014 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKRequestConfiguration.h"
#import "TSDKCollectionJSON.h"
#import "TSDKCompletionBlockTypes.h"

@class TSDKTeam, TSDKEvent, TSDKUser;


@interface TSDKObjectsRequest : NSObject

+ (void)listTeams:(NSArray *_Nonnull)teamIds WithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;
+ (void)bulkLoadTeamData:(TSDKTeam *_Nonnull)team types:(NSArray *_Nonnull)objectDataTypes completion:(TSDKArrayCompletionBlock _Nullable)completion;
+ (void)bulkLoadTeamDataForTeamIds:(NSArray *_Nonnull)teamIds types:(NSArray *_Nonnull)objectDataTypes completion:(TSDKArrayCompletionBlock _Nullable)completion;
+ (void)listEventsForTeam:(TSDKTeam *_Nonnull)team startDate:(NSDate *_Nullable)startDate endDate:(NSDate *_Nullable)endDate completion:(TSDKArrayCompletionBlock _Nullable)completion;
+ (void)invitationStatusForEmailAddress:(NSString *_Nonnull)emailAddress withCompletion:(TSDKInviteStatusCompletionBlock _Nullable)completionBlock;
+ (TSDKUser *_Nullable)processLoginCollectionJSON:(TSDKCollectionJSON *_Nonnull)containerCollection;
+ (NSArray *_Nullable)SDKObjectsFromCollection:(TSDKCollectionJSON *_Nonnull)containerCollection;
+ (NSString *_Nullable)typeForRel:(NSString *_Nonnull)rel;
+ (NSString *_Nullable)relForType:(NSString *_Nonnull)type;
+ (NSArray *_Nonnull)knownCompletionTypes;
+ (void)dumpCompletionTypes;

@end
