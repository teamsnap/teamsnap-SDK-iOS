//
// Created by Jason Rahaim on 1/29/15.
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TSDKConveniences)

- (NSDate *_Nullable)dateFromRCF3339DateTimeString;
- (NSDate *_Nullable)dateFromJustDate;
- (NSString *_Nonnull)addClassNameToDescriptor:(NSString *_Nonnull)className;
- (NSString *_Nonnull)stripClassNameFromDescriptor:(NSString *_Nonnull)className;

- (NSString *_Nonnull)classNameToUnderscoredName;
- (NSString *_Nonnull)camelCaseToUnderscores;
- (NSString *_Nonnull)underscoresToMixedCase;
- (NSString *_Nonnull)underscoresToCamelCase;

- (BOOL)isSetter;

- (NSString *_Nullable)linkForGetProperty;
- (NSString *_Nullable)typeFromRel;

+(NSString *_Nonnull)GUID;

- (NSComparisonResult)compareTSDKObjectId:(NSString * _Nullable)compareId;

@end
