//
//  TSDKCollectionObject.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 1/17/14.
//  Copyright (c) 2014 TeamSnap. All rights reserved.
//

#import <objc/runtime.h>
#import "TSDKCollectionObject.h"
#import "TSDKCollectionJSON.h"
#import "NSString+TSDKConveniences.h"
#import "TSDKDataRequest.h"
#import "TSDKTeamSnap.h"
#import "TSDKRootLinks.h"
#import "TSDKProcessBulkObjectProtocol.h"

@implementation TSDKCollectionObject

static NSMutableDictionary *_templates;
static NSMutableDictionary *_commandDictionary;
static NSMutableDictionary *_classURLs;

+(NSDictionary *)templateForClass:(NSString *)className {
    return [_templates objectForKey:className];
}

+(NSDictionary *)template {
    return [self templateForClass:[self SDKType]];
}

+(void)setTemplate:(NSDictionary *)template {
    [self setTemplate:template forClass:[self SDKType]];
}

+(void)setTemplate:(NSDictionary *)template forClass:(NSString *)className {
    if (template) {
        [self.templates setObject:template forKey:className];
    } else {
        [_templates removeObjectForKey:className];
    }
}

+(NSMutableDictionary *)templates {
    if (!_templates) {
        _templates = [[NSMutableDictionary alloc] init];
    }
    return _templates;
}


+(NSDictionary *)commandDictionary {
    if (!_commandDictionary) {
        _commandDictionary = [[NSMutableDictionary alloc] init];
    }
    return _commandDictionary;
}

+(NSMutableDictionary *)commands {
    return [self commandsForClass:[self SDKType]];
}

+(TSDKCollectionCommand *)commandForKey:(NSString *)commandName {
    return [[self commands] objectForKey:commandName];
}

+(NSMutableDictionary *)commandsForClass:(NSString *)className {
    if (className) {
        NSMutableDictionary *commands = [[self commandDictionary] objectForKey:className];
        if (!commands) {
            commands = [[NSMutableDictionary alloc] init];
            [[self commandDictionary] setValue:commands forKey:className];
        }
        return commands;
    } else {
        return nil;
    }
}

+(TSDKCollectionCommand *)commandForClass:(NSString *)className forKey:(NSString *)commandName {
    return [[[self commandDictionary] objectForKey:className] objectForKey:commandName];
}

+(NSURL *)classURLForClass:(NSString *)class {
    return [[self classURLs] objectForKey:class];
}

+(NSURL *)classURL {
    return [self classURLForClass:[self SDKType]];
}

+(void)setClassURL:(NSURL *)URL forClass:(NSString *)class {
    [[self classURLs] setObject:URL forKey:class];
}


+(void)setClassURL:(NSURL *)URL {
    [self setClassURL:URL forClass:[self SDKType]];
}

+(NSMutableDictionary *)classURLs {
    if (!_classURLs) {
        _classURLs = [[NSMutableDictionary alloc] init];
    }
    return _classURLs;
}

+ (NSString *)SDKType {
    return nil;
}

+ (NSString *)SDKREL {
    if ([[self.SDKType substringFromIndex:[self.SDKType length]-1] isEqualToString:@"s"]) {
        return [NSString stringWithFormat:@"%@es", self.SDKType];
    }
    return [NSString stringWithFormat:@"%@s", self.SDKType];
}

+ (NSString *)completionBlockTypeName {
    return [NSString stringWithFormat:@"%@CompletionBlock",  NSStringFromClass(self)];
}

+ (NSString *)completionBlockArrayDescription {
    return [NSString stringWithFormat:@"typedef void (^%@)(BOOL success, BOOL complete, NSArray <%@ *> *%@, NSError *error);", [self completionBlockTypeName], NSStringFromClass(self), [self SDKREL]];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _collection = [[TSDKCollectionJSON alloc] init];
        _changedValues = [[NSMutableSet alloc] init];
        _logHeader = NO;
    }
    return self;
}

