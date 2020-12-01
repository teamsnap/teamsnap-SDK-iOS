// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

@interface TSDKHealthCheckQuestionnaireTemplate : TSDKCollectionObject

@property (nonatomic, assign) BOOL isDefaultTemplate; //Example: 1
@property (nonatomic, strong, nullable) NSString * divisionId; //Example: <null>
@property (nonatomic, strong, nullable) NSDate * updatedAt; //Example: 2020-11-18T18:51:38Z
@property (nonatomic, strong, nullable) NSDate * createdAt; //Example: 2020-11-18T18:51:38Z
@property (nonatomic, strong, nullable) NSURL * linkHealthCheckQuestionnaireTemplateQuestions;

@end

@interface TSDKHealthCheckQuestionnaireTemplate (ForwardedMethods)

-(void)getHealthCheckQuestionnaireTemplateQuestionsWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nonnull)completion;


@end
