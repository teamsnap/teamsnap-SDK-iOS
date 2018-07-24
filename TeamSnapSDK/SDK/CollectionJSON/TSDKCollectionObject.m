//
//  TSDKCollectionObject.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 1/17/14.
//  Copyright (c) 2014 TeamSnap. All rights reserved.
//

#import <objc/runtime.h>
#import "TSDKRequestConfiguration.h"
#import "TSDKCollectionObject.h"
#import "TSDKCollectionJSON.h"
#import "NSString+TSDKConveniences.h"
#import "NSDate+TSDKConveniences.h"
#import "TSDKDataRequest.h"
#import "TSDKTeamSnap.h"
#import "TSDKRootLinks.h"
#import "TSDKNotifications.h"
#import "TSDKLogging.h"

@interface TSDKCollectionObject()

@property (nonatomic, strong) NSMutableDictionary *cachedDatesLookup;
@property (nonatomic, strong) NSString *_objectIdentifier;

@end

@implementation TSDKCollectionObject

static NSMutableDictionary *_templates;
static NSMutableDictionary *_commandDictionary;
static NSMutableDictionary *_queryDictionary;
static NSMutableDictionary *_classURLs;

+ (void)initialize {
    // Explicitly not checking for subclasses here in order to synthesize dynamic property
    //  method implementations for ALL subclasses of TSDKCollectionObject
    [self synthesizePropertyImplementations];
}

+(NSDictionary *)templateForClass:(NSString *)className {
    @synchronized (self.templates) {
        return [self.templates objectForKey:className];
    }
}

- (NSMutableDictionary *)cachedDatesLookup {
    if (!_cachedDatesLookup) {
        _cachedDatesLookup = [[NSMutableDictionary alloc] init];
    }
    return _cachedDatesLookup;
}

+(NSDictionary *)template {
    return [self templateForClass:[self SDKType]];
}

+(void)setTemplate:(NSDictionary *)template {
    [self setTemplate:template forClass:[self SDKType]];
}

+(void)setTemplate:(NSDictionary *)template forClass:(NSString *)className {
    NSDictionary *templateCopy = [template copy];

    @synchronized (self.templates) {
        if (templateCopy) {
            [self.templates setObject:templateCopy forKey:className];
        } else {
            [self.templates removeObjectForKey:className];
        }
    }
}

+(NSMutableDictionary *)templates {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _templates = [NSMutableDictionary dictionary];
    });
    return _templates;
}


+(NSMutableDictionary *)commandDictionary {
    if (!_commandDictionary) {
        _commandDictionary = [[NSMutableDictionary alloc] init];
    }
    return _commandDictionary;
}

+(NSMutableDictionary *)commands {
    return [self commandsForClass:[self SDKType]];
}

