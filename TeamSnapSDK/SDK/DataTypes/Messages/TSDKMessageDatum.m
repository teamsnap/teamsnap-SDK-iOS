//
//  TSDKMessageDataum.m
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 3/10/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKMessageDatum.h"

@interface TSDKMessageDatum ()

@property (nonatomic, weak) NSString *_Nullable messageType;

@end

@implementation TSDKMessageDatum

@dynamic unreadCount, memberId, userId, teamId, contactId, linkTeam, linkUser, linkMember, messageType;

+ (NSString *)SDKType {
    return @"message_datum";
}

+ (NSString *)SDKREL {
    return @"message_data";
}

- (TSDKMessageDatumMessageType)messageTypeOfUnreadCount {
    if([self.messageType isEqualToString:[TSDKMessageDatum stringValueForMessageType:TSDKMessageDatumMessageTypeAlert]]) {
        return TSDKMessageDatumMessageTypeAlert;
    } else if([self.messageType isEqualToString:[TSDKMessageDatum stringValueForMessageType:TSDKMessageDatumMessageTypeEmail]]) {
        return TSDKMessageDatumMessageTypeEmail;
    }
    return TSDKMessageDatumMessageTypeUnknown;
}

+ (NSString *_Nullable)stringValueForMessageType:(TSDKMessageDatumMessageType)messageType {
    switch (messageType) {
        case TSDKMessageDatumMessageTypeAlert:
            return @"alert";
            break;
        case TSDKMessageDatumMessageTypeEmail:
            return @"email";
            break;
        case TSDKMessageDatumMessageTypeUnknown:
            return @"unknown";
            break;
    }
}

@end
