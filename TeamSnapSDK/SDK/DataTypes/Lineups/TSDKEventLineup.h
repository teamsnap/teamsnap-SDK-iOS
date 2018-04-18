//
//  TSDKEventLineup.h
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 4/10/18.
//  Copyright © 2018 teamsnap. All rights reserved.
//

#import <TeamSnapSDK/TeamSnapSDK.h>

@interface TSDKEventLineup : TSDKCollectionObject

@property (nonatomic, weak) NSString *_Nullable eventId;
@property (nonatomic, assign) BOOL isPublished;
@property (nonatomic, assign) NSInteger entriesCount;
@property (nonatomic, assign) BOOL notifyTeam;
@property (nonatomic, weak) NSDate *_Nullable createdAt;
@property (nonatomic, weak) NSDate *_Nullable updatedAt;

@property (nonatomic, weak) NSURL *_Nullable linkEventLineupEntries;

// Not auto-generated
+ (void)updateEventLineup:(TSDKEventLineup *_Nonnull)lineup withLineupEntries:(NSArray <TSDKEventLineupEntry *> * _Nonnull)lineupEntries withConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKEventLineupEntryArrayCompletionBlock _Nullable)completion;

@end

@interface TSDKEventLineup (ForwardedMethods)

-(void)getEventLinupEntriesWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKEventLineupEntryArrayCompletionBlock _Nullable)completion;

@end
