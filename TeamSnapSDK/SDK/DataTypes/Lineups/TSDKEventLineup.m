//
//  TSDKEventLineup.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 4/10/18.
//  Copyright © 2018 teamsnap. All rights reserved.
//

#import "TSDKEventLineup.h"
#import "TSDKEventLineupEntry.h"

@implementation TSDKEventLineup

@dynamic eventId, isPublished, entriesCount, createdAt, updatedAt, notifyTeam, linkEventLineupEntries;

+ (void)updateEventLineup:(TSDKEventLineup *)lineup withLineupEntries:(NSArray <TSDKEventLineupEntry *> *)lineupEntries withConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKEventLineupEntryArrayCompletionBlock _Nullable)completion {
    TSDKCollectionCommand *command = [TSDKEventLineupEntry commandForKey:@"bulk_update_event_lineup_entries"];
    
    if (command == nil) {
        if (completion != nil) {
            completion(NO, YES, nil, nil);
        }
        return;
    }
    
    NSMutableArray *lineupEntriesArray = [NSMutableArray array];
    for (TSDKEventLineupEntry *lineupEntry in lineupEntries) {
        NSMutableArray *lineupProperties = [NSMutableArray array];
        
        for (NSString *key in @[@"member_id", @"sequence", @"label"]) {
            NSString *value = [lineupEntry.collection.data valueForKey:key];
            if (value == nil) {
                value = @"";
            }
            
            NSDictionary *lineupProperty = @{@"name" : key,
                                             @"value" : value };
            [lineupProperties addObject:lineupProperty];
        }
        
        NSDictionary *lineupProperty = @{@"name" : @"event_lineup_id",
                                         @"value" : lineup.objectIdentifier };
        [lineupProperties addObject:lineupProperty];
        
        NSDictionary *entryDict = @{@"data":lineupProperties};
        [lineupEntriesArray addObject:entryDict];
    }
    
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:lineupEntriesArray options:0 error:&error];
    if (data != nil) {
        NSString *commandString = [[NSString stringWithCString:data.bytes encoding:NSUTF8StringEncoding] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        NSString *templatesString = [NSString stringWithFormat:@"?templates=%@", commandString];
        command.href = [command.href stringByAppendingString:templatesString];
    }
    
    [command.data removeObjectForKey:@"templates"];
    
    [command executeWithCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON * _Nullable objects, NSError * _Nullable error) {
        NSArray *lineups = @[];
        if (success && ([[objects collection] isKindOfClass:[NSArray class]])) {
            lineups = [TSDKObjectsRequest SDKObjectsFromCollection:objects];
            
            NSMutableArray *deletedLineupEntries = [NSMutableArray arrayWithArray:[lineupEntries valueForKey:@"objectIdentifier"]];
            NSMutableArray *insertedLineupEntries = [NSMutableArray arrayWithArray:[lineups valueForKey:@"objectIdentifier"]];
            NSMutableArray *changedLineupEntries = [NSMutableArray array];
            
            for (TSDKEventLineupEntry *newLineupEntry in lineups) {
                
                NSString *newObjectID = newLineupEntry.objectIdentifier;
                for (TSDKEventLineupEntry *existingLineupEntry in lineupEntries) {
                    NSString *existingObjectIdentifier = existingLineupEntry.objectIdentifier;
                    if ([existingObjectIdentifier isEqualToString:newObjectID]) {
                        [changedLineupEntries addObject:existingObjectIdentifier];
                        [insertedLineupEntries removeObject:existingObjectIdentifier];
                        [deletedLineupEntries removeObject:existingObjectIdentifier];
                        break;
                    }
                }
            }
            
            for (TSDKEventLineupEntry *deletedLineupEntry in deletedLineupEntries) {
                [TSDKNotifications postDeletedObject:deletedLineupEntry];
            }
            
            for (TSDKEventLineupEntry *insertedLineupEntry in insertedLineupEntries) {
                [TSDKNotifications postNewObject:insertedLineupEntry];
            }
            
            for (TSDKEventLineupEntry *changedLineupEntry in changedLineupEntries) {
                [TSDKNotifications postRefreshedObject:changedLineupEntry];
            }
        }
        if (completion != nil) {
            completion(success, complete, lineups, error);
        }
    }];
}

+ (NSString *)SDKType {
    return @"event_lineup";
}

@end
