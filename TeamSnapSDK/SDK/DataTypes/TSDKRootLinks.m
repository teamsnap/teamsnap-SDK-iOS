//
//  TSDKRootLinks.m
//  SDKDeveloperTools
//
//  Created by Jason Rahaim on 9/23/15.
//  Copyright © 2015 jasonr. All rights reserved.
//

#import "TSDKRootLinks.h"
#import "TSDKDataRequest.h"
#import "TSDKCollectionQuery.h"
#import "TSDKCollectionCommand.h"
#import "TSPCache.h"
#import "TSDKTeamSnap.h"
#import "TSDKConstants.h"

@interface TSDKRootLinks()
@property (nonatomic, assign) BOOL schemas;
@property (nonatomic, assign) BOOL unauthenticatedSchemas;
@end

@implementation TSDKRootLinks

@dynamic linkDivisionContactPhoneNumbers, linkPaymentNotes, linkDivisions, linkBroadcastAlerts, linkTeamsResults, linkMe, linkMemberRegistrationSignups, linkTeamMediumComments, linkMemberLinks, linkLocations, linkTeamsPreferences, linkForumTopics, linkMessages, linkTeamMedia, linkEvents, linkStatistics, linkContactPhoneNumbers, linkTrackedItemStatuses, linkTslPhotos, linkDivisionMemberPhoneNumbers, linkContactEmailAddresses, linkMemberAssignments, linkTeamPublicSites, linkAssignments, linkDude, linkGcmDevices, linkSweet, linkOpponentsResults, linkTrackedItems, linkSmsGateways, linkDivisionLocations, linkForecasts, linkDivisionEventsImports, linkPublicFeatures, linkTslChats, linkRegistrationForms, linkPlansAll, linkRandom, linkMemberStatistics, linkTeamPhotos, linkDivisionMembers, linkTeamMediaGroups, linkForumSubscriptions, linkGeocodedLocations, linkLeagueCustomData, linkAuthorizationRoot, linkSports, linkAvailabilities, linkAuthorizationUsers, linkMemberBalances, linkMemberPayments, linkLeagueCustomFields, linkMembers, linkAuthorizationMagicLinks, linkMembersPreferences, linkApiv2Root, linkDivisionsPreferences, linkOpponents, linkStatisticData, linkRegistrationSignupStatuses, linkMemberEmailAddresses, linkTslMetadata, linkTeamsPaypalPreferences, linkBroadcastEmails, linkTeamStatistics, linkDivisionMembersPreferences, linkPlans, linkSelf, linkDivisionTeamStandings, linkMemberPhotos, linkAuthorization, linkDivisionMemberEmailAddresses, linkDivisionContactEmailAddresses, linkAuthorizationUserRegistrations, linkSponsors, linkTeams, linkPaypalCurrencies, linkFacebookPages, linkMemberPhoneNumbers, linkEventStatistics, linkCustomData, linkMemberFiles, linkMessageData, linkTeamFees, linkBroadcastEmailAttachments, linkTimeZones, linkTslScores, linkLeagueRegistrantDocuments, linkStatisticGroups, linkStatisticAggregates, linkCustomFields, linkDivisionContacts, linkUsers, linkDivisionEvents, linkSchemas, linkRoot, linkAuthorizationPasswordResets, linkXyzzy, linkApnDevices, linkAuthorizationTokens, linkForumPosts, linkContacts, linkCountries;

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
                        TSDKCollectionQuery *query = [[TSDKCollectionQuery alloc] initWithJSONDict:queryDictionary];
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
                    completion(success, success, [NSArray array], error);
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

+ (void)actionSendLoginLinkToEmailAddress:(NSString *)emailAddress withCallbackURL:(NSURL *)callbackURL completion:(TSDKSimpleCompletionBlock)completion {
    [[TSDKTeamSnap sharedInstance] rootLinksWithConfiguration:[TSDKRequestConfiguration defaultRequestConfiguration] completion:^(TSDKRootLinks *rootLinks) {
        if (rootLinks) {
            TSDKCollectionCommand *collectionCommand = [[TSDKCollectionCommand alloc] init];
            NSURL *magicLinkURL = [[rootLinks linkAuthorization] URLByAppendingPathComponent:@"magic_links"];
            collectionCommand.href = magicLinkURL.absoluteString;
            collectionCommand.rel = magicLinkURL.path;
            
            if (magicLinkURL && collectionCommand && [[TSDKTeamSnap sharedInstance] clientId]) {
                collectionCommand.data[@"client_id"] = [[TSDKTeamSnap sharedInstance] clientId];
                collectionCommand.data[@"email"] = emailAddress;
                collectionCommand.data[@"redirect_uri"] = [callbackURL absoluteString];
                collectionCommand.data[@"scope"] = @"read write";
                [collectionCommand executeWithCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
                    if (completion) {
                        completion(success, error);
                    }
                }];
            } else {
                if (completion) {
                    NSDictionary *userInfo;
                    
                    if (![[TSDKTeamSnap sharedInstance] clientId]) {
                        userInfo = @{NSLocalizedFailureReasonErrorKey : @"Client ID required", NSLocalizedDescriptionKey : @"The TeamSnap SDK client ID is missing."};
                    } else {
                        userInfo = @{NSLocalizedFailureReasonErrorKey : @"Command not found", NSLocalizedDescriptionKey : @"There was an error connecting to the TeamSnap server"};
                    }
                    NSInteger errorCode = 1;
                    
                    NSError *error = [[NSError alloc] initWithDomain:TSDKTeamSnapSDKErrorDomainKey code:errorCode userInfo:userInfo];
                    completion(NO, error);
                }
            }
        } else {
            if(completion) {
                completion(NO, nil);
            }
        }
    }];
}

