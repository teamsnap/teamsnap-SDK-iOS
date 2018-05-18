//
//  TSDKInvoiceRecipient.h
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 5/17/18.
//  Copyright © 2018 teamsnap. All rights reserved.
//

#import <TeamSnapSDK/TeamSnapSDK.h>

@interface TSDKInvoiceRecipient : TSDKCollectionObject

// When assigned to a member invoiceable_id is set the to member.id, and invoiceable_type is set to “member”
@property (nonatomic, weak) NSString * _Nullable batchInvoiceId;
@property (nonatomic, weak) NSString * _Nullable invoiceId;
@property (nonatomic, weak) NSString * _Nullable invoiceableId;
@property (nonatomic, weak) NSString * _Nullable invoiceableType;
@property (nonatomic, weak) NSString * _Nullable invoiceTo;
@property (nonatomic, weak) NSDate * _Nullable createdAt;
@property (nonatomic, weak) NSDate * _Nullable updatedAt;
@property (nonatomic, weak) NSURL * _Nullable linkInvoice;
@property (nonatomic, weak) NSURL * _Nullable linkBatchInvoice;
@property (nonatomic, weak) NSURL * _Nullable linkMember;
@property (nonatomic, weak) NSURL * _Nullable linkDivision;
@property (nonatomic, weak) NSURL * _Nullable linkTeam;

@end