- (instancetype)initWithCollection:(TSDKCollectionJSON *)collection {
    self = [self init];
    if (self) {
        [self setCollection:collection];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    TSDKCollectionJSON *collection = [aDecoder decodeObjectForKey:@"collection"];
    self = [self initWithCollection:collection];
    return self;
}

static id propertyIMP(id self, SEL _cmd) {
    NSString *command = [[NSStringFromSelector(_cmd) camelCaseToUnderscores] stripClassNameFromDescriptor:NSStringFromClass([self class])];
    id value = [[[self collection] data] valueForKey:command];
    if ([value isEqual:[NSNull null]]) {
        return nil;
    } else {
        return value;
    }
}

static id datePropertyIMP(id self, SEL _cmd) {
    NSString *command = [NSStringFromSelector(_cmd) camelCaseToUnderscores];
    return [self getDate:command];
}

static id urlPropertyIMP(id self, SEL _cmd) {
    NSString *command = [NSStringFromSelector(_cmd) camelCaseToUnderscores];
    return [NSURL URLWithString:[self getString:command]];
}

static id linkPropertyIMP(id self, SEL _cmd) {
    NSString *command = [NSStringFromSelector(_cmd) camelCaseToUnderscores];
    if ([command rangeOfString:@"link_"].location == 0) {
        command = [command stringByReplacingCharactersInRange:NSMakeRange(0, [@"link_" length]) withString:@""];
    }
    return [self getLink:command];
}


static bool boolPropertyIMP(id self, SEL _cmd) {
    NSString *command = [NSStringFromSelector(_cmd) camelCaseToUnderscores];
    return [self getBool:command];
}

static long integerPropertyIMP(id self, SEL _cmd) {
    NSString *command = [NSStringFromSelector(_cmd) camelCaseToUnderscores];
    return [self getInteger:command];
}

// generic setter
static void setPropertyIMP(id self, SEL _cmd, id aValue) {
    
    id value = [aValue copy];
    NSMutableString *key = [NSStringFromSelector(_cmd) mutableCopy];
    
    // delete "set" and ":" and lowercase first letter
    [key deleteCharactersInRange:NSMakeRange(0, 3)];
    [key deleteCharactersInRange:NSMakeRange([key length] - 1, 1)];
    NSString *firstChar = [key substringToIndex:1];
    [key replaceCharactersInRange:NSMakeRange(0, 1) withString:[firstChar lowercaseString]];
    [self setString:value forKey:[[key camelCaseToUnderscores] stripClassNameFromDescriptor:NSStringFromClass([self class])]];
}

static void setDatePropertyIMP(id self, SEL _cmd, id aValue) {
    id value = [aValue copy];
    NSMutableString *key = [NSStringFromSelector(_cmd) mutableCopy];
    
    // delete "set" and ":" and lowercase first letter
    [key deleteCharactersInRange:NSMakeRange(0, 3)];
    [key deleteCharactersInRange:NSMakeRange([key length] - 1, 1)];
    NSString *firstChar = [key substringToIndex:1];
    [key replaceCharactersInRange:NSMakeRange(0, 1) withString:[firstChar lowercaseString]];
    
    [self setDate:value forKey:[key camelCaseToUnderscores]];
}

static void setURLPropertyIMP(id self, SEL _cmd, id aValue) {
    
    id value = [aValue copy];
    NSMutableString *key = [NSStringFromSelector(_cmd) mutableCopy];
    
    // delete "set" and ":" and lowercase first letter
    [key deleteCharactersInRange:NSMakeRange(0, 3)];
    [key deleteCharactersInRange:NSMakeRange([key length] - 1, 1)];
    NSString *firstChar = [key substringToIndex:1];
    [key replaceCharactersInRange:NSMakeRange(0, 1) withString:[firstChar lowercaseString]];
    
    [self setString:[(NSURL *)value absoluteString] forKey:[key camelCaseToUnderscores]];
}

static void setBoolPropertyIMP(id self, SEL _cmd, BOOL value) {
    NSMutableString *key = [NSStringFromSelector(_cmd) mutableCopy];
    
    // delete "set" and ":" and lowercase first letter
    [key deleteCharactersInRange:NSMakeRange(0, 3)];
    [key deleteCharactersInRange:NSMakeRange([key length] - 1, 1)];
    NSString *firstChar = [key substringToIndex:1];
    [key replaceCharactersInRange:NSMakeRange(0, 1) withString:[firstChar lowercaseString]];
    [self setBool:value forKey:[key camelCaseToUnderscores]];
}

static void setIntegerPropertyIMP(id self, SEL _cmd, NSInteger value) {
    NSMutableString *key = [NSStringFromSelector(_cmd) mutableCopy];
    
    // delete "set" and ":" and lowercase first letter
    [key deleteCharactersInRange:NSMakeRange(0, 3)];
    [key deleteCharactersInRange:NSMakeRange([key length] - 1, 1)];
    NSString *firstChar = [key substringToIndex:1];
    [key replaceCharactersInRange:NSMakeRange(0, 1) withString:[firstChar lowercaseString]];
    [self setInteger:value forKey:[key camelCaseToUnderscores]];
}

static void getArrayFromLinkIMP(id self, SEL _cmd, TSDKArrayCompletionBlock completion) {
    NSString *property = NSStringFromSelector(_cmd);
    NSString *linkPropertyName = [[property linkForGetProperty] camelCaseToUnderscores];
    
    if ([linkPropertyName rangeOfString:@"link_"].location == 0) {
        linkPropertyName = [linkPropertyName stringByReplacingCharactersInRange:NSMakeRange(0, [@"link_" length]) withString:@""];
    }
    
    NSURL *link = [self getLink:linkPropertyName];
    DLog(@"%@ %@ %@ - %@", [self class], NSStringFromSelector(_cmd), linkPropertyName, link);

    [self arrayFromLink:link WithCompletion:completion];
}

/*
Not tested:
static void getObjectFromLinkIMP(id self, SEL _cmd, TSDKCompletionBlock completion) {
    NSString *property = NSStringFromSelector(_cmd);
    NSString *linkPropertyName = [[property linkForGetProperty] camelCaseToUnderscores];
    
    if ([linkPropertyName rangeOfString:@"link_"].location == 0) {
        linkPropertyName = [linkPropertyName stringByReplacingCharactersInRange:NSMakeRange(0, [@"link_" length]) withString:@""];
    }
    
    NSURL *link = [self getLink:linkPropertyName];
    DLog(@"%@ - %@", linkPropertyName, link);
    
    [self objectFromLink:link WithCompletion:completion];
}
*/

static BOOL property_getTypeString( objc_property_t property, char *buffer ) {
    const char * attrs = property_getAttributes( property );
    if ( attrs == NULL )
        return NO;
    
    const char * e = strchr( attrs, ',' );
    if ( e == NULL )
        return NO;
    
    int len = (int)(e - attrs);
    memcpy( buffer, attrs, len );
    buffer[len] = '\0';
    
    return YES;
}

+ (void)dumpClassSelectorInfo {
    NSMutableString *output = [[NSMutableString alloc] init];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    [output appendFormat:@"\n%@", [self class]];
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        const char *propName = property_getName(property);
        if(propName) {
            //const char *propType = getPropertyType(property);
            char propType[256];
            if (!property_getTypeString(property, propType)) {
                continue;
            }
            NSString *propertyName = [NSString stringWithUTF8String:propName];
            NSString *propertyType = [NSString stringWithUTF8String:propType];
            [output appendFormat:@"\n* %@ (%@)", propertyName, propertyType];
        }
    }
    DLog(@"%@", output);
}