+(TSDKCollectionCommand *)commandForKey:(NSString *)commandName {
    return [[[self commands] objectForKey:commandName] copy];
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

+(NSMutableDictionary *)queryDictionary {
    if (!_queryDictionary) {
        _queryDictionary = [[NSMutableDictionary alloc] init];
    }
    return _queryDictionary;
}

+(NSMutableDictionary *)queries {
    return [self queriesForClass:[self SDKType]];
}

+(TSDKCollectionQuery *)queryForKey:(NSString *)queryName {
    return [[self queries] objectForKey:queryName];
}

+(NSMutableDictionary *)queriesForClass:(NSString *)className {
    if (className) {
        NSMutableDictionary *queries = [[self queryDictionary] objectForKey:className];
        if (!queries) {
            queries = [[NSMutableDictionary alloc] init];
            [[self queryDictionary] setValue:queries forKey:className];
        }
        return queries;
    } else {
        return nil;
    }
}

+(TSDKCollectionQuery *)queryForClass:(NSString *)className forKey:(NSString *)queryName {
    return [[[self queryDictionary] objectForKey:className] objectForKey:queryName];
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
    return [NSString stringWithFormat:@"%@ArrayCompletionBlock",  NSStringFromClass(self)];
}

+ (NSString *)completionBlockArrayDescription {
    return [NSString stringWithFormat:@"typedef void (^%@)(BOOL success, BOOL complete, NSArray <%@ *> *%@, NSError *error);", [self completionBlockTypeName], NSStringFromClass(self), [self SDKREL]];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _collection = [[TSDKCollectionJSON alloc] init];
        _changedValues = [[NSMutableDictionary alloc] init];
        _logHeader = NO;
        _lastUpdate = nil;
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

+ (dispatch_queue_t)processingQueue {
    return dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0);
}

+ (id)objectWithObject:(TSDKCollectionObject *)originalObject {
    
    TSDKCollectionJSON *newCollection = [[TSDKCollectionJSON alloc] init];
    newCollection.data = [NSMutableDictionary dictionaryWithDictionary:originalObject.collection.data];
    newCollection.type = originalObject.collection.type;
    
    NSArray *allKeys = [[newCollection data] allKeys];
    for (NSString *key in allKeys) {
        BOOL deleteKey = NO;
        NSRange idFound = [key rangeOfString:@"_id"];
        if (idFound.location == key.length-3) {
            deleteKey = YES;
        } else if ([key isEqualToString:@"id"]) {
            deleteKey = YES;
        }
        
        if (deleteKey) {
            [[newCollection data] removeObjectForKey:key];
        }
    }
    
    __typeof__(originalObject) newObject = [[[originalObject class] alloc] initWithCollection:newCollection];
    
    return newObject;
}

- (void)setCollection:(TSDKCollectionJSON *)collection {
    self._objectIdentifier = nil;
    _collection = collection;
    _lastUpdate = [NSDate date];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    TSDKCollectionJSON *collection = [aDecoder decodeObjectForKey:@"collection"];
    // we currently only persist collection data and the last update date.
    self = [self initWithCollection:collection];
    self.lastUpdate = [aDecoder decodeObjectForKey:@"lastUpdate"];
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

static id objectIdentifierIMP(id self, SEL _cmd) {
    NSString *command = [NSStringFromSelector(_cmd) camelCaseToUnderscores];
    return [self objectIdentifierForKey:command];
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

static id decimalPropertyIMP(id self, SEL _cmd) {
    NSString *command = [NSStringFromSelector(_cmd) camelCaseToUnderscores];
    return [self getDecimal:command];
}

static BOOL boolPropertyIMP(id self, SEL _cmd) {
    NSString *command = [NSStringFromSelector(_cmd) camelCaseToUnderscores];
    return [self getBool:command];
}

static long integerPropertyIMP(id self, SEL _cmd) {
    NSString *command = [NSStringFromSelector(_cmd) camelCaseToUnderscores];
    return [self getInteger:command];
}

static CGFloat floatPropertyIMP(id self, SEL _cmd) {
    NSString *command = [NSStringFromSelector(_cmd) camelCaseToUnderscores];
    return [self getCGFloat:command];
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

static void setObjectIdentifierIMP(id self, SEL _cmd, id aValue) {
    id value = [aValue copy];
    NSMutableString *key = [NSStringFromSelector(_cmd) mutableCopy];
    
    // delete "set" and ":" and lowercase first letter
    [key deleteCharactersInRange:NSMakeRange(0, 3)];
    [key deleteCharactersInRange:NSMakeRange([key length] - 1, 1)];
    NSString *firstChar = [key substringToIndex:1];
    [key replaceCharactersInRange:NSMakeRange(0, 1) withString:[firstChar lowercaseString]];
    [self setObjectIdentifierForKey:[key camelCaseToUnderscores] value:[value description]];
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

static void setCGFloatPropertyIMP(id self, SEL _cmd, CGFloat value) {
    NSMutableString *key = [NSStringFromSelector(_cmd) mutableCopy];
    
    // delete "set" and ":" and lowercase first letter
    [key deleteCharactersInRange:NSMakeRange(0, 3)];
    [key deleteCharactersInRange:NSMakeRange([key length] - 1, 1)];
    NSString *firstChar = [key substringToIndex:1];
    [key replaceCharactersInRange:NSMakeRange(0, 1) withString:[firstChar lowercaseString]];
    [self setCGFloat:value forKey:[key camelCaseToUnderscores]];
}

static void getArrayFromLinkIMP(id self, SEL _cmd, TSDKArrayCompletionBlock completion) {
    NSString *property = NSStringFromSelector(_cmd);
    NSString *linkPropertyName = [[property linkForGetProperty] camelCaseToUnderscores];
    
    if ([linkPropertyName rangeOfString:@"link_"].location == 0) {
        linkPropertyName = [linkPropertyName stringByReplacingCharactersInRange:NSMakeRange(0, [@"link_" length]) withString:@""];
    }
    
    NSURL *link = [self getLink:linkPropertyName];
    
    [self arrayFromLink:link withConfiguration:[TSDKRequestConfiguration new] completion:completion];
}

static void getArrayFromLinkWithConfigurationIMP(id self, SEL _cmd, TSDKRequestConfiguration *configuration, TSDKArrayCompletionBlock completion) {
    NSString *property = NSStringFromSelector(_cmd);
    NSString *linkPropertyName = [[property linkForGetProperty] camelCaseToUnderscores];
    
    if ([linkPropertyName rangeOfString:@"link_"].location == 0) {
        linkPropertyName = [linkPropertyName stringByReplacingCharactersInRange:NSMakeRange(0, [@"link_" length]) withString:@""];
    }
    
    NSURL *link = [self getLink:linkPropertyName];
    
    [self arrayFromLink:link withConfiguration:configuration completion:completion];
}

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

// Want this separate from DLog. When we know this is reliable, we can optionally remove
//  these logging calls entirely.
#if (0 && DEBUG)
#define RuntimeLog(fmt, ...) NSLog((fmt), ##__VA_ARGS__);
#else
#define RuntimeLog(...)
#endif

static void addImplementationForSelector(objc_property_t prop, SEL selector, Class class) {
    if (selector != NULL) {
        if ([class resolveInstanceMethod:selector]) {
            RuntimeLog(@"✅ Successfully added custom implementation for property %@", NSStringFromSelector(selector));
        } else {
            RuntimeLog(@"❌ Failed to add custom implementation for property %@", NSStringFromSelector(selector));
        }
    }
}

+ (void)synthesizePropertyImplementations {
    RuntimeLog(@"Attempting property enumeration for %@", NSStringFromClass(self));
    
    unsigned int propCount = 0;
    objc_property_t *props = class_copyPropertyList(self, &propCount);
    
    if (propCount > 0) {
        
        RuntimeLog(@"Enumerating %i properties for %@", propCount, NSStringFromClass(self));
        
        for (unsigned int i = 0; i < propCount; i++) {
            
            objc_property_t prop = props[i];
            const char * name = property_getName(prop);
            NSString *propertyNameString = [NSString stringWithCString:name encoding:NSASCIIStringEncoding];
            
            const char *attr = property_getAttributes(prop);
            NSString *attributeString = [NSString stringWithCString:attr encoding:NSASCIIStringEncoding];
            
            RuntimeLog(@"Processing property with attributes: %@", attributeString);
            
            NSArray<NSString *> *attributeComponents = [attributeString componentsSeparatedByString:@","];
            
            // Only synthesize dynamic properties
            if ([attributeComponents containsObject:@"D"]) {
                if (strlen(name) > 0 && [attributeComponents containsObject:@"R"] == NO) {
                    
                    NSString *setterName = nil;
                    for (NSString *attribute in attributeComponents) {
                        if ([attribute hasPrefix:@"S"]) {
                            // Has a custom setter, extract setter
                            setterName = [attribute substringFromIndex:1];
                        }
                    }
                    
                    if (setterName == nil) {
                        // Readwrite, synthesize setter
                        // Construct setter
                        NSString *upperFirstCharString = [[NSString stringWithFormat:@"%c", name[0]] uppercaseString];
                        NSString *trimmedPropertyName = [propertyNameString substringFromIndex:1];
                        setterName = [NSString stringWithFormat:@"set%@%@:", upperFirstCharString, trimmedPropertyName];
                    }
                    
                    SEL setter = NSSelectorFromString(setterName);
                    if (setter != NULL) {
                        RuntimeLog(@"Attempting to add selector for setter: %@", NSStringFromSelector(setter));
                        addImplementationForSelector(prop, setter, self);
                    } else {
                        RuntimeLog(@"Failed to construct selector for setter: %@", setterName);
                    }
                }
                
                SEL getter = NSSelectorFromString(propertyNameString);
                if (getter != NULL) {
                    RuntimeLog(@"Attempting to add selector for getter: %@", NSStringFromSelector(getter));
                    addImplementationForSelector(prop, getter, self);
                } else {
                    RuntimeLog(@"Failed to construct selector for getter: %@", propertyNameString);
                }
            } else {
                RuntimeLog(@"Skipping non-dynamic property %s", name);
            }
        }
    } else {
        RuntimeLog(@"No properties found for %@", NSStringFromClass(self));
    }
    
    if (props != NULL) {
        free(props);
    }
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
            } else if ((property.length>=2) && [[property substringFromIndex:property.length-2] isEqualToString:@"Id"]) {
                class_addMethod([self class], aSEL, (IMP)setObjectIdentifierIMP, "@@:");
            } else if ([propertyType hasPrefix:@"TB,"]) {
                class_addMethod([self class], aSEL, (IMP)setBoolPropertyIMP, "v@:B");
            } else if ([propertyType hasPrefix:@"Tc,"]) {
                class_addMethod([self class], aSEL, (IMP)setBoolPropertyIMP, "v@:c");
            } else if ([propertyType hasPrefix:@"Tq,"]) {
                class_addMethod([self class], aSEL, (IMP)setIntegerPropertyIMP, "v@:q");
            } else if ([propertyType hasPrefix:@"Ti,"]) {
                class_addMethod([self class], aSEL, (IMP)setIntegerPropertyIMP, "v@:i");
            } else if ([propertyType hasPrefix:@"Td,"]) {
                class_addMethod([self class], aSEL, (IMP)setCGFloatPropertyIMP, "v@:d");
            } else if ([propertyType hasPrefix:@"Tf,"]) {
                class_addMethod([self class], aSEL, (IMP)setCGFloatPropertyIMP, "v@:f");
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
        } else if ((property.length>=2) && [[property substringFromIndex:property.length-2] isEqualToString:@"Id"]) {
            class_addMethod([self class], aSEL,(IMP)objectIdentifierIMP, "@@:");
        } else if ([propertyType hasPrefix:@"TB,"]) {
            class_addMethod([self class], aSEL,(IMP)boolPropertyIMP, "B@:");
        } else if ([propertyType hasPrefix:@"Tc,"]) {
            class_addMethod([self class], aSEL,(IMP)boolPropertyIMP, "c@:");
        } else if ([propertyType hasPrefix:@"Tq,"]) {
            class_addMethod([self class], aSEL,(IMP)integerPropertyIMP, "q@:");
        } else if ([propertyType hasPrefix:@"Ti,"]) {
            class_addMethod([self class], aSEL,(IMP)integerPropertyIMP, "i@:");
        } else if ([propertyType hasPrefix:@"Td,"]) {
            class_addMethod([self class], aSEL,(IMP)floatPropertyIMP, "d@:");
        } else if ([propertyType hasPrefix:@"Tf,"]) {
            class_addMethod([self class], aSEL,(IMP)floatPropertyIMP, "f@:");
        } else if ([propertyType containsString:@"NSDecimalNumber"]) {
            class_addMethod([self class], aSEL,(IMP)decimalPropertyIMP, "f@:");
        } else {
            class_addMethod([self class], aSEL,(IMP)propertyIMP, "@@:");
        }
        return YES;
    } else if ([property length]>15 && [[property substringFromIndex:[property length]-15] isEqualToString:@"WithCompletion:"]) {
        class_addMethod([self class], aSEL, (IMP)getArrayFromLinkIMP, "v@:@");
        return YES;
    } else if ([property length]>29 && [[property substringFromIndex:[property length]-29] isEqualToString:@"WithConfiguration:completion:"]) {
        class_addMethod([self class], aSEL, (IMP)getArrayFromLinkWithConfigurationIMP, "v@:@:@");
        return YES;
    } else {
        return NO;
    }
}

- (NSString * _Nonnull)objectIdentifier {
    if (self._objectIdentifier == nil) {
        // ObjectIdentifier could be a String or Int.
        self._objectIdentifier = [self.collection.data[@"id"] description];
        if ((self._objectIdentifier == nil) || [self._objectIdentifier isEqual:[NSNull null]]) {
            self._objectIdentifier = @"";
        }
    }
    return self._objectIdentifier;
}

- (NSString * _Nonnull)objectIdentifierForKey:(NSString *)key {

    NSObject *identifierObject = self.collection.data[key];
    if ([identifierObject isEqual:[NSNull null]]) {
        return nil;
    }
    return identifierObject.description;
}

- (void)setObjectIdentifierForKey:(NSString *_Nonnull)key value:(NSString *_Nullable)value {
    [self setObject:value forKey:key];
}

- (void)setObject:(NSObject *)value forKey:(NSString *)aKey {
    if (value) {
        if ([value isEqual:_collection.data[aKey]]) {
            return;
        }
    } else {
        if (!_collection.data[aKey] || [_collection.data[aKey] isEqual:[NSNull null]]) {
            return;
        }
    }
    if (![_changedValues objectForKey:aKey]) {
        if (_collection.data[aKey]) {
            [_changedValues setObject:_collection.data[aKey] forKey:aKey];
        } else {
            [_changedValues setObject:[NSNull null] forKey:aKey];
        }
    }
    if (value) {
        _collection.data[aKey] = value;
    } else {
        _collection.data[aKey] = [NSNull null];
    }
}

- (void)undoChanges {
    for (NSString *key in _changedValues) {
        self.collection.data[key] = _changedValues[key];
    }
    [_changedValues removeAllObjects];
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
                if (_collection.data[key] && ![key isEqualToString:@"id"]) {
                    NSDictionary *itemDictionary = @{@"name" : key, @"value" : _collection.data[key]};
                    [tempDataToSave addObject:itemDictionary];
                }
            }
        }
    } else {
        for (NSString *key in _changedValues) {
            if (_collection.data[key]) {
                NSDictionary *itemDictionary = @{@"name" : key, @"value" : _collection.data[key]};
                [tempDataToSave addObject:itemDictionary];
            }
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
    if ((!_collection.data[key]) || ([_collection.data[key] isEqual:[NSNull null]])) {
        return NSNotFound;
    }
    NSNumber *value = _collection.data[key];
    return value.integerValue;
}

- (void)setInteger:(NSInteger)value forKey:(NSString *)aKey {
    if (value == NSNotFound) {
        [self setObject:[NSNull null] forKey:aKey];
    } else {
        [self setObject:@(value) forKey:aKey];
    }
    
}

- (NSDate *)getDate:(NSString *)key {
    if ([_collection.data[key] isEqual:[NSNull null]]) {
        return nil;
    }
    NSString *dateString = self.collection.data[key];
    if (dateString.length == 0) {
        return nil;
    }
    
    NSDate *date = [self.cachedDatesLookup objectForKey:dateString];
    if (!date) {
        if ([dateString length]>10) {
            date = [dateString dateFromRCF3339DateTimeString];
        } else {
            date = [dateString dateFromJustDate];
        }
        if (date) {
            [self.cachedDatesLookup setObject:date forKey:dateString];
        } else {
            return nil;
        }
    }
    return date;
}

- (void)setDate:(NSDate *)value forKey:(NSString *)aKey {
    if (![[self getDate:aKey] isEqualToDate:value]) {
        NSString *dateString = [value RCF3339DateTimeString];
        [self setString:dateString forKey:aKey];
        if ([dateString length]) {
            [self.cachedDatesLookup setObject:value forKey:dateString];
        }
    }
}

- (NSDecimalNumber *)getDecimal:(NSString *)key {
    if ([_collection.data[key] isEqual:[NSNull null]]) {
        return nil;
    }
    return [NSDecimalNumber decimalNumberWithDecimal:[_collection.data[key] decimalValue]];
}

- (void)setDecimal:(NSDecimalNumber *)decimal forKey:(NSString *)key {
    [self setObject:decimal forKey:key];
}

- (BOOL)getBool:(NSString *)aKey {
    if ([_collection.data[aKey] isEqual:[NSNull null]]) {
        return NO;
    }
    return [(NSNumber *) _collection.data[aKey] boolValue];
}

- (void)setBool:(BOOL)value forKey:(NSString *)aKey {
    [self setObject:@(value) forKey:aKey];
}

- (CGFloat)getCGFloat:(NSString *)aKey {
    if ([_collection.data[aKey] isEqual:[NSNull null]]) {
        return 0.0f;
    }
    return [_collection.data[aKey] floatValue];
}

- (void)setCGFloat:(CGFloat)value forKey:(NSString *)aKey {
    [self setObject:@(value) forKey:aKey];
}

- (void)setArray:(NSArray <NSString *> *)value forKey:(NSString *)aKey {
    [self setObject:value forKey:aKey];
}

- (NSArray <NSString *> *)getArrayForKey:(NSString *)key {
    if ([_collection.data[key] isEqual:[NSNull null]] || [_collection.data[key] isKindOfClass:[NSArray class]] == NO) {
        return nil;
    }
    return _collection.data[key];
}

- (NSURL *)getLink:(NSString *)aKey {
    if ([_collection.links[aKey] isEqual:[NSNull null]]) {
        return nil;
    }
    return [NSURL URLWithString:_collection.links[aKey]];
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:_collection forKey:@"collection"];
    [coder encodeObject:_lastUpdate forKey:@"lastUpdate"];
}

- (BOOL)isNewObject {
    id rawIdentifier = self.collection.data[@"id"];
    
    if (rawIdentifier == nil ||
        [[rawIdentifier description] isEqualToString:@""] ||
        [rawIdentifier isEqual:[NSNull null]] ||
        [rawIdentifier integerValue] == 0) {
        return YES;
    }
    
    return NO;
}

- (NSURL *)urlForSave {
    NSURL *URL;
    if ([self isNewObject]) {
        if ([[self class] classURL]) {
            URL = [[self class] classURL];
        } else {
            URL = [NSURL URLWithString:[[[[[TSDKTeamSnap sharedInstance] rootLinks] collection] links] objectForKey:[[self class] SDKREL]]];
        }
        
    } else {
        URL = self.collection.href;
    }

    return URL;
}

- (void)saveWithCompletion:(TSDKSaveCompletionBlock)completion {
    [self saveWithURL:[self urlForSave] completion:completion];
}

- (void)saveWithCustomURLQuery:(NSArray <NSURLQueryItem *> *)queryItems completion:(TSDKSaveCompletionBlock)completion {
    NSURLComponents *fullySpecifiedURL = [NSURLComponents componentsWithURL:[self urlForSave] resolvingAgainstBaseURL:NO];
    NSMutableArray *allQueryItems = [[NSMutableArray alloc] init];
    [allQueryItems addObjectsFromArray:fullySpecifiedURL.queryItems];
    [allQueryItems addObjectsFromArray:queryItems];
    fullySpecifiedURL.queryItems = queryItems;
    [self saveWithURL:fullySpecifiedURL.URL completion:completion];
}

- (void)saveWithURL:(NSURL *)url completion:(TSDKSaveCompletionBlock)completion {
    NSDictionary *dataToSave = [self dataToSave];
    if ([self isNewObject]) {
        NSDictionary *postObject = @{@"template": dataToSave};
        __typeof__(self) __weak weakSelf = self;
        
        [TSDKDataRequest requestObjectsForPath:url sendDataDictionary:postObject method:@"POST" withConfiguration:[TSDKRequestConfiguration requestConfigurationWithForceReload:YES] completion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
            if (success) {
                [weakSelf.changedValues removeAllObjects];
                if ([objects.collection isKindOfClass:[NSArray class]]) {
                    NSArray *returnedCollections = (NSArray *)objects.collection;
                    if ([returnedCollections count]==1) {
                        [weakSelf setCollection:[returnedCollections objectAtIndex:0]];
                        [TSDKNotifications postNewObject:self];
                    } else {
                        NSArray *returnedObjects = [TSDKObjectsRequest SDKObjectsFromCollection:objects];
                        for (TSDKCollectionObject *object in returnedObjects) {
                            [TSDKNotifications postNewObject:object];
                        }
                    }
                }
            }
            if (completion) {
                completion(success, weakSelf, error);
            }
        }];
    } else {
        if (self.changedValues.count>0) {
            NSDictionary *postObject = @{@"template": dataToSave};
            __typeof__(self) __weak weakSelf = self;
            [TSDKDataRequest requestObjectsForPath:url sendDataDictionary:postObject method:@"PATCH" withConfiguration:[TSDKRequestConfiguration requestConfigurationWithForceReload:YES] completion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
                if (success) {
                    [weakSelf.changedValues removeAllObjects];
                    if ([objects.collection isKindOfClass:[NSArray class]]) {
                        NSArray *returnedCollections = (NSArray *)objects.collection;
                        if ([returnedCollections count]==1) {
                            [weakSelf setCollection:[returnedCollections firstObject]];
                            [TSDKNotifications postSavedObject:self];
                        } else {
                            NSArray *returnedObjects = [TSDKObjectsRequest SDKObjectsFromCollection:objects];
                            for (TSDKCollectionObject *object in returnedObjects) {
                                [TSDKNotifications postSavedObject:object];
                            }
                        }
                    }
                }
                if (completion) {
                    completion(success, weakSelf, error);
                }
            }];
        } else {
            if (completion) {
                completion(YES, self, nil);
            }
        }
    }
}

