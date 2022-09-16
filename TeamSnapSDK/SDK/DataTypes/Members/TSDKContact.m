//
//  TSDKContact.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 12/9/15.
//  Copyright © 2015 teamsnap. All rights reserved.
//

#import "TSDKContact.h"
#import "NSMutableString+TSDKConveniences.h"
#import "NSURL+TSDKConveniences.h"

@implementation TSDKContact

@dynamic  isPushable, isInvitable, addressCity, isAddressHidden, addressZip, invitationCode, memberId, userId, addressState, updatedAt, isAlertable, lastName, isEmailable, allowSharedAccess, label, addressStreet1, invitationDeclined, addressCountry, createdAt, addressStreet2, firstName, teamId, isOwner, isCommissioner, isManager, isDeletable, isSelectableForChat, isShownUnreachableForChatBanner, emailLimit, showName, position, userFirstName, userLastName, linkMember, linkContactPhoneNumbers, linkTeam, linkContactEmailAddresses, linkMessages;

+ (NSString *)SDKType {
    return @"contact";
}

- (BOOL)isAtLeastManager {
    NSLog(@"+++ isAtLeastManager");
    return (self.isManager || self.isOwner || self.isCommissioner || self.isLeagueOwner);
}

- (BOOL)isEditable {
    NSLog(@"+++ isEditable");
    NSNumber *value = [self collectionObjectForKey:@"is_editable"];
    if (value != nil) {
        return [value boolValue];
    } else {
        return YES;
    }
}

- (BOOL)canMarkAsRead {
    return YES;
}

- (NSURL * _Nullable)urlForMessageType:(TSDKMessageType)type {
    NSString *messageTypeValue;
    switch (type) {
        case TSDKMessageTypeAlert:
            messageTypeValue = @"alert";
            break;
        case TSDKMessageTypeEmail:
            messageTypeValue = @"email";
            break;
        default:
            break;
    }
    NSURLQueryItem *typeSearchParameter = [NSURLQueryItem queryItemWithName:@"message_type" value:messageTypeValue];
    return [self.linkMessages URLByAppendingQueryItem:typeSearchParameter];
}

- (void)getMessagesWithConfiguration:(TSDKRequestConfiguration *)configuration type:(TSDKMessageType)type completion:(TSDKMessagesArrayCompletionBlock)completion {
    [self arrayFromLink:[self urlForMessageType:type] searchParams:nil withConfiguration:configuration completion:completion];
}

- (NSString *_Nullable)contactId {
    NSLog(@"+++ contactId %@", self.objectIdentifier);
    return self.objectIdentifier;
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
        NSLog(@"+++ contact fullname %@", fullName);

        return [fullName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    } else if (self.firstName && self.firstName.length>0) {
        return self.firstName;
    } else if (self.lastName && self.lastName.length>0) {
        return  self.lastName;
    } else {
        return @"";
    }
}

- (NSString *)fancyAddressString {
    if (self.addressCity.length==0 && self.addressState.length==0 && self.addressZip.length==0) {
        if (self.addressStreet2.length==0) {
            return [NSString stringWithFormat:@"%@", self.addressStreet1];
        } else {
            return [NSString stringWithFormat:@"%@\n%@", self.addressStreet1, self.addressStreet2];
        }
        
    } else {
        if (self.addressStreet2.length==0) {
            return [NSString stringWithFormat:@"%@\n%@, %@  %@", self.addressStreet1, self.addressCity, self.addressState, self.addressZip];
        } else {
            return [NSString stringWithFormat:@"%@\n%@\n%@, %@  %@", self.addressStreet1, self.addressStreet2, self.addressCity, self.addressState, self.addressZip];
        }
    }
}

-(NSString *)addressString {
    NSMutableString *result = [[NSMutableString alloc] initWithFormat:@""];
    
    if (self.addressStreet1.length>0) {
        [result appendFormat:@"%@", self.addressStreet1];
    }
    if (self.addressStreet2.length>0) {
        [result appendStringWithComma:self.addressStreet2];
    }
    if (self.addressCity.length>0) {
        [result appendStringWithComma:self.addressCity];
    }
    if (self.addressState.length>0) {
        [result appendStringWithComma:self.addressState];
    }
    if (self.addressZip.length>0) {
        [result appendFormat:@" %@", self.addressZip];
    }
    return [NSString stringWithString:result];
}

- (BOOL)hasExistingInvitation {
    return (self.isInvitable && self.invitationCode);
}

- (void)getMessageWithId:(NSString *_Nonnull)messageId withConfiguration:(TSDKRequestConfiguration *_Nonnull)configuration completion:(void (^_Nonnull)(TSDKMessage * _Nullable))completion {
    NSDictionary *searchParams = @{@"id": messageId};
    
    [self arrayFromLink:self.linkMessages searchParams:searchParams withConfiguration:configuration completion:^(BOOL success, BOOL complete, NSArray * _Nonnull objects, NSError * _Nullable error) {
        TSDKMessage *message = [objects firstObject];
        if([message.objectIdentifier isEqualToString:messageId]) {
            completion(message);
        } else {
            completion(nil);
        }
    }];
}

- (NSString *_Nonnull)fullNameOfUser {
    if ((self.userFirstName.length > 0) && (self.userLastName.length > 0)) {
        
        NSString *fullName;
        if (@available(iOS 9.0, *)) {
            NSPersonNameComponents *nameComponents = [[NSPersonNameComponents alloc] init];
            nameComponents.givenName = self.userFirstName;
            nameComponents.familyName = self.userLastName;
            
            fullName = [NSPersonNameComponentsFormatter localizedStringFromPersonNameComponents:nameComponents style:NSPersonNameComponentsFormatterStyleDefault options: 0];
        } else {
            fullName = [@[self.userFirstName, self.userLastName] componentsJoinedByString:@" "];
        }
        
        return [fullName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    } else if (self.userFirstName.length > 0) {
        return self.userFirstName;
    } else if (self.userLastName.length > 0) {
        return self.userLastName;
    } else {
        return @"";
    }
}

@end
