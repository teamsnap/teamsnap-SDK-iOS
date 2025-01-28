//
//  TSDKHealthCheckQuestionnaireTemplate.m
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 11/30/20.
//  Copyright © 2020 teamsnap. All rights reserved.
//

#import "TSDKHealthCheckQuestionnaireTemplate.h"

@implementation TSDKHealthCheckQuestionnaireTemplate

@dynamic isDefaultTemplate, divisionId, updatedAt, createdAt, linkHealthCheckQuestionnaireTemplateQuestions;

+ (NSString *)SDKType {
  return @"health_check_questionnaire_template";
}

@end
