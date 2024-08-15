//
//  TSDKHealthCheckQuestionnaire.m
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 7/14/20.
//  Copyright © 2020 teamsnap. All rights reserved.
//

#import "TSDKHealthCheckQuestionnaire.h"

@implementation TSDKHealthCheckQuestionnaire

@dynamic status, createdAt, completedAt, memberId, eventId, updatedAt, linkEvent, linkMember;

+ (NSString *)SDKType {
  return @"health_check_questionnaire";
}

@end