+ (void)actionRequestAuthTokenWithCode:(NSString * _Nonnull)code withCallbackURL:(NSURL * _Nonnull)callbackURL completion:(TSDKLoginCompletionBlock _Nullable)completion {
    [[TSDKTeamSnap sharedInstance] rootLinksWithConfiguration:[TSDKRequestConfiguration defaultRequestConfiguration] completion:^(TSDKRootLinks *rootLinks) {
        if (rootLinks) {
            NSURL *tokenURL = [[rootLinks linkAuthorization] URLByAppendingPathComponent:@"/oauth/token"];
            
            if (tokenURL && [[TSDKTeamSnap sharedInstance] clientId].length && [[TSDKTeamSnap sharedInstance] clientSecret].length) {
                NSDictionary *parameters = @{@"client_id" : [[TSDKTeamSnap sharedInstance] clientId], @"client_secret" : [[TSDKTeamSnap sharedInstance] clientSecret], @"code" : code, @"redirect_uri" : [callbackURL absoluteString], @"grant_type" : @"authorization_code"};
                
                [TSDKDataRequest requestJSONObjectsForPath:tokenURL sendDataDictionary:parameters method:@"POST" configuration:[TSDKRequestConfiguration defaultRequestConfiguration] withCompletion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
                    NSString *OAuthToken = nil;
                    if ([objects isKindOfClass:[NSDictionary class]]) {
                        if ([(NSDictionary *)objects objectForKey:@"access_token"]) {
                            OAuthToken = [(NSDictionary *)objects objectForKey:@"access_token"];
                            [TSDKDataRequest setOAuthToken:OAuthToken];
                        }
                    }
                    if (completion) {
                        completion(success, OAuthToken, error);
                    }
                }];
                
            } else {
                if (completion) {
                    NSDictionary *userInfo;
                    
                    if ([[TSDKTeamSnap sharedInstance] clientId].length == 0) {
                        userInfo = @{NSLocalizedFailureReasonErrorKey : @"Client ID required", NSLocalizedDescriptionKey : @"The TeamSnap SDK client ID is missing."};
                    } else if([[TSDKTeamSnap sharedInstance] clientSecret].length == 0) {
                        userInfo = @{NSLocalizedFailureReasonErrorKey : @"Client Secret required", NSLocalizedDescriptionKey : @"The TeamSnap SDK client secret is missing."};
                    } else {
                        userInfo = @{NSLocalizedFailureReasonErrorKey : @"Command not found", NSLocalizedDescriptionKey : @"There was an error connecting to the TeamSnap server"};
                    }
                    NSInteger errorCode = 1;
                    
                    NSError *error = [[NSError alloc] initWithDomain:TSDKTeamSnapSDKErrorDomainKey code:errorCode userInfo:userInfo];
                    completion(NO, nil, error);
                }
            }
        } else {
            if(completion) {
                completion(NO, nil, nil);
            }
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
                    NSDictionary *userInfo;
                    
                    if (![[TSDKTeamSnap sharedInstance] clientId]) {
                        userInfo = @{NSLocalizedFailureReasonErrorKey : @"Client ID required", NSLocalizedDescriptionKey : @"The TeamSnap SDK client ID is missing."};
                    } else {
                        userInfo = @{NSLocalizedFailureReasonErrorKey : @"Command not found", NSLocalizedDescriptionKey : @"There was an error connecting to the TeamSnap server"};
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

+(void)queryGenerateFirebaseTokenTeamid:(NSString *_Nonnull)teamId version:(NSString *)version WithCompletion:(TSDKFirebaseTokenCompletionBlock)completion {
    [[TSDKTeamSnap sharedInstance] rootLinksWithConfiguration:nil completion:^(TSDKRootLinks *rootLinks) {
        if (rootLinks) {
            TSDKCollectionQuery *queryCommand = [TSDKCollectionObject queryForClass:@"root" forKey:@"generate_firebase_token"];
            if (queryCommand && [[TSDKTeamSnap sharedInstance] clientId]) {
                queryCommand.data[@"team_id"] = teamId;
                queryCommand.data[@"version"] = version;
                [queryCommand executeWithCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
                    NSString *firebaseToken = nil;
                    
                    if (success && ([[objects collection] isKindOfClass:[NSArray class]])) {
                        TSDKCollectionJSON *tokenCollectonObject = [(NSArray *)[objects collection] firstObject];
                        firebaseToken = [[tokenCollectonObject data] objectForKey:@"token"];
                    }
                    if (completion) {
                        completion(success, firebaseToken, error);
                    }
                }];
            } else {
                if (completion) {
                    NSDictionary *userInfo;
                    
                    if (![[TSDKTeamSnap sharedInstance] clientId]) {
                        userInfo = @{NSLocalizedFailureReasonErrorKey : @"Client ID required", NSLocalizedDescriptionKey : @"The TeamSnap SDK client ID is missing."};
                    } else {
                        userInfo = @{NSLocalizedFailureReasonErrorKey : @"Command not found", NSLocalizedDescriptionKey : @"There was an error connecting to the TeamSnap server"};
                    }
                    NSInteger errorCode = 1;
                    
                    NSError *error = [[NSError alloc] initWithDomain:TSDKTeamSnapSDKErrorDomainKey code:errorCode userInfo:userInfo];
                    completion(NO, nil, error);
                }
            }
        } else {
            completion(NO, nil,  nil);
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

+ (void)resetPasswordForEmailAddress:(NSString * _Nonnull)emailAddress completion:(TSDKSimpleCompletionBlock)completionBlock {
    [[TSDKTeamSnap sharedInstance] rootLinksWithConfiguration:[TSDKRequestConfiguration defaultRequestConfiguration] completion:^(TSDKRootLinks *rootLinks) {
        if (rootLinks) {
            NSURL *url = rootLinks.linkAuthorizationPasswordResets;
            if(url) {
                NSDictionary *userObject = @{@"email" : emailAddress};
                NSDictionary *postData = @{@"client_id" : [[TSDKTeamSnap sharedInstance] clientId], @"user" : userObject};
                
                [TSDKDataRequest requestJSONObjectsForPath:url sendDataDictionary:postData method:@"POST" configuration:[TSDKRequestConfiguration defaultRequestConfiguration] withCompletion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
                    if(completionBlock) {
                        completionBlock(success, error);
                    }
                }];
                
            }
        } else {
            if(completionBlock) {
                completionBlock(NO, nil);
            }
        }
    }];
}

+ (void)loginWithUser:(NSString *)aUsername password:(NSString *)aPassword onCompletion:(TSDKLoginCompletionBlock)completion {
    [[TSDKTeamSnap sharedInstance] rootLinksWithConfiguration:[TSDKRequestConfiguration defaultRequestConfiguration] completion:^(TSDKRootLinks *rootLinks) {
        if (rootLinks) {
            NSURL *oauthURL = [[rootLinks linkAuthorization] URLByAppendingPathComponent:@"oauth/token"];
            NSString *scopes = @"read write";
            
            NSDictionary *envelope = [NSDictionary dictionaryWithObjects:@[@"password", aUsername, aPassword, [[TSDKTeamSnap sharedInstance] clientId], [[TSDKTeamSnap sharedInstance] clientSecret], scopes] forKeys:@[@"grant_type", @"username", @"password", @"client_id", @"client_secret", @"scope"]];
            [TSDKDataRequest requestJSONObjectsForPath:oauthURL sendDataDictionary:envelope method:@"POST" configuration:[TSDKRequestConfiguration defaultRequestConfiguration] withCompletion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
                NSString *OAuthToken = nil;
                if (success && [objects isKindOfClass:[NSDictionary class]]) {
                    if ([(NSDictionary *)objects objectForKey:@"access_token"]) {
                        OAuthToken = [(NSDictionary *)objects objectForKey:@"access_token"];
                        
                        [[TSDKTeamSnap sharedInstance] loginWithOAuthToken:OAuthToken completion:^(BOOL success, NSError *error) {
                            if (completion) {
                                completion(success, OAuthToken, error);
                            }
                        }];
                    } else {
                        if (completion) {
                            completion(success, OAuthToken, error);
                        }
                    }
                } else {
                    if (completion) {
                        completion(success, OAuthToken, error);
                    }
                }
                
            }];
        } else {
            if(completion) {
                completion(NO, nil, nil);
            }
        }
    }];
    
}

@end
