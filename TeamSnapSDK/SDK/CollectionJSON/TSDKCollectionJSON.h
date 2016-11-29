//
//  TSDKCollectionJSON.h
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 1/10/14.
//  Copyright (c) 2014 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSDKCollectionJSON : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSURL *_Nullable href;
@property (nonatomic, strong) NSString *_Nullable version;
@property (nonatomic, strong) NSString *_Nullable type;
@property (nonatomic, strong) NSString *_Nullable rel;
@property (nonatomic, strong) NSString *_Nullable errorTitle;
@property (nonatomic, strong) NSString *_Nullable errorMessage;
@property (nonatomic, assign) NSInteger errorCode;
@property (nonatomic, strong) NSMutableDictionary *_Nullable links;
@property (nonatomic, strong) NSMutableDictionary *_Nullable data;
@property (nonatomic, strong) NSMutableDictionary *_Nullable commands;
@property (nonatomic, strong) NSMutableDictionary *_Nullable queries;
@property (nonatomic, strong) id _Nullable collection;

+(NSDictionary *_Nullable)dictionaryToCollectionJSON:(NSDictionary *_Nonnull)dictionary;
- (instancetype _Nullable)initWithCoder:(NSCoder *_Nonnull)aDecoder;
- (instancetype _Nullable)initWithJSON:(NSDictionary *_Nonnull)JSON;
+ (instancetype _Nullable)collectionJSONForEncodedData:(NSData *_Nonnull)objectData;
- (NSString *_Nullable)getObjectiveCHeaderSkeleton;
- (NSData *_Nonnull)dataEncodedForSave;

@end
