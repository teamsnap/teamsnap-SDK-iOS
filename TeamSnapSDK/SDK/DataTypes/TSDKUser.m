//
// Created by Jason Rahaim on 1/29/15.
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKUser.h"
#import "TSDKObjectsRequest.h"
#import "TSDKMember.h"
#import "TSDKTeamPreferences.h"
#import "TSDKTeam.h"
#import "TSDKPlan.h"
#import "TSDKTeamResults.h"
#import "NSMutableDictionary+refreshCollectionData.h"
#import "TSDKTeamSnap.h"
#import "TSDKRootLinks.h"
#import "NSDate+TSDKConveniences.h"

@interface TSDKUser()

@end

@implementation TSDKUser {

}

@dynamic personUuid, highestRole, birthday, managedDivisionsCount, canSendMessages, updatedAt, activeTeamsCount, addressState, lastName, isEligibleForFreeTrial, teamsCount, email, isAdmin, hasCc, addressCountry, createdAt, displayAdsOnTeamList, firstName, receivesNewsletter, isLabRat, linkActiveTeams, linkMessages, linkDivisionMembers, linkEvents, linkTeamsPreferences, linkActiveDivisions, linkExperiments, linkApnDevices, linkMembers, linkMessageData, linkPayableInvoices, linkFacebookPages, linkTeams, linkTslMetadatum, linkGcmDevices, linkPersonas, linkInvoicesAggregates, linkAdvertisements, linkNextPayableInvoice, linkDivisions, linkContacts, ppid;

+ (NSString *)SDKType {
    return @"user";
}

- (NSArray <NSString *> *)managedTeamIds {
    NSArray <NSNumber *> *teamIdsAsNumbers = [self collectionObjectForKey:@"managed_team_ids"];
    if(teamIdsAsNumbers) {
        NSMutableArray <NSString *> *teamIds = [[NSMutableArray alloc] initWithCapacity:teamIdsAsNumbers.count];
        for (NSNumber *teamId in teamIdsAsNumbers) {
            [teamIds addObject:[teamId stringValue]];
        }
        return [teamIds copy];
    } else {
        return [NSArray array];
    }
}

- (NSArray <NSString *> *)ownedTeamIds {
    NSArray <NSNumber *> *teamIdsAsNumbers = [self collectionObjectForKey:@"owned_team_ids"];
    if(teamIdsAsNumbers) {
        NSMutableArray <NSString *> *teamIds = [[NSMutableArray alloc] initWithCapacity:teamIdsAsNumbers.count];
        for (NSNumber *teamId in teamIdsAsNumbers) {
            [teamIds addObject:[teamId stringValue]];
        }
        return [teamIds copy];
    } else {
        return [NSArray array];
    }
}

- (NSArray <NSString *> *)ownedDivisionIds {
    NSArray <NSNumber *> *teamIdsAsNumbers = [self collectionObjectForKey:@"owned_division_ids"];
    if(teamIdsAsNumbers) {
        NSMutableArray <NSString *> *teamIds = [[NSMutableArray alloc] initWithCapacity:teamIdsAsNumbers.count];
        for (NSNumber *teamId in teamIdsAsNumbers) {
            [teamIds addObject:[teamId stringValue]];
        }
        return [teamIds copy];
    } else {
        return [NSArray array];
    }
}

- (NSString *)fullName {
    if ((self.firstName.length>0) && (self.lastName.length>0)) {
        
        NSString *fullName;
        if (@available(iOS 9.0, *)) {
            NSPersonNameComponents *nameComponents = [[NSPersonNameComponents alloc] init];
            
            nameComponents.givenName = self.firstName;
            nameComponents.familyName = self.lastName;
            
            fullName = [NSPersonNameComponentsFormatter localizedStringFromPersonNameComponents:nameComponents style:NSPersonNameComponentsFormatterStyleDefault options: 0];
        } else {
            fullName = [@[self.firstName, self.lastName] componentsJoinedByString:@" "];
        }
        
        return [fullName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    } else if (self.firstName.length>0) {
        return self.firstName;
    } else if (self.lastName.length>0) {
        return  self.lastName;
    } else {
        return @"";
    }
}

+ (void)actionSendTrialExpiringReminderForCurrentUserWithCompletion:(TSDKSimpleCompletionBlock)completion {
    TSDKCollectionCommand *command = [self commandForKey:@"send_trial_expiring_reminder"];
    [command executeWithCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
        if (completion) {
            completion(success, error);
        }
    }];
}

+(void)queryDspPayloadMemberid:(NSString *_Nonnull)memberId kuid:(NSString *_Nonnull)kuid zone:(NSString *_Nonnull)zone WithCompletion:(TSDKCompletionBlock _Nullable)completion {
    TSDKCollectionQuery *query = [self queryForKey:@"dsp_payload"];
    query.data[@"member_id"] = memberId;
    query.data[@"zone"] = zone;
    query.data[@"kuid"] = kuid;
    [query executeWithCompletion:completion];
}

- (void)myMembersOnTeamsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion {
    [self getPersonasWithConfiguration:configuration completion:completion];
}

