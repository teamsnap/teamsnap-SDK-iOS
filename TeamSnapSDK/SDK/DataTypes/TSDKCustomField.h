// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

extern NSString * _Nonnull const TSDKCustomDataTypeDateString;
extern NSString * _Nonnull const TSDKCustomDataTypeMenuString;
extern NSString * _Nonnull const TSDKCustomDataTypeBoolString;
extern NSString * _Nonnull const TSDKCustomDataTypeTextString;

typedef enum {
    TSDKCustomDataTypeDate = 0,
    TSDKCustomDataTypeMenu = 1,
    TSDKCustomDataTypeBool = 2,
    TSDKCustomDataTypeText = 3,
    TSDKCustomDataTypeUnknown = 4
} CustomDataFieldType;

@interface TSDKCustomField : TSDKCollectionObject

@property (nonatomic, weak) NSString *_Nullable name; //Example: Size
@property (nonatomic, weak) NSString *_Nullable teamId; //Example: 71118
@property (nonatomic, weak) NSString *_Nullable kind; //Example: Menu
@property (nonatomic, weak) NSArray *_Nullable options;
@property (nonatomic, weak) NSString *_Nullable helpText; //Example:
@property (nonatomic, weak) NSURL *_Nullable linkTeam;
@property (nonatomic, weak) NSURL *_Nullable linkCustomData;

@property (nonatomic, assign) CustomDataFieldType dataType;

+ (CustomDataFieldType)fieldTypeForString:(NSString *_Nullable)kind;
+ (NSString *_Nullable)fieldTypeStringForFieldType:(CustomDataFieldType)fieldType;

@end

@interface TSDKCustomField (ForwardedMethods)

-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;
-(void)getCustomDataWithConfiguration:(TSDKRequestConfiguration  *_Nullable)configuration completion:(TSDKCustomDatumArrayCompletionBlock _Nullable)completion;

@end