- (void)deleteWithCompletion:(TSDKSimpleCompletionBlock)completion {
    if (self.isNewObject == NO) {
        NSDictionary *dataToSave = [self dataToSave];
        NSDictionary *postObject = @{@"template": dataToSave};
        [TSDKDataRequest requestObjectsForPath:self.collection.href sendDataDictionary:postObject method:@"DELETE" withConfiguration:[TSDKRequestConfiguration requestConfigurationWithForceReload:YES] completion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
            if (success) {
                [TSDKNotifications postDeletedObject:self];
            }
            if (completion) {
                completion(success, error);
            }
        }];
    } else {
        if (completion) {
            completion(YES, nil);
        }
    }
}

+ (void)arrayFromFileLink:(NSURL *)link completion:(TSDKArrayCompletionBlock) completion {
    [TSDKDataRequest requestObjectsForPath:link searchParamaters:nil sendDataDictionary:nil method:@"GET" withConfiguration:[TSDKRequestConfiguration new] completion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
        dispatch_async([self processingQueue], ^{
            NSArray *result = nil;
            if (success) {
                if ([[objects collection] isKindOfClass:[NSArray class]]) {
                    result = [TSDKObjectsRequest SDKObjectsFromCollection:objects];
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        for (TSDKCollectionObject *object in result) {
                            [TSDKNotifications postRefreshedObject:object];
                        }
                    });
                }
            }
            if (result == nil) {
                result = [[NSArray alloc] init];
            } else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [TSDKNotifications postRefreshedObjectCollection:result];
                });
            }
            
            if (completion) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    completion(success, complete, result, error);
                });
            }
        });
    }];
}

- (void)arrayFromLink:(NSURL *)link searchParams:(NSDictionary <NSString *, id> *)searchParams withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock) completion {
    [TSDKCollectionObject arrayFromLink:link searchParams:searchParams withConfiguration:configuration completion:completion];
}

+ (void)arrayFromLink:(NSURL *)link searchParams:(NSDictionary <NSString *, id> *)searchParams withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock) completion {
    [TSDKDataRequest requestObjectsForPath:link searchParamaters:searchParams sendDataDictionary:nil method:@"GET" withConfiguration:configuration completion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
        dispatch_async([TSDKCollectionObject processingQueue], ^{
            
            NSArray *result = nil;
            if (success) {
                if ([[objects collection] isKindOfClass:[NSArray class]]) {
                    result = [TSDKObjectsRequest SDKObjectsFromCollection:objects];
                    for (TSDKCollectionObject *object in result) {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [TSDKNotifications postRefreshedObject:object];
                        });
                    }
                }
            }
            
            if (result == nil) {
                result = [[NSArray alloc] init];
            } else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [TSDKNotifications postRefreshedObjectCollection:result];
                });
            }
            if (completion) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    completion(success, complete, result, error);
                });
            }
        });
    }];
}

- (void)arrayFromLink:(NSURL *)link withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKArrayCompletionBlock) completion {
    [self arrayFromLink:link searchParams:nil withConfiguration:configuration completion:completion];
}

