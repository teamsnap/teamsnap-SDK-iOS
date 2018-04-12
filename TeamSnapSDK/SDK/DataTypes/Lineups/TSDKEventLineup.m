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

+ (void)updateEventLineup:(TSDKEventLineup *)lineup withLineupEntries:(NSArray <TSDKEventLineupEntry *> *)lineupEntries withConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKEventLineupUpdateCompletionBlock _Nullable)completion {
    TSDKCollectionCommand *command = [[TSDKCollectionCommand alloc] init];
    command.href = @"https://pod-megazord.teamsnap.com:3443/event_lineup_entries/bulk_update";
    /// https://pod-megazord.teamsnap.com:3443/event_lineup_entries/bulk_update?templates=
//    [
//     {
//         "data": [
//                  {
//                      "name": "member_id",
//                      "value": "411"
//                  },
//                  {
//                      "name": "sequence",
//                      "value": "0"
//                  },
//                  {
//                      "name": "label",
//                      "value": "G"
//                  },
//                  {
//                      "name": "event_lineup_id",
//                      "value": "27"
//                  }
//                  ]
//     },
//     {
//         "data": [
//                  {
//                      "name": "member_id",
//                      "value": "135"
//                  },
//                  {
//                      "name": "sequence",
//                      "value": "1"
//                  },
//                  {
//                      "name": "label",
//                      "value": "F"
//                  },
//                  {
//                      "name": "event_lineup_id",
//                      "value": "27"
//                  }
//                  ]
//     }
//     ]
    
//    for lineupEntry in lineup.
    
    if (command == nil) {
        if (completion != nil) {
            completion(NO, YES, nil);
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
    
    [command executeWithCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON * _Nullable objects, NSError * _Nullable error) {
        if (completion != nil) {
            completion(success, complete, error);
        }
    }];
}

+ (NSString *)SDKType {
    return @"event_lineup";
}

@end