+ (BOOL)resolveInstanceMethod:(SEL)aSEL {
    //NSString *command = [NSStringFromSelector(aSEL) camelCaseToUnderscores];

    NSMutableString *property = [NSMutableString stringWithString:NSStringFromSelector(aSEL)];
    if ([property isSetter]) {
        [property deleteCharactersInRange:NSMakeRange(0, 3)];
        [property deleteCharactersInRange:NSMakeRange(property.length -1,1)];
        [property replaceCharactersInRange:NSMakeRange(0, 1) withString:[[property substringToIndex:1] lowercaseString]];
    }
    
    objc_property_t theProperty = class_getProperty(self, [property cStringUsingEncoding:[NSString defaultCStringEncoding]]);
    if (theProperty) {
        const char * propertyAttrs = property_getAttributes(theProperty);
        NSString *propertyType = [NSString stringWithFormat:@"%s" , propertyAttrs];
        
        NSString *selectorCommandString = NSStringFromSelector(aSEL);
        
        if ([selectorCommandString isSetter]) {
            if ([propertyType containsString:@"NSDate"]) {
                class_addMethod([self class], aSEL, (IMP)setDatePropertyIMP, "v@:@");
            } else if ([propertyType containsString:@"NSURL"]) {
                class_addMethod([self class], aSEL, (IMP)setURLPropertyIMP, "v@:@");
            } else if ([propertyType hasPrefix:@"TB,"]) {
                class_addMethod([self class], aSEL, (IMP)setBoolPropertyIMP, "v@:B");
            } else if ([propertyType hasPrefix:@"Tc,"]) {
                class_addMethod([self class], aSEL, (IMP)setBoolPropertyIMP, "v@:c");
            } else if ([propertyType hasPrefix:@"Tq,"]) {
                class_addMethod([self class], aSEL, (IMP)setIntegerPropertyIMP, "v@:q");
            } else if ([propertyType hasPrefix:@"Ti,"] || [propertyType hasPrefix:@"Ti,"]) {
                class_addMethod([self class], aSEL, (IMP)setIntegerPropertyIMP, "v@:i");
            } else {
                class_addMethod([self class], aSEL, (IMP)setPropertyIMP, "v@:@");
            }
            return YES;
        } if ([propertyType containsString:@"NSDate"]) {
            class_addMethod([self class], aSEL, (IMP)datePropertyIMP, "@@:");
            return YES;
        } if ([propertyType containsString:@"NSURL"]) {
            if ([property rangeOfString:@"link"].location ==  0) {
                class_addMethod([self class], aSEL, (IMP)linkPropertyIMP, "@@:");
            } else {
                class_addMethod([self class], aSEL, (IMP)urlPropertyIMP, "@@:");
            }
        } else if ([propertyType hasPrefix:@"TB,"]) {
            class_addMethod([self class], aSEL,(IMP)boolPropertyIMP, "B@:");
        } else if ([propertyType hasPrefix:@"Tc,"]) {
            class_addMethod([self class], aSEL,(IMP)boolPropertyIMP, "c@:");
        } else if ([propertyType hasPrefix:@"Tq,"]) {
            class_addMethod([self class], aSEL,(IMP)integerPropertyIMP, "q@:");
        } else if ([propertyType hasPrefix:@"Ti,"]) {
            class_addMethod([self class], aSEL,(IMP)integerPropertyIMP, "i@:");
        } else {
            class_addMethod([self class], aSEL,(IMP)propertyIMP, "@@:");
        }
        return YES;
    } else if ([property length]>15 && [[property substringFromIndex:[property length]-15] isEqualToString:@"WithCompletion:"]) {
        class_addMethod([self class], aSEL, (IMP)getArrayFromLinkIMP, "v@:@");
        return YES;
    } else {
        return NO;
    }
}

