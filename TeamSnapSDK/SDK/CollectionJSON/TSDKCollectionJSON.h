//
//  TSDKCollectionJSON.h
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 1/10/14.
//  Copyright (c) 2014 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSDKCollectionJSON : NSObject <NSCoding>

@property (nonatomic, strong) NSString *href;
@property (nonatomic, strong) NSString *version;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSMutableDictionary *links;
@property (nonatomic, strong) NSMutableDictionary *data;
@property (nonatomic, strong) NSMutableDictionary *commands;
@property (nonatomic, strong) TSDKCollectionJSON *collectionTemplate;
@property (nonatomic, strong) id collection;

- (instancetype)initWithCoder:(NSCoder *)aDecoder;
- (instancetype)initWithJSON:(NSDictionary *)JSON;
+ (instancetype)collectionJSONForEncodedData:(NSData *)objectData;
- (NSString *)getObjectiveCHeaderSkeleton;
- (NSData *)dataEncodedForSave;

@end