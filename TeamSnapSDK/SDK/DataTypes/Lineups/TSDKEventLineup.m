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

@dynamic eventId, isPublished, createdAt, updatedAt;

+ (NSString *)SDKType {
    return @"event_lineup";
}

- (TSDKEventLineupEntry *)lineUpEntryForId:(NSString *)meIdentifier memberId:(NSString *)memberId memberName:(NSString *)memberName memberPhoto:(NSString *)memberPhoto sequence:(NSInteger)sequence label:(NSString *)label {
    TSDKEventLineupEntry *lineup = [[TSDKEventLineupEntry alloc] init];
    [lineup.collection.data setValue:meIdentifier forKey:@"id"];
    lineup.eventLineupId = self.objectIdentifier;
    lineup.memberId = memberId;
    lineup.sequence = sequence;
    lineup.label = label;
    
    [lineup.collection.data setValue:memberName forKey:@"member_name"];
    [lineup.collection.data setValue:memberPhoto forKey:@"member_photo"];
    
    return lineup;
}

- (void)getEventLinupEntriesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKEventLineupEntryArrayCompletionBlock)completion {
    
    NSMutableArray <TSDKEventLineupEntry *>* lineups = [[NSMutableArray alloc] init];
    
    TSDKEventLineupEntry *lineup1 = [self lineUpEntryForId:@"1" memberId:@"68" memberName:@"Ownie Owner" memberPhoto:nil sequence:(lineups.count+1) label:@"RW"];
    
    [lineups addObject:lineup1];
    
    TSDKEventLineupEntry *lineup5 = [self lineUpEntryForId:@"5" memberId:@"72" memberName:@"Sam Smith" memberPhoto:nil sequence:(lineups.count+1) label:@"LB"];
    [lineups addObject:lineup5];
    
    TSDKEventLineupEntry *lineup2 = [self lineUpEntryForId:@"2" memberId:@"69" memberName:@"Someone Else" memberPhoto:nil sequence:(lineups.count+1) label:@"LW"];
    [lineups addObject:lineup2];
    
    TSDKEventLineupEntry *lineup3 = [self lineUpEntryForId:@"3" memberId:@"70" memberName:@"John Smith" memberPhoto:nil sequence:(lineups.count+1) label:@"FW"];
    [lineups addObject:lineup3];
    
    TSDKEventLineupEntry *lineup4 = [self lineUpEntryForId:@"4" memberId:@"71" memberName:@"Fred Johnson" memberPhoto:nil sequence:(lineups.count+1) label:@"GOAL"];
    [lineups addObject:lineup4];
    
    if (completion) {
        NSArray <TSDKEventLineupEntry *> *result = [NSArray arrayWithArray:lineups];
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(YES, YES, result, nil);
        });
    }
}

@end