- (NSInteger)objectIdentifier {
    return [self getInteger:@"id"];
}

- (void)setObject:(NSObject *)value forKey:(NSString *)aKey {
    _collection.data[aKey] = value;
    [_changedValues addObject:aKey];
}

- (NSDictionary *)dataToSave {
    NSMutableArray *tempDataToSave = [[NSMutableArray alloc] init];
    
    if ([self isNewObject]) {
        NSArray *allKeys = [_collection.data allKeys];
        if ([[self class] template]) {
            for (NSString *key in [[self class] template]) {
                if(![key isEqualToString:@"type"] && _collection.data[key]) {
                    NSDictionary *itemDictionary = @{@"name" : key, @"value" : _collection.data[key]};
                    [tempDataToSave addObject:itemDictionary];
                }
            }
        } else {
            for (NSString *key in allKeys) {
                if (![key isEqualToString:@"id"]) {
                    NSDictionary *itemDictionary = @{@"name" : key, @"value" : _collection.data[key]};
                    [tempDataToSave addObject:itemDictionary];
                }
            }
        }
    } else {
        for (NSString *key in _changedValues) {
            NSDictionary *itemDictionary = @{@"name" : key, @"value" : _collection.data[key]};
            [tempDataToSave addObject:itemDictionary];
        }
    }
    NSDictionary *data = @{@"data" : tempDataToSave};
    return data;
}

- (NSString *)getString:(NSString *)key {
    if ([_collection.data[key] isEqual:[NSNull null]]) {
        return @"";
    }
    return _collection.data[key];
}

- (void)setString:(NSString *)value forKey:(NSString *)aKey {
    [self setObject:value forKey:aKey];
}

- (NSInteger)getInteger:(NSString *)key {
    if ([_collection.data[key] isEqual:[NSNull null]]) {
        return 0;
    }
    NSNumber *value = _collection.data[key];
    return value.integerValue;
}

- (void)setInteger:(NSInteger)value forKey:(NSString *)aKey {
    [self setObject:@(value) forKey:aKey];
}

- (NSDate *)getDate:(NSString *)key {
    if ([_collection.data[key] isEqual:[NSNull null]]) {
        return nil;
    }
    NSString *dateString = self.collection.data[key];
    NSDate *date;
    if ([dateString length]>10) {
        date = [dateString dateFromRCF3339DateTimeString];
    } else {
        date = [dateString dateFromJustDate];
    }
    return date;
}

- (void)setDate:(NSDate *)value forKey:(NSString *)aKey {
    [self setObject:value forKey:aKey];
}

- (BOOL)getBool:(NSString *)aKey {
    if ([_collection.data[aKey] isEqual:[NSNull null]]) {
        return false;
    }
    return [(NSNumber *) _collection.data[aKey] boolValue];
}

- (void)setBool:(BOOL)value forKey:(NSString *)aKey {
    [self setObject:@(value) forKey:aKey];
}

