//
//  TSDKRootLinks.m
//  SDKDeveloperTools
//
//  Created by Jason Rahaim on 9/23/15.
//  Copyright © 2015 jasonr. All rights reserved.
//

#import "TSDKRootLinks.h"
#import "TSDKDataRequest.h"
#import "TSDKCollectionCommand.h"
#import "TSPCache.h"

@interface TSDKRootLinks()
@property (nonatomic, assign) BOOL schemas;
@end

@implementation TSDKRootLinks

@dynamic linkSchemas, linkContactEmailAddresses, linkDivisionContactEmailAddresses, linkAvailabilities, linkForumTopics, linkMembersPreferences, linkTeamMediaGroups, linkTeamsResults, linkDivisionMembersPreferences, linkTeamMediumComments, linkForumSubscriptions, linkEvents, linkTeamPublicSites, linkTeams, linkForumPosts, linkTeamMedia, linkSelf, linkSports, linkContacts, linkTrackedItemStatuses, linkCountries, linkLeagueRegistrantDocuments, linkSmsGateways, linkGeocodedLocations, linkPaypalCurrencies, linkDivisionLocations, linkOpponents, linkCustomData, linkDivisionContactPhoneNumbers, linkTslMetadata, linkTeamsPreferences, linkDivisionTeamStandings, linkPaymentNotes, linkTeamFees, linkMemberPhoneNumbers, linkMemberLinks, linkTeamsPaypalPreferences, linkDivisionMembers, linkBroadcastEmailAttachments, linkForecasts, linkTeamStatistics, linkMemberEmailAddresses, linkStatistics, linkMembers, linkMe, linkSponsors, linkMemberBalances, linkStatisticGroups, linkMemberStatistics, linkPublicFeatures, linkPlansAll, linkOpponentsResults, linkReferrals, linkTrackedItems, linkTslPhotos, linkUsers, linkAssignments, linkRoot, linkSweet, linkLeagueCustomData, linkStatisticData, linkContactPhoneNumbers, linkApiv2Root, linkMemberPayments, linkMemberFiles, linkPlans, linkLeagueCustomFields, linkCustomFields, linkLocations, linkDivisionMemberEmailAddresses, linkDivisionMemberPhoneNumbers, linkBroadcastEmails, linkDude, linkTimeZones, linkRandom, linkXyzzy, linkBroadcastAlerts;
;

+ (NSString *)SDKType {
    return nil;
}

- (void)processSchemasArray:(NSArray *)schemasArray {    
    for (id object in schemasArray) {
        if ([object isKindOfClass:[NSDictionary class]]) {
            NSDictionary *schemaDictionary = (NSDictionary *)object;
            
            NSString *type = nil;
            if ([[schemaDictionary objectForKey:@"collection"] objectForKey:@"template"]) {
                NSArray *templateArray = [[[schemaDictionary objectForKey:@"collection"] objectForKey:@"template"] objectForKey:@"data"];
                NSMutableDictionary *template = [[NSMutableDictionary alloc] init];
                for (NSDictionary *templateDictionary in templateArray) {
                    if ([templateDictionary[@"name"] isEqualToString:@"type"]) {
                        type = templateDictionary[@"value"];
                    } else {
                        [template setValue:templateDictionary[@"value"] forKey:templateDictionary[@"name"]];
                    }
                }
                if (!type) {
                    type = [[schemaDictionary objectForKey:@"collection"] objectForKey:@"rel"];
                }
                [TSDKCollectionObject setTemplate:[NSDictionary dictionaryWithDictionary:template] forClass:type];
            }
            if (!type) {
                type = [self typeFromRel:[[schemaDictionary objectForKey:@"collection"] objectForKey:@"rel"]];
            }
            if (type) {
                if ([[schemaDictionary objectForKey:@"collection"] objectForKey:@"commands"]) {
                    NSArray *commands = [[schemaDictionary objectForKey:@"collection"] objectForKey:@"commands"];
                    for (NSDictionary *commandDictionary in commands) {
                        TSDKCollectionCommand *command = [[TSDKCollectionCommand alloc] initWithJSONDict:commandDictionary];
                        [[TSDKCollectionObject commandsForClass:type] setValue:command forKey:command.rel];
                        NSLog(@"%@ Command\n%@", type, command);
                    }
                }
            }
        }
    }
}

-(void)getSchemasWithCompletion:(TSDKSimpleCompletionBlock)completion {
    NSLog(@"Root version %@", self.collection.version);
    if (self.schemas) {
        if (completion) {
            completion(YES, nil);
        }
    } else {
        NSArray *versionComponents = [self.collection.version componentsSeparatedByString:@"."];
        NSString *majorMinorVersion = nil;
        if (versionComponents.count>1) {
            majorMinorVersion = [NSString stringWithFormat:@"%@.%@", versionComponents[0],versionComponents[1]];
        }
        
        NSArray *schemasArray = [TSPCache loadSchemasIfCachedVersion:majorMinorVersion];
        if (schemasArray && (schemasArray.count>0)) {
            [self processSchemasArray:schemasArray];
            if (completion) {
                completion(YES, nil);
            }
        } else {
            [TSDKDataRequest requestJSONObjectsForPath:self.linkSchemas sendDataDictionary:nil method:@"GET" withCompletion:^(BOOL success, BOOL complete, id objects, NSError *error) {
                if ([objects isKindOfClass:[NSArray class]]) {
                    self.schemas = success;
                    NSArray *schemasArray = (NSArray *)objects;
                    
                    [TSPCache saveSchemas:schemasArray WithVersion:majorMinorVersion];

                    [self processSchemasArray:schemasArray];
                }
                if (completion) {
                    completion(success, error);
                }
            }];
        }
    }
}


-(void)actionSendInvitationsToEmailaddress:(NSString *)emailAddress WithCompletion:(TSDKCompletionBlock)completion {
    TSDKCollectionCommand *collectionCommand = [self.collection.commands objectForKey:@"send_invitations"];
    if (collectionCommand) {
        [collectionCommand.data setObject:emailAddress forKey:@"email_address"];
        [collectionCommand executeWithCompletion:completion];
    } else {
        if (completion) {
            completion(NO, NO, nil, nil);
        }
    }
}

-(NSString *)typeFromRel:(NSString *)rel {
    if (!rel) {
        return nil;
    } else if ([rel isEqualToString:@"root"]) {
        return @"root";
    } else if ([[rel substringFromIndex:rel.length-3] isEqualToString:@"ies"]) {
        return [NSString stringWithFormat:@"%@%@", [rel substringToIndex:rel.length-3],@"y"];
    } else {
        return [rel substringToIndex:rel.length-1];
    }
}

@end
