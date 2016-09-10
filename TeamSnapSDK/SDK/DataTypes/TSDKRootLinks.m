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
#import "TSDKTeamSnap.h"
#import "TSDKConstants.h"

@interface TSDKRootLinks()
@property (nonatomic, assign) BOOL schemas;
@property (nonatomic, assign) BOOL unauthenticatedSchemas;
@end

@implementation TSDKRootLinks

@dynamic linkDivisionContactPhoneNumbers, linkDivisions, linkBroadcastAlerts, linkTeamsResults, linkMe, linkLocations, linkTeamMediumComments, linkTeamsPreferences, linkMemberLinks, linkForumTopics, linkTeamMedia, linkEvents, linkStatistics, linkSweet, linkTrackedItemStatuses, linkTslPhotos, linkContactPhoneNumbers, linkContactEmailAddresses, linkTeamPublicSites, linkAssignments, linkDivisionMemberPhoneNumbers, linkDude, linkOpponentsResults, linkTrackedItems, linkSmsGateways, linkDivisionLocations, linkForecasts, linkPublicFeatures, linkTslChats, linkRandom, linkPlansAll, linkMemberStatistics, linkDivisionMembers, linkTeamMediaGroups, linkForumSubscriptions, linkGeocodedLocations, linkReferrals, linkLeagueCustomData, linkSports, linkAvailabilities, linkMemberBalances, linkMemberPayments, linkLeagueCustomFields, linkMembers, linkMembersPreferences, linkTslMetadata, linkDivisionsPreferences, linkOpponents, linkApiv2Root, linkMemberEmailAddresses, linkStatisticData, linkTeamsPaypalPreferences, linkBroadcastEmails, linkTeamStatistics, linkDivisionMembersPreferences, linkPlans, linkSelf, linkDivisionTeamStandings, linkAuthorization, linkDivisionMemberEmailAddresses, linkDivisionContactEmailAddresses, linkSponsors, linkTeams, linkPaypalCurrencies, linkFacebookPages, linkMemberPhoneNumbers, linkEventStatistics, linkCustomData, linkMemberFiles, linkTeamFees, linkBroadcastEmailAttachments, linkTimeZones, linkTslScores, linkLeagueRegistrantDocuments, linkStatisticGroups, linkStatisticAggregates, linkCustomFields, linkDivisionContacts, linkUsers, linkDivisionEvents, linkSchemas, linkRoot, linkXyzzy, linkPaymentNotes, linkForumPosts, linkContacts, linkCountries;
;

+ (NSString *)SDKType {
    return nil;
}

+ (NSURL *)bundledFileURL {
    return [[NSBundle bundleForClass:[self class]] URLForResource:[self SDKREL] withExtension:@"json"];
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
                    }
                }
                if ([[schemaDictionary objectForKey:@"collection"] objectForKey:@"queries"]) {
                    NSArray *queries = [[schemaDictionary objectForKey:@"collection"] objectForKey:@"queries"];
                    for (NSDictionary *queryDictionary in queries) {
                        TSDKCollectionCommand *query = [[TSDKCollectionCommand alloc] initWithJSONDict:queryDictionary];
                        [[TSDKCollectionObject queriesForClass:type] setValue:query forKey:query.rel];
                    }
                }
                
            }
        }
    }
}

