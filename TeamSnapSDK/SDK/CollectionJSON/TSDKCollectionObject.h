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


@protocol TSDKCollectionObjectBundledDataProtocol <NSObject>

+ (NSURL *_Nullable)bundledFileURL;

@end

@interface TSDKCollectionObject : NSObject <NSCoding, TSDKPersistenceFilePath>

@property (nonatomic, strong) TSDKCollectionJSON *_Nullable collection;
@property (nonatomic, strong) NSMutableDictionary *_Nullable changedValues;
@property (nonatomic, assign) BOOL logHeader;
@property (nonatomic, strong) NSDate *_Nullable lastUpdate;
@property (nonatomic, strong) NSURL * _Nonnull persistenceBaseFilePath;

- (instancetype _Nonnull)initWithCollection:(TSDKCollectionJSON *_Nonnull)collection;
+ (id _Nullable)objectWithObject:(TSDKCollectionObject *_Nonnull)originalObject;
+ (void)dumpClassSelectorInfo;
+(NSDictionary *_Nullable)template;
+(NSDictionary *_Nullable)templateForClass:(NSString *_Nonnull)className;
+(void)setTemplate:(NSDictionary *_Nullable)template;
+(void)setTemplate:(NSDictionary *_Nullable)template forClass:(NSString *_Nullable)className;
+(NSMutableDictionary *_Nullable)commands;
+(TSDKCollectionCommand *_Nullable)commandForKey:(NSString *_Nonnull)commandName;
+(NSMutableDictionary *_Nullable)commandsForClass:(NSString *_Nonnull)className;
+(TSDKCollectionCommand *_Nullable)commandForClass:(NSString *_Nonnull)className forKey:(NSString *_Nonnull)commandName;

+ (NSMutableDictionary *_Nullable)queries;
+(TSDKCollectionQuery *_Nullable)queryForKey:(NSString *_Nonnull)commandName;
+(NSMutableDictionary *_Nullable)queriesForClass:(NSString *_Nonnull)className;
+(TSDKCollectionQuery *_Nullable)queryForClass:(NSString *_Nonnull)className forKey:(NSString *_Nonnull)queryName;

+(NSURL *_Nullable)classURL;
+(void)setClassURL:(NSURL *_Nullable)URL;

+ (NSString *_Nullable)SDKType;
+ (NSString *_Nullable)SDKREL;
+ (NSString *_Nullable)completionBlockTypeName;
+ (NSString *_Nullable)completionBlockArrayDescription;

- (NSString *_Nonnull)objectIdentifier;
- (NSString * _Nonnull)objectIdentifierForKey:(NSString *_Nonnull)key;
- (BOOL)isEqualToCollectionObject:(TSDKCollectionObject *_Nonnull)collectionObject;

- (NSDictionary *_Nullable)dataToSave;
- (NSString *_Nullable)getString:(NSString *_Nonnull)key;
- (void)setString:(NSString *_Nullable)value forKey:(NSString *_Nonnull)aKey;
- (NSInteger)getInteger:(NSString *_Nonnull)key;
- (void)setInteger:(NSInteger)value forKey:(NSString *_Nonnull)aKey;
- (NSDate *_Nullable)getDate:(NSString *_Nonnull)key;
- (void)setDate:(NSDate *_Nullable)value forKey:(NSString *_Nonnull)aKey;
- (BOOL)getBool:(NSString *_Nonnull)key;
- (void)setBool:(BOOL)value forKey:(NSString *_Nonnull)aKey;
- (CGFloat)getCGFloat:(NSString *_Nonnull)key;
- (void)setCGFloat:(CGFloat)value forKey:(NSString *_Nonnull)aKey;

- (void)setArray:(NSArray <NSString *> *_Nullable)value forKey:(NSString *_Nonnull)aKey;
- (NSArray <NSString *> *_Nullable)getArrayForKey:(NSString *_Nonnull)key;

- (NSURL *_Nullable)getLink:(NSString *_Nonnull)aKey;
- (void)encodeWithCoder:(NSCoder *_Nonnull)coder;
- (BOOL)isNewObject;
- (void)undoChanges;
- (void)saveWithCompletion:(TSDKSaveCompletionBlock _Nullable)completion;
- (void)saveWithCustomURLQuery:(NSArray <NSURLQueryItem *> * _Nonnull)queryItems completion:(TSDKSaveCompletionBlock _Nullable)completion;
- (void)deleteWithCompletion:(TSDKSimpleCompletionBlock _Nullable)completion;

- (void)refreshDataWithCompletion:(TSDKArrayCompletionBlock _Nullable)completion;
+ (void)arrayFromFileLink:(NSURL *_Nonnull)link completion:(TSDKArrayCompletionBlock _Nullable)completion;
- (void)arrayFromLink:(NSURL *_Nonnull)link searchParams:(NSDictionary *_Nullable)searchParams withConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable) completion;
- (void)arrayFromLink:(NSURL *_Nonnull)link withConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(TSDKArrayCompletionBlock _Nullable)completion;

- (BOOL)writeToFileURL:(NSURL *_Nonnull)fileURL;
+ (instancetype _Nullable)collectionObjectFromDataInFileURL:(NSURL *_Nonnull)fileURL;

@end
