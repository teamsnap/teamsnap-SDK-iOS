//
//  TSDKContact.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 12/9/15.
//  Copyright © 2015 teamsnap. All rights reserved.
//

#import "TSDKContact.h"

@implementation TSDKContact

@dynamic  isPushable, isInvitable, addressCity, isAddressHidden, addressZip, invitationCode, memberId, userId, addressState, updatedAt, isAlertable, lastName, isEmailable, hideAddress, allowSharedAccess, label, addressStreet1, invitationDeclined, addressCountry, createdAt, addressStreet2, firstName, teamId, linkMember, linkContactPhoneNumbers, linkTeam, linkContactEmailAddresses, linkMessages;

+ (NSString *)SDKType {
    return @"contact";
}

- (BOOL)canMarkAsRead {
    return YES;
}

- (void)getMessagesWithConfiguration:(TSDKRequestConfiguration *)configuration type:(TSDKMessageType)type completion:(TSDKMessagesArrayCompletionBlock)completion {
    NSDictionary *searchParams;
    if(type == TSDKMessageTypeAlert) {
        searchParams = @{@"message_type": @"Alert"};
    } else if(type == TSDKMessageTypeEmail) {
        searchParams = @{@"message_type": @"Email"};
    }
    
    [self arrayFromLink:self.linkMessages searchParams:searchParams withConfiguration:configuration completion:completion];
}

- (NSInteger)contactId {
    return self.objectIdentifier;
}

@end