- (void)getSchemasArrayWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock) completion {
    NSArray *versionComponents = [self.collection.version componentsSeparatedByString:@"."];
    NSString *majorMinorVersion = nil;
    if (versionComponents.count>1) {
        majorMinorVersion = [NSString stringWithFormat:@"%@.%@", versionComponents[0],versionComponents[1]];
    }
    
    NSArray *schemasArray = [TSPCache loadSchemasIfCachedVersion:majorMinorVersion];
    if (schemasArray && (schemasArray.count>0)) {
        [self processSchemasArray:schemasArray];
        if (completion) {
            completion(YES, YES, schemasArray, nil);
        }
    } else {
        [TSDKDataRequest requestJSONObjectsForPath:self.linkSchemas sendDataDictionary:nil method:@"GET" configuration:configuration withCompletion:^(BOOL success, BOOL complete, id objects, NSError *error) {
            if ([objects isKindOfClass:[NSArray class]]) {
                if ([[TSDKTeamSnap sharedInstance] teamSnapUser]) {
                    self.schemas = success;
                    self.unauthenticatedSchemas = success;
                } else {
                    self.unauthenticatedSchemas = success;
                }
                
                NSArray *schemasArray = (NSArray *)objects;
                if ([[TSDKTeamSnap sharedInstance] teamSnapUser]) {
                    [TSPCache saveSchemas:schemasArray WithVersion:majorMinorVersion];
                }
                
                [self processSchemasArray:schemasArray];
                
                if (completion) {
                    completion(success, success, schemasArray, error);
                }
            } else {
                if (completion) {
                    completion(success, success, nil, error);
                }
            }
        }];
    }
}

- (void)getSchemasWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKSimpleCompletionBlock)completion {
    if ([[TSDKTeamSnap sharedInstance] teamSnapUser] && self.schemas) {
        if (completion) {
            completion(YES, nil);
        }
    } else if (![[TSDKTeamSnap sharedInstance] teamSnapUser] && self.unauthenticatedSchemas) {
        if (completion) {
            completion(YES, nil);
        }
    } else {
        [self getSchemasArrayWithConfiguration:configuration completion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
            if (completion) {
                completion(success, error);
            }
        }];
    }
}


+ (void)actionSendInvitationsToEmailaddress:(NSString *)emailAddress WithCompletion:(TSDKCompletionBlock)completion {
    [[TSDKTeamSnap sharedInstance] rootLinksWithConfiguration:nil completion:^(TSDKRootLinks *rootLinks) {
        if (rootLinks) {
            TSDKCollectionCommand *collectionCommand = [rootLinks.collection.commands objectForKey:@"send_invitations"];
            if (collectionCommand) {
                [collectionCommand.data setObject:emailAddress forKey:@"email_address"];
                [collectionCommand executeWithCompletion:completion];
            } else {
                if (completion) {
                    completion(NO, NO, nil, nil);
                }
            }
        } else {
            completion(NO, NO, nil, nil);
        }
     }];
}

+ (void)actionWelcomeEmailAddress:(NSString *)emailAddress withCallbackURL:(NSURL *)callbackURL withCompletion:(TSDKSimpleCompletionBlock)completion {
    [[TSDKTeamSnap sharedInstance] rootLinksWithConfiguration:nil completion:^(TSDKRootLinks *rootLinks) {
        if (rootLinks) {
            TSDKCollectionCommand *collectionCommand = [TSDKCollectionObject commandForClass:@"root" forKey:@"welcome"];
            if (collectionCommand && [[TSDKTeamSnap sharedInstance] clientId]) {
                collectionCommand.data[@"client_id"] = [[TSDKTeamSnap sharedInstance] clientId];
                collectionCommand.data[@"email_address"] = emailAddress;
                collectionCommand.data[@"redirect_uri"] = [callbackURL absoluteString];
                [collectionCommand executeWithCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
                    if (completion) {
                        completion(success, error);
                    }
                }];
            } else {
                if (completion) {
                    NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] init];
                    if (![[TSDKTeamSnap sharedInstance] clientId]) {
                        userInfo[NSLocalizedFailureReasonErrorKey] = @"Client ID required";
                        userInfo[NSLocalizedDescriptionKey] = @"The TeamSnap SDK client ID is missing.";
                    } else {
                        userInfo[NSLocalizedFailureReasonErrorKey] = @"Command not found";
                        userInfo[NSLocalizedDescriptionKey] = @"There was an error connecting to the TeamSnap server";
                    }
                    NSInteger errorCode = 1;
                    
                    NSError *error = [[NSError alloc] initWithDomain:TSDKTeamSnapSDKErrorDomainKey code:errorCode userInfo:userInfo];
                    completion(NO, error);
                }
            }
        } else {
            completion(NO, nil);
        }
    }];
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
