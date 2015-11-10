//
//  TSDKRootLinks.m
//  SDKDeveloperTools
//
//  Created by Jason Rahaim on 9/23/15.
//  Copyright © 2015 jasonr. All rights reserved.
//

#import "TSDKRootLinks.h"
#import "TSDKCollectionCommand.h"

@implementation TSDKRootLinks

@dynamic linkSchemas, linkContactEmailAddresses, linkDivisionContactEmailAddresses, linkAvailabilities, linkForumTopics, linkMembersPreferences, linkTeamMediaGroups, linkTeamsResults, linkDivisionMembersPreferences, linkTeamMediumComments, linkForumSubscriptions, linkEvents, linkTeamPublicSites, linkTeams, linkForumPosts, linkTeamMedia, linkSelf, linkSports, linkContacts, linkTrackedItemStatuses, linkCountries, linkLeagueRegistrantDocuments, linkSmsGateways, linkGeocodedLocations, linkPaypalCurrencies, linkDivisionLocations, linkOpponents, linkCustomData, linkDivisionContactPhoneNumbers, linkTslMetadata, linkTeamsPreferences, linkDivisionTeamStandings, linkPaymentNotes, linkTeamFees, linkMemberPhoneNumbers, linkMemberLinks, linkTeamsPaypalPreferences, linkDivisionMembers, linkBroadcastEmailAttachments, linkForecasts, linkTeamStatistics, linkMemberEmailAddresses, linkStatistics, linkMembers, linkMe, linkSponsors, linkMemberBalances, linkStatisticGroups, linkMemberStatistics, linkPublicFeatures, linkPlansAll, linkOpponentsResults, linkReferrals, linkTrackedItems, linkTslPhotos, linkUsers, linkAssignments, linkRoot, linkSweet, linkLeagueCustomData, linkStatisticData, linkContactPhoneNumbers, linkApiv2Root, linkMemberPayments, linkMemberFiles, linkPlans, linkLeagueCustomFields, linkCustomFields, linkLocations, linkDivisionMemberEmailAddresses, linkDivisionMemberPhoneNumbers, linkBroadcastEmails, linkDude, linkTimeZones, linkRandom, linkXyzzy, linkBroadcastAlerts;
;

+ (NSString *)SDKType {
    return nil;
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