- (void)refreshDataWithCompletion:(TSDKArrayCompletionBlock)completion {
    [TSDKDataRequest requestObjectsForPath:self.collection.href withConfiguration:[TSDKRequestConfiguration requestConfigurationWithForceReload:YES] completion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
        if (success) {
            [self setCollection:[objects.collection objectAtIndex:0]];
            [TSDKNotifications postRefreshedObject:self];
        }
        if (completion) {
            completion(success, complete, @[self], error);
        }
    }];
}

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

#pragma mark - NSObject
- (BOOL)isEqualToCollectionObject:(TSDKCollectionObject *)collectionObject {
    if (!collectionObject) {
        return NO;
    }
    return [self.objectIdentifier isEqualToString:collectionObject.objectIdentifier];
}


- (BOOL)isEqual:(id)object {
    if (self == object) {
        return YES;
    }
    
    if (![object isKindOfClass:[self class]]) {
        return NO;
    }
    
    return [self isEqualToCollectionObject:(TSDKCollectionObject *)object];
}

- (NSUInteger)hash {
    return self.objectIdentifier.hash;
}

#pragma mark - TSDKPersistenceFilePath

+ (NSURL * _Nullable)persistenceFilePathWithParentObject:(TSDKCollectionObject * _Nonnull)parentObject {
    NSString *parentObjectPathComponent = [NSString stringWithFormat:@"%@-%@", [parentObject.class SDKREL], [parentObject objectIdentifier]];
    return [[[self persistenceBaseFilePath] URLByAppendingPathComponent:parentObjectPathComponent] URLByAppendingPathComponent:[self SDKType]];
    
}

- (instancetype)copyWithZone:(nullable NSZone *)zone {
    id copy = [[[self class] allocWithZone:zone] init];
    
    if (copy) {
        [copy setCollection:[[self collection] copy]];
    }
    
    return copy;
}

+ (NSURL * _Nullable)persistenceBaseFilePath {
    return [[TSDKTeamSnap sharedInstance] cachePath];
}

@end
