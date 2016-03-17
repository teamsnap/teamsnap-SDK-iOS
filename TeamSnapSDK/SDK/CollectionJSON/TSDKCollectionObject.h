//
//  TSDKCollectionObject.h
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 1/17/14.
//  Copyright (c) 2014 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKRequestConfiguration.h"
#import <CoreGraphics/CGBase.h>
#import "TSDKObjectsRequest.h"
#import "TSDKCollectionCommand.h"

@class TSDKCollectionJSON;

@interface TSDKCollectionObject : NSObject <NSCoding>

@property (nonatomic, strong) TSDKCollectionJSON *collection;
@property (nonatomic, strong) NSMutableDictionary *changedValues;
@property (nonatomic, assign) BOOL logHeader;
@property (nonatomic, strong) NSDate *lastUpdate;

- (instancetype)initWithCollection:(TSDKCollectionJSON *)collection;
+ (void)dumpClassSelectorInfo;
+(NSDictionary *)template;
+(NSDictionary *)templateForClass:(NSString *)className;
+(void)setTemplate:(NSDictionary *)template;
+(void)setTemplate:(NSDictionary *)template forClass:(NSString *)className;
+(NSMutableDictionary *)commands;
+(TSDKCollectionCommand *)commandForKey:(NSString *)commandName;
+(NSMutableDictionary *)commandsForClass:(NSString *)className;
+(TSDKCollectionCommand *)commandForClass:(NSString *)className forKey:(NSString *)commandName;

+(NSURL *)classURL;
+(void)setClassURL:(NSURL *)URL;

+ (NSString *)SDKType;
+ (NSString *)SDKREL;
+ (NSString *)completionBlockTypeName;
+ (NSString *)completionBlockArrayDescription;

- (NSInteger)objectIdentifier;
- (NSDictionary *)dataToSave;
- (NSString *)getString:(NSString *)key;
- (void)setString:(NSString *)value forKey:(NSString *)aKey;
- (NSInteger)getInteger:(NSString *)key;
- (void)setInteger:(NSInteger)value forKey:(NSString *)aKey;
- (NSDate *)getDate:(NSString *)key;
- (void)setDate:(NSDate *)value forKey:(NSString *)aKey;
- (BOOL)getBool:(NSString *)key;
- (void)setBool:(BOOL)value forKey:(NSString *)aKey;
- (CGFloat)getFloat:(NSString *)key;
- (void)setFloat:(CGFloat)value forKey:(NSString *)aKey;

- (void)setArray:(NSArray <NSString *> *)value forKey:(NSString *)aKey;
- (NSArray <NSString *> *)getArrayForKey:(NSString *)key;

- (NSURL *)getLink:(NSString *)aKey;
- (void)encodeWithCoder:(NSCoder *)coder;
- (BOOL)isNewObject;
- (void)undoChanges;
- (void)saveWithCompletion:(TSDKSaveCompletionBlock)completion;

- (void)refreshDataWithCompletion:(TSDKArrayCompletionBlock)completion;
- (void)arrayFromLink:(NSURL *)link searchParams:(NSDictionary *)searchParams withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock) completion;
- (void)arrayFromLink:(NSURL *)link withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock)completion;

- (BOOL)writeToFileURL:(NSURL *)fileURL;
+ (instancetype)collectionObjectFromDataInFileURL:(NSURL *)fileURL;

@end
