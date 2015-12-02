//
//  TSDKCollectionObject.h
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 1/17/14.
//  Copyright (c) 2014 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>
#import "TSDKObjectsRequest.h"

@class TSDKCollectionJSON;

@interface TSDKCollectionObject : NSObject <NSCoding>

@property (nonatomic, strong) TSDKCollectionJSON *collection;
@property (nonatomic, strong) NSMutableSet *changedValues;
@property (nonatomic) BOOL logHeader;

- (instancetype)initWithCollection:(TSDKCollectionJSON *)collection;
+ (void)dumpClassSelectorInfo:(SEL)aSEL;
+(NSDictionary *)template;
+(NSDictionary *)templateForClass:(NSString *)className;
+(void)setTemplate:(NSDictionary *)template;
+(void)setTemplate:(NSDictionary *)template forClass:(NSString *)className;
+(NSURL *)classURL;
+(void)setClassURL:(NSURL *)URL;

+ (NSString *)SDKType;
+ (NSString *)SDKREL;
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
- (NSURL *)getLink:(NSString *)aKey;
- (void)encodeWithCoder:(NSCoder *)coder;
- (BOOL)isNewObject;
- (void)saveWithCompletion:(TSDKCompletionBlock)completionBlock;

- (void)refreshDataWithCompletion:(TSDKArrayCompletionBlock)completion;
- (void)arrayFromLink:(NSURL *)link WithCompletion:(TSDKArrayCompletionBlock)completion;

- (BOOL)writeToFileURL:(NSURL *)fileURL;
+ (instancetype)collectionObjectFromDataInFileURL:(NSURL *)fileURL;

@end
