// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

typedef enum {
    TSDKCustomDataTypeDate = 0,
    TSDKCustomDataTypeMenu = 1,
    TSDKCustomDataTypeBool = 2,
    TSDKCustomDataTypeText = 3,
    TSDKCustomDataTypeUnknown = 4
} CustomDataFieldType;


@protocol TSDKCustomField <NSObject>

@property (nonatomic, weak) NSString *_Nullable name; //Example: Size
@property (nonatomic, weak) NSArray<NSString *> *_Nullable options; // Example: Small, Medium, Large
@property (nonatomic, weak) NSString *_Nullable helpText; //Example: "Put your child's t-shirt size here"

- (CustomDataFieldType)fieldType;
- (void)setFieldType:(CustomDataFieldType)fieldType;

@end

@interface TSDKCustomField : TSDKCollectionObject <TSDKCustomField>

@property (nonatomic, weak) NSString *_Nullable name; //Example: Size
@property (nonatomic, weak) NSString *_Nullable teamId; //Example: 71118
@property (nonatomic, weak) NSArray<NSString *> *_Nullable options;
@property (nonatomic, weak) NSString *_Nullable helpText; //Example:
@property (nonatomic, weak) NSURL *_Nullable linkTeam;
@property (nonatomic, weak) NSURL *_Nullable linkCustomData;

- (CustomDataFieldType)fieldType;
- (void)setFieldType:(CustomDataFieldType)fieldType;

+ (CustomDataFieldType)fieldTypeForString:(NSString *_Nullable)kind;
+ (NSString *_Nullable)fieldTypeStringForFieldType:(CustomDataFieldType)fieldType;

@end

@interface TSDKCustomField (ForwardedMethods)

-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;
-(void)getCustomDataWithConfiguration:(TSDKRequestConfiguration  *_Nullable)configuration completion:(TSDKCustomDatumArrayCompletionBlock _Nullable)completion;

@end