- (CGFloat)getFloat:(NSString *)aKey {
    if ([_collection.data[aKey] isEqual:[NSNull null]]) {
        return 0.0f;
    }
    return [_collection.data[aKey] floatValue];
}

- (void)setFloat:(CGFloat)value forKey:(NSString *)aKey {
    [self setObject:@(value) forKey:aKey];
}

- (NSURL *)getLink:(NSString *)aKey {
    if ([_collection.links[aKey] isEqual:[NSNull null]]) {
        return nil;
    }
    return [NSURL URLWithString:_collection.links[aKey]];
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:_collection forKey:@"collection"];
}

- (BOOL)isNewObject {
    return ([_collection.data[@"id"] integerValue] <=0);
}

- (void)saveWithCompletion:(TSDKCompletionBlock)completionBlock {
    NSDictionary *dataToSave = [self dataToSave];
    if ([self isNewObject]) {
        NSDictionary *postObject = @{@"template": dataToSave};
        NSURL *URL;
        if ([[self class] classURL]) {
            URL = [[self class] classURL];
        } else {
            URL = [NSURL URLWithString:[[[[[TSDKTeamSnap sharedInstance] rootLinks] collection] links] objectForKey:[[self class] SDKREL]]];
        }
        __typeof__(self) __weak weakSelf = self;
        
        [TSDKDataRequest requestObjectsForPath:URL sendDataDictionary:postObject method:@"POST" withCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
            if (success && [objects.collection isKindOfClass:[NSArray class]] && ([(NSArray *)objects.collection count] == 1)) {
                [weakSelf setCollection:[(NSArray *)objects.collection objectAtIndex:0]];
            }
            if (completionBlock) {
                completionBlock(success, complete, objects, error);
            }
        }];
    } else {
        NSDictionary *postObject = @{@"template": dataToSave};

        [TSDKDataRequest requestObjectsForPath:self.collection.href sendDataDictionary:postObject method:@"PATCH" withCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
            if (completionBlock) {
                completionBlock(success, complete, objects, error);
            }
        }];
    }
}

- (void)arrayFromLink:(NSURL *)link WithCompletion:(TSDKArrayCompletionBlock) completion {
    [TSDKDataRequest requestObjectsForPath:link withCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
        if (completion) {
            if ([[objects collection] isKindOfClass:[NSArray class]]) {
                NSArray *result = [TSDKObjectsRequest SDKObjectsFromCollection:objects];
                if ([self conformsToProtocol:@protocol(TSDKProcessBulkObjectProtocol)]) {
                    for (TSDKCollectionObject *object in result) {
                        [(id<TSDKProcessBulkObjectProtocol>)self processBulkLoadedObject:object];
                    }
                }
                completion(success, complete, result, error);
            } else {
                completion(success, complete, nil, error);
            }
//            void (^completionBlock)() = (__bridge typeof TSDKArrayCompletionBlock) completion;
//            ((id(^)())(completion(success, complete, rosters, error));
        }
    }];


}

- (void)refreshDataWithCompletion:(TSDKArrayCompletionBlock)completion {
    [TSDKDataRequest requestObjectsForPath:self.collection.href withCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
        [self setCollection:[objects.collection objectAtIndex:0]];
        if (completion) {
            completion(YES, YES, @[self], nil);
        } else {
        }
    }];
}

/*
 Not Tested
- (void)objectFromLink:(NSURL *)link WithCompletion:(TSDKCompletionBlock) completion {
    [TSDKDataRequest requestObjectsForPath:link withCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
        if (completion) {
            if ([objects collection]) {
                completion(success, complete, [objects collection], error);
            } else {
                completion(success, complete, nil, error);
            }
            //            void (^completionBlock)() = (__bridge typeof TSDKArrayCompletionBlock) completion;
            //            ((id(^)())(completion(success, complete, rosters, error));
        }
    }];
    
    
}
 */


- (BOOL)writeToFileURL:(NSURL *)fileURL {
    NSData *collectionData = [self.collection dataEncodedForSave];
    NSError *error;
    [collectionData writeToURL:fileURL options:NSDataWritingAtomic error:&error];
    if (error) {
        return NO;
    } else {
        return YES;
    }
}

+ (instancetype)collectionObjectFromDataInFileURL:(NSURL *)fileURL {
    TSDKCollectionJSON *collection = [TSDKCollectionJSON collectionJSONForEncodedData:[NSData dataWithContentsOfURL:fileURL]];
    TSDKCollectionObject *collectionObject;
    if (collection) {
        collectionObject = [[self.class alloc] initWithCollection:collection];
    }
    
    return collectionObject;
}

@end
