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
#import "TSDKCollectionQuery.h"
#import "TSDKCollectionCommand.h"
#import "TSDKPersistenceFilePath.h"
@class TSDKCollectionJSON;

NS_ASSUME_NONNULL_BEGIN

@class TSDKCollectionJSON;

@protocol TSDKCollectionObjectBundledDataProtocol <NSObject>

+ (NSURL *_Nullable)bundledFileURL;

@end

@interface TSDKCollectionObject : NSObject <NSCoding, NSCopying, TSDKPersistenceFilePath>

@property (nonatomic, copy, readonly, nullable) TSDKCollectionJSON * collection __deprecated;
@property (nonatomic, copy, readonly, nullable) NSDictionary * changedValues;
@property (nonatomic, assign) BOOL logHeader;
@property (nonatomic, strong, nullable) NSDate * lastUpdate;
@property (nonatomic, strong) NSURL * persistenceBaseFilePath;

- (instancetype)initWithCollection:(TSDKCollectionJSON *)collection;
+ (id _Nullable)objectWithObject:(TSDKCollectionObject *)originalObject;
- (void)updateWithCollectionFromObject:(TSDKCollectionObject *)otherObject;

+ (void)dumpClassSelectorInfo;
+(NSDictionary *_Nullable)template;
+(NSDictionary *_Nullable)templateForClass:(NSString *)className;
+(void)setTemplate:(NSDictionary *_Nullable)template;
+(void)setTemplate:(NSDictionary *_Nullable)template forClass:(NSString *_Nullable)className;
+(NSMutableDictionary *_Nullable)commands;
+(TSDKCollectionCommand *_Nullable)commandForKey:(NSString *)commandName;
+(NSMutableDictionary *_Nullable)commandsForClass:(NSString *)className;
+(TSDKCollectionCommand *_Nullable)commandForClass:(NSString *)className forKey:(NSString *)commandName;

+ (NSMutableDictionary *_Nullable)queries;
+(TSDKCollectionQuery *_Nullable)queryForKey:(NSString *)commandName;
+(NSMutableDictionary *_Nullable)queriesForClass:(NSString *)className;
+(TSDKCollectionQuery *_Nullable)queryForClass:(NSString *)className forKey:(NSString *)queryName;

+(NSURL *_Nullable)classURL;
+(void)setClassURL:(NSURL *_Nullable)URL;

+ (NSString *_Nullable)SDKType;
+ (NSString *_Nullable)SDKREL;
+ (NSString *_Nullable)completionBlockTypeName;
+ (NSString *_Nullable)completionBlockArrayDescription;

- (NSString *)objectIdentifier;
- (NSString * )objectIdentifierForKey:(NSString *)key;
- (BOOL)isEqualToCollectionObject:(TSDKCollectionObject *)collectionObject;

- (NSDictionary *_Nullable)dataToSave;
- (NSString *_Nullable)getString:(NSString *)key;
- (void)setString:(NSString *_Nullable)value forKey:(NSString *)aKey;
- (NSInteger)getInteger:(NSString *)key;
- (void)setInteger:(NSInteger)value forKey:(NSString *)aKey;
- (NSDate *_Nullable)getDate:(NSString *)key;
- (void)setDate:(NSDate *_Nullable)value forKey:(NSString *)aKey;
- (BOOL)getBool:(NSString *)key;
- (void)setBool:(BOOL)value forKey:(NSString *)aKey;
- (CGFloat)getCGFloat:(NSString *)key;
- (void)setCGFloat:(CGFloat)value forKey:(NSString *)aKey;

- (void)setArray:(NSArray <NSString *> *_Nullable)value forKey:(NSString *)aKey;
- (NSArray <NSString *> *_Nullable)getArrayForKey:(NSString *)key;

- (void)setCollectionObject:(NSObject<NSCoding> * _Nullable)object forKey:(NSString *)key;
- (id)collectionObjectForKey:(NSString *)key;
- (void)removeCollectionObjectForKey:(NSString *)aKey;

- (id)queryForKey:(NSString *)key;

- (TSDKCollectionCommand *_Nullable)commandForKey:(NSString *)key;
- (NSURL *_Nullable)linkForKey:(NSString *)key;

- (id _Nullable)changedValueForKey:(NSString *)aKey;
- (void)setChangedValue:(id _Nullable)value forKey:(NSString *)aKey;
- (void)removeChangedValueForKey:(NSString *)key;
- (void)clearChanges;

- (NSURL *_Nullable)getLink:(NSString *)aKey;
- (void)encodeWithCoder:(NSCoder *)coder;
- (BOOL)isNewObject;
- (void)undoChanges;
- (void)saveWithCompletion:(TSDKSaveCompletionBlock _Nullable)completion;
- (void)saveWithCustomURLQuery:(NSArray <NSURLQueryItem *> * )queryItems completion:(TSDKSaveCompletionBlock _Nullable)completion;
- (void)saveWithURL:(NSURL * _Nonnull)url completion:(TSDKSaveCompletionBlock _Nullable)completion;
- (void)deleteWithCompletion:(TSDKSimpleCompletionBlock _Nullable)completion;

- (void)refreshDataWithCompletion:(TSDKArrayCompletionBlock _Nullable)completion;
+ (void)arrayFromFileLink:(NSURL *)link completion:(TSDKArrayCompletionBlock _Nullable)completion;
- (void)arrayFromLink:(NSURL *)link searchParams:(NSDictionary <NSString *, id> *_Nullable)searchParams withConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable) completion;
+ (void)arrayFromLink:(NSURL *)link searchParams:(NSDictionary <NSString *, id> *_Nullable)searchParams withConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable) completion;
- (void)arrayFromLink:(NSURL *)link withConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;

- (BOOL)writeToFileURL:(NSURL *)fileURL;
+ (instancetype _Nullable)collectionObjectFromDataInFileURL:(NSURL *)fileURL;

@end

NS_ASSUME_NONNULL_END
