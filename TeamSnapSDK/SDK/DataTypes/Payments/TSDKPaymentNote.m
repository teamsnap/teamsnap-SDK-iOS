//
//  TSDKPaymentNote.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 2/23/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKPaymentNote.h"

@implementation TSDKPaymentNote
@dynamic note, memberPaymentId, teamFeeDescription, createdAt, noteAuthor, memberId, paymentNoteDescription, teamId, linkMember, linkMemberPayment, linkTeam;

+ (NSString *)SDKType {
    return @"payment_note";
}

- (NSString *)paymentNoteDescription {
    return [self getString:@"description"];
}

- (void)setPaymentNoteDescription:(NSString *)paymentNoteDescription {
    [self setString:paymentNoteDescription forKey:@"description"];
}

@end
