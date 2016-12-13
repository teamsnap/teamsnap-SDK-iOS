//
//  TSDKDivisionMember.m
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 4/26/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKDivisionMember.h"
#import "TSDKMessage.h"

@implementation TSDKDivisionMember

@dynamic isOwner, isCommissioner, isManager, createdAt, addressCity, addressState, addressZip, isLeagueOwner, addressStreet2, userId, firstName, addressStreet1, birthday, updatedAt, lastName, linkDivisionContacts, linkContactEmailAddresses, linkMessageData, linkForumPosts, linkDivisionMemberPreferences, linkMessages, linkMemberPreferences, linkContactPhoneNumbers, linkDivisionContactEmailAddresses, linkContacts, linkDivisionMemberEmailAddresses, linkMemberEmailAddresses, linkDivisionMemberPhoneNumbers, linkDivisionContactPhoneNumbers, linkMemberPhoneNumbers, linkUser;

+ (NSString *)SDKType {
    return @"division_member";
}

- (BOOL)canMarkAsRead {
    return NO;
}

- (void)getMessagesWithConfiguration:(TSDKRequestConfiguration *)configuration type:(TSDKMessageType)type completion:(TSDKMessagesArrayCompletionBlock)completion {
    NSDictionary *searchParams;
    if(type == TSDKMessageTypeAlert) {
        searchParams = @{@"message_type": @"alert"};
    } else if(type == TSDKMessageTypeEmail) {
        searchParams = @{@"message_type": @"email"};
    }
    
    [self arrayFromLink:self.linkMessages searchParams:searchParams withConfiguration:configuration completion:completion];
}

- (NSString *_Nullable)memberId {
    return self.objectIdentifier;
}

@end
