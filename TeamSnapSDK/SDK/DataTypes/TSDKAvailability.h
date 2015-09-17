//
//  TSDKAvailability.h
//  SDKPlayground
//
//  Created by Jason Rahaim on 2/12/15.
//  Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <TeamSnapSDK/TeamSnapSDK.h>

@interface TSDKAvailability : TSDKCollectionObject

@property (nonatomic, weak) NSString *status;
@property (nonatomic, weak) NSString *notes;
@property (nonatomic, weak) NSString *notesAuthorMemberId;
@property (nonatomic) NSInteger statusCode;
@property (nonatomic) NSInteger memberId;
@property (nonatomic) NSInteger eventId;
@property (nonatomic) NSInteger teamId;
@property (nonatomic, weak) NSDate *createdAt;
@property (nonatomic, weak) NSDate *updatedAt;
@property (nonatomic, weak) NSURL *linkEvent;
@property (nonatomic, weak) NSURL *linkMember;
@property (nonatomic, weak) NSURL *linkTeam;

@end
