//
//  TSDKCustomDatum.h
//  SDKPlayground
//
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKCollectionObject.h"
#import "TSDKObjectsRequest.h"
#import "TSDKCustomField.h"

@protocol TSDKCustomDataProtocol <NSObject, NSCopying>

@property (nonatomic, weak) NSString *_Nullable name; //Example: Size
@property (nonatomic, weak) NSArray *_Nullable options; //Example: Y Small, Y Medium,Y Large,Small,Medium,Large
@property (nonatomic, weak) NSString *_Nullable value; //Example: Small
@property (nonatomic, weak) NSString *_Nullable memberId; //Example: 1086731
@property (nonatomic, weak) NSString *_Nullable teamId; //Example: 71118
@property (nonatomic, weak) NSString *_Nullable kind; //Example: Menu
@property (nonatomic, weak) NSString *_Nullable helpText; //Example:
@property (nonatomic, assign) BOOL isPrivate; //Example: 0

@property (nonatomic, assign) TSDKCustomDataFieldType dataType;
@property (nonatomic, weak) NSDate *_Nullable dateValue;

- (NSString * _Nonnull)objectIdentifier;
- (NSString * _Nullable)displayValue;
- (NSString * _Nullable)customFieldId;

@end

@interface TSDKCustomDatum : TSDKCollectionObject <TSDKCustomDataProtocol>

@property (nonatomic, weak) NSString *_Nullable customFieldId; //Example: 25383
@property (nonatomic, weak) NSURL *_Nullable linkCustomField;
@property (nonatomic, weak) NSURL *_Nullable linkMember;
@property (nonatomic, weak) NSURL *_Nullable linkTeam;

- (instancetype _Nonnull )initWithField:(TSDKCustomField *_Nonnull)field memberId:(NSString *_Nonnull)memberId teamId:(NSString *_Nonnull)teamId;

@end

@interface TSDKCustomDatum (ForwardedMethods)

-(void)getCustomFieldWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKCustomFieldArrayCompletionBlock _Nullable)completion;
-(void)getMemberWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKMemberArrayCompletionBlock _Nullable)completion;
-(void)getTeamWithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKTeamArrayCompletionBlock _Nullable)completion;


@end
