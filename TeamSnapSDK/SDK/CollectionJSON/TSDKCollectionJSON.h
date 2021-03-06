//
//  TSDKCollectionJSON.h
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 1/10/14.
//  Copyright (c) 2014 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSDKCollectionJSON : NSObject <NSSecureCoding, NSCopying>

@property (nonatomic, strong) NSURL *_Nullable href;
@property (nonatomic, strong) NSString *_Nullable version;
@property (nonatomic, strong) NSString *_Nullable type;
@property (nonatomic, strong) NSString *_Nullable rel;
@property (nonatomic, strong) NSString *_Nullable errorTitle;
@property (nonatomic, strong) NSString *_Nullable errorMessage;
@property (nonatomic, assign) NSInteger errorCode;
@property (nonatomic, strong) NSDictionary *_Nullable links;
@property (nonatomic, strong) NSMutableDictionary *_Nullable data;
@property (nonatomic, strong) NSDictionary *_Nullable commands;
@property (nonatomic, strong) NSDictionary *_Nullable queries;
@property (nonatomic, strong) NSMutableArray <TSDKCollectionJSON *> *_Nullable collection;

- (instancetype _Nullable)initWithCoder:(NSCoder *_Nonnull)aDecoder;
- (instancetype _Nullable)initWithJSON:(NSDictionary *_Nonnull)JSON;
+ (instancetype _Nullable)collectionJSONForEncodedData:(NSData *_Nonnull)objectData;
- (NSString *_Nullable)getObjectiveCHeaderSkeleton;
- (void)printObjectiveCHeaderSkeleton;
+ (NSString *_Nonnull)getObjectiveCHeaderForCommandsForTypeName:(NSString *_Nonnull)typeName;
- (NSData *_Nonnull)dataEncodedForSave;

@end
