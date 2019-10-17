// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"

typedef NS_CLOSED_ENUM(NSUInteger, TSDKCustomDataFieldType) {
    TSDKCustomDataFieldTypeDate,
    TSDKCustomDataFieldTypeMenu,
    TSDKCustomDataFieldTypeBool,
    TSDKCustomDataFieldTypeText,
    TSDKCustomDataFieldTypeUnknown
};

@protocol TSDKCustomField <NSObject, NSCopying>

@property (nonatomic, strong) NSString *_Nullable name; //Example: Size
@property (nonatomic, strong) NSArray<NSString *> *_Nullable options; // Example: Small, Medium, Large
@property (nonatomic, strong) NSString *_Nullable helpText; //Example: "Put your child's t-shirt size here"
@property (nonatomic, strong) NSString *_Nullable kind;

- (NSString * _Nonnull)objectIdentifier;

- (BOOL)required;
- (BOOL)teamCanEdit;
- (BOOL)teamCanRead;

- (TSDKCustomDataFieldType)fieldType;
- (void)setFieldType:(TSDKCustomDataFieldType)fieldType;

@end

@interface TSDKCustomField : TSDKCollectionObject <TSDKCustomField>

@property (nonatomic, strong) NSString *_Nullable name; //Example: Size
@property (nonatomic, strong) NSString *_Nullable teamId; //Example: 71118
@property (nonatomic, strong) NSArray<NSString *> *_Nullable options;
@property (nonatomic, strong) NSString *_Nullable helpText; //Example:
@property (nonatomic, strong) NSString *_Nullable kind;
@property (nonatomic, strong) NSURL *_Nullable linkTeam;
@property (nonatomic, strong) NSURL *_Nullable linkCustomData;
@property (nonatomic, assign) BOOL teamCanEdit; //Example: 1
@property (nonatomic, assign) BOOL teamCanRead; //Example: 1

- (TSDKCustomDataFieldType)fieldType;
- (void)setFieldType:(TSDKCustomDataFieldType)fieldType;

+ (TSDKCustomDataFieldType)fieldTypeForString:(NSString *_Nullable)kind;
+ (NSString *_Nullable)fieldTypeStringForFieldType:(TSDKCustomDataFieldType)fieldType;

@end

@interface TSDKCustomField (ForwardedMethods)

-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;
-(void)getCustomDataWithConfiguration:(TSDKRequestConfiguration  *_Nullable)configuration completion:(TSDKCustomDatumArrayCompletionBlock _Nullable)completion;

@end