-(void)getPersonasWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKMemberArrayCompletionBlock)completion {
    [self arrayFromLink:self.linkPersonas withConfiguration:configuration completion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
        if (completion) {
            completion(success, complete, objects, nil);
        }
    }];
}

- (void)getInvoicesAggregatesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKInvoiceAggregateCompletionBlock)completion {
    [self arrayFromLink:self.linkInvoicesAggregates withConfiguration:configuration completion:^(BOOL success, BOOL complete, NSArray * _Nonnull objects, NSError * _Nullable error) {
        if(completion) {
            completion(success, complete, objects.firstObject, nil);
        }
    }];
}

- (void)myMembersOnTeamId:(NSString *)teamId withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion {
    [self myMembersOnTeamsWithConfiguration:configuration completion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
        NSArray *resultMembers = nil;
        if (success) {
            NSIndexSet *memberIndexes = [objects indexesOfObjectsPassingTest:^BOOL(TSDKMember *member, NSUInteger idx, BOOL * _Nonnull stop) {
                return [member.teamId isEqualToString:teamId];
            }];
            resultMembers = [objects objectsAtIndexes:memberIndexes];

        }
        if (completion) {
            completion(success, complete, resultMembers, error);
        }
    }];
}

-(void)getTeamsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion {
    [TSDKDataRequest requestObjectsForPath:self.linkTeams withConfiguration:configuration completion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
        if (completion) {
            NSArray *teams = [self processGetTeamsResult:objects];
            completion(success, complete, teams, error);
        }
    }];
}

-(void)getActiveTeamsWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKTeamArrayCompletionBlock)completion {
    [TSDKDataRequest requestObjectsForPath:self.linkActiveTeams withConfiguration:configuration completion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
        if (completion) {
            NSArray *teams = [self processGetTeamsResult:objects];
            completion(success, complete, teams, error);
        }
    }];
}

- (NSArray *)processGetTeamsResult:(TSDKCollectionJSON *)objects {
    NSArray *newTeams = [TSDKObjectsRequest SDKObjectsFromCollection:objects];
    return newTeams;
}

- (void)teamsWithIDs:(NSArray *)teamIds withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion {
    [TSDKObjectsRequest listTeams:teamIds WithConfiguration:configuration completion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
        if (completion) {
            completion(success, complete, objects, error);
        }
    }];
}

- (void)bulkLoadDataTypes:(NSArray *)objectDataTypes forTeamIds:(NSArray *)teamIds withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion {
    [TSDKObjectsRequest bulkLoadTeamDataForTeamIds:teamIds types:objectDataTypes completion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
        if (completion) {
            completion(success, complete, objects, error);
        }
    }];
}

-(void)getMessagesWithConfiguration:(TSDKRequestConfiguration *)configuration type:(TSDKMessageType)type completion:(TSDKMessagesArrayCompletionBlock)completion {
    
    NSDictionary *searchParams;
    if(type == TSDKMessageTypeAlert) {
        searchParams = @{@"message_type": @"alert"};
    } else if(type == TSDKMessageTypeEmail) {
        searchParams = @{@"message_type": @"email"};
    }
    
    [self arrayFromLink:self.linkMessages searchParams:searchParams withConfiguration:configuration completion:completion];
}

- (void)getTslMetadatumWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion {
    NSURLComponents *fullySpecifiedURL = [NSURLComponents componentsWithURL:self.linkTslMetadatum resolvingAgainstBaseURL:NO];
    NSMutableArray *queryItems = [[NSMutableArray alloc] init];
    [queryItems addObjectsFromArray:fullySpecifiedURL.queryItems];
    
    NSURLQueryItem *versionQuery = [NSURLQueryItem queryItemWithName:@"version" value:@"1.1"];
    [queryItems addObjectsFromArray:@[versionQuery]];
    fullySpecifiedURL.queryItems = queryItems;
    
    [self arrayFromLink:fullySpecifiedURL.URL withConfiguration:configuration completion:completion];
}

- (NSInteger)age {
    if (self.birthday && (![self.birthday isEqual:[NSNull null]])) {
        return [self.birthday age];
    } else {
        return 0;
    }
}

+ (NSURL * _Nullable)persistenceFilePathWithParentObject:(TSDKCollectionObject * _Nonnull)parentObject {
    return [[[self persistenceBaseFilePath] URLByAppendingPathComponent:[self SDKType]] URLByAppendingPathComponent:@"current"];
}

- (TSDKHighestRoleType)highestRoleKey {
    if ([self.highestRole isEqualToString:@"non-player"]) {
        return TSDKHighestRoleTypeNonPlayer;
    } else if ([self.highestRole isEqualToString:@"player"]) {
        return TSDKHighestRoleTypePlayer;
    } else if ([self.highestRole isEqualToString:@"manager"]) {
        return TSDKHighestRoleTypeManager;
    } else if ([self.highestRole isEqualToString:@"owner"]) {
        return TSDKHighestRoleTypeOwner;
    } else if ([self.highestRole isEqualToString:@"commissioner"]) {
        return TSDKHighestRoleTypeCommissioner;
    } else if ([self.highestRole isEqualToString:@"league_owner"]) {
        return TSDKHighestRoleTypeLeagueOwner;
    }
    
    return TSDKHighestRoleTypeUnknown;
}

@end
