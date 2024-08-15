//
//  TSDKHealthCheckQuestionnaireTemplateQuestion.m
//  TeamSnapSDK
//
//  Created by Skyler Seamans on 11/30/20.
//  Copyright © 2020 teamsnap. All rights reserved.
//

#import "TSDKHealthCheckQuestionnaireTemplateQuestion.h"

@implementation TSDKHealthCheckQuestionnaireTemplateQuestion

@dynamic prompt, localizedPrompt, updatedAt, createdAt, localizedTemperature, symptomAnswers, displayOrder, symptomFreeAnswer, healthCheckQuestionnaireTemplateId, linkHealthCheckQuestionnaireTemplate;

+ (NSString *)SDKType {
  return @"health_check_questionnaire_template_question";
}

@end
