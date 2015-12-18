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

@interface TSDKRootLinks()
@property (nonatomic, strong) NSArray *schemas;
@end

@implementation TSDKRootLinks

@dynamic linkSchemas, linkContactEmailAddresses, linkDivisionContactEmailAddresses, linkAvailabilities, linkForumTopics, linkMembersPreferences, linkTeamMediaGroups, linkTeamsResults, linkDivisionMembersPreferences, linkTeamMediumComments, linkForumSubscriptions, linkEvents, linkTeamPublicSites, linkTeams, linkForumPosts, linkTeamMedia, linkSelf, linkSports, linkContacts, linkTrackedItemStatuses, linkCountries, linkLeagueRegistrantDocuments, linkSmsGateways, linkGeocodedLocations, linkPaypalCurrencies, linkDivisionLocations, linkOpponents, linkCustomData, linkDivisionContactPhoneNumbers, linkTslMetadata, linkTeamsPreferences, linkDivisionTeamStandings, linkPaymentNotes, linkTeamFees, linkMemberPhoneNumbers, linkMemberLinks, linkTeamsPaypalPreferences, linkDivisionMembers, linkBroadcastEmailAttachments, linkForecasts, linkTeamStatistics, linkMemberEmailAddresses, linkStatistics, linkMembers, linkMe, linkSponsors, linkMemberBalances, linkStatisticGroups, linkMemberStatistics, linkPublicFeatures, linkPlansAll, linkOpponentsResults, linkReferrals, linkTrackedItems, linkTslPhotos, linkUsers, linkAssignments, linkRoot, linkSweet, linkLeagueCustomData, linkStatisticData, linkContactPhoneNumbers, linkApiv2Root, linkMemberPayments, linkMemberFiles, linkPlans, linkLeagueCustomFields, linkCustomFields, linkLocations, linkDivisionMemberEmailAddresses, linkDivisionMemberPhoneNumbers, linkBroadcastEmails, linkDude, linkTimeZones, linkRandom, linkXyzzy, linkBroadcastAlerts;
;

+ (NSString *)SDKType {
    return nil;
}

-(void)getSchemasWithCompletion:(TSDKArrayCompletionBlock)completion {
    if (self.schemas) {
        if (completion) {
            completion(YES, YES, self.schemas, nil);
        }
    } else {
        [TSDKDataRequest requestJSONObjectsForPath:self.linkSchemas sendDataDictionary:nil method:@"GET" withCompletion:^(BOOL success, BOOL complete, id objects, NSError *error) {
            if ([objects isKindOfClass:[NSArray class]]) {
                if (success) {
                    self.schemas = objects;
                }

                NSArray *schemasArray = (NSArray *)objects;
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
                            [TSDKCollectionObject setTemplate:[NSDictionary dictionaryWithDictionary:template] forClass:type];
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
            if (completion) {
                completion(success, complete, objects, error);
            }
        }];
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

@end
