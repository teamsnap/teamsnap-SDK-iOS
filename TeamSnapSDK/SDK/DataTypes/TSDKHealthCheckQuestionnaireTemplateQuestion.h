// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKHealthCheckQuestionnaireTemplateQuestion : TSDKCollectionObject

@property (nonatomic, strong, nullable) NSString * prompt; //Example: Have you experienced a fever of 100.4ºF or greater in the past 14 days?
@property (nonatomic, strong, nullable) NSString * localizedPrompt; //Example: Have you experienced a fever of %@ or greater in the past 14 days?
@property (nonatomic, strong, nullable) NSString * healthCheckQuestionnaireTemplateId; //Example: 1
@property (nonatomic, strong, nullable) NSDate * createdAt; //Example: 2020-11-18T18:51:38Z
@property (nonatomic, strong, nullable) NSString * localizedTemperature; //Example: 100.4
@property (nonatomic, strong, nullable) NSArray * symptomAnswers;
@property (nonatomic, strong, nullable) NSDate * updatedAt; //Example: 2020-11-18T18:51:38Z
@property (nonatomic, assign) NSInteger displayOrder; //Example: 1
@property (nonatomic, strong, nullable) NSString * symptomFreeAnswer; //Example: No
@property (nonatomic, strong, nullable) NSURL * linkHealthCheckQuestionnaireTemplate;

@end

@interface TSDKHealthCheckQuestionnaireTemplateQuestion (ForwardedMethods)

-(void)getHealthCheckQuestionnaireTemplateWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKHealthCheckQuestionnaireTemplateArrayCompletionBlock _Nonnull)completion;

@end
