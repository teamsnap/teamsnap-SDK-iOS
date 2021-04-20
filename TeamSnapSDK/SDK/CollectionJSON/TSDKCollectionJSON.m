//
//  TSDKCollectionJSON.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 1/10/14.
//  Copyright (c) 2014 TeamSnap. All rights reserved.
//

#import "TSDKCollectionJSON.h"
#import <TeamSnapSDK/TSDKCompletionBlockTypes.h>
#import "NSDictionary+TSDKCollectionJSON.h"
#import "TSDKCollectionQuery.h"
#import "TSDKCollectionCommand.h"
#import "NSString+TSDKConveniences.h"
#import "TSDKCollectionObject.h"
#import "TSDKLogging.h"

@interface TSDKCollectionJSON()

@end

@implementation TSDKCollectionJSON


- (instancetype)init {
    self = [super init];
    if (self) {
        _href = nil;
        _version = nil;
        _rel = nil;
        _links = [[NSDictionary alloc] init];
        _data = [[NSMutableDictionary alloc] init];
        _commands = [[NSDictionary alloc] init];
        _queries = [[NSDictionary alloc] init];
        _collection = nil;
        _errorCode = NSNotFound;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [self init];
    if (self) {
        _href = [aDecoder decodeObjectOfClass:[NSURL class] forKey:@"href"];
        _rel = [aDecoder decodeObjectOfClass:[NSString class] forKey:@"rel"];
        _type = [aDecoder decodeObjectOfClass:[NSString class] forKey:@"type"];
        _version = [aDecoder decodeObjectOfClass:[NSString class] forKey:@"version"];
        _links = [aDecoder decodeObjectOfClass:[NSDictionary class] forKey:@"links"];

        NSSet *validDataClasses = [NSSet setWithArray:@[
            [NSMutableDictionary class],
            [NSArray class],
            [NSNull class],
        ]];
        _data = [aDecoder decodeObjectOfClasses:validDataClasses forKey:@"data"];
        NSSet *validCollectionJSONClasses = [NSSet setWithArray:@[
            [TSDKCollectionJSON class],
            [NSURL class],
            [NSString class],
            [NSDictionary class],
            [NSMutableArray class],
            [NSMutableDictionary class],
            [NSNull class],
        ]];
        _collection = [aDecoder decodeObjectOfClasses:validCollectionJSONClasses
                                               forKey:@"collection"];
        _commands = [aDecoder decodeObjectOfClass:[NSDictionary class] forKey:@"commands"];
        _queries = [aDecoder decodeObjectOfClass:[NSDictionary class] forKey:@"queries"];
    }
    return self;
}

- (id)copyWithZone:(nullable NSZone *)zone {
    TSDKCollectionJSON *copy = [[[self class] allocWithZone:zone] init];
    
    if (copy) {
        copy.href = [self.href copy];
        copy.rel = [self.rel copy];
        copy.type = [self.type copy];
        copy.version = [self.version copy];
        copy.links = [self.links copy];
        copy.data = [self.data mutableCopy];
        copy.collection = [self.collection mutableCopy];
        copy.commands = [self.commands copy];
        copy.queries = [self.queries copy];
    }
    
    return copy;
}


-(instancetype)initWithJSON:(NSDictionary *)JSON {
    self = [self init];
    if (self) {
        [self parseJSON:[JSON objectForKey:@"collection"]];
    }
    return self;
    
}

+ (BOOL)supportsSecureCoding {
    return YES;
}

- (NSData *)dataEncodedForSave {
    if (@available(iOS 11, *)) {
        return [NSKeyedArchiver archivedDataWithRootObject:self
                                     requiringSecureCoding:YES
                                                     error:nil];
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        return [NSKeyedArchiver archivedDataWithRootObject:self];
#pragma clang diagnostic pop
    }
}

+ (instancetype)collectionJSONForEncodedData:(NSData *)objectData {
    if (@available(iOS 11, *)) {
        return [NSKeyedUnarchiver unarchivedObjectOfClass:[TSDKCollectionJSON class]
                                                 fromData:objectData
                                                    error:nil];
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        return [NSKeyedUnarchiver unarchiveObjectWithData:objectData];
#pragma clang diagnostic pop
    }
}

-(void)parseJSON:(NSDictionary *)collection {
    
    self.version = [collection objectForKey:@"version"];
    if (![[collection objectForKey:@"href"] isEqual:[NSNull null]]) {
        self.href = [NSURL URLWithString:[collection objectForKey:@"href"]];
    }
    
    NSArray *data;
    if ([[collection objectForKey:@"data"] isKindOfClass:[NSArray class]]) {
        data = [NSArray arrayWithArray:[collection objectForKey:@"data"]];
    } else if (![collection objectForKey:@"data"]) {
    } else if ([[collection objectForKey:@"data"] isEqual:[NSNull null]]) {
    }
    for (NSDictionary *datum in data) {
        // API Is now providing Types for all objects. This will be useful to the SDK miving forward
        //NSString *dataType = [data objectForKey:@"type"];
        if ([datum objectForKey:@"array"]) {
            [self.data setObject:[datum objectForKey:@"array"] forKey:[datum objectForKey:@"name"]];
        } else if ([datum objectForKey:@"value"]) {
            [self.data setObject:[datum objectForKey:@"value"] forKey:[datum objectForKey:@"name"]];
        }
    }
    
    NSArray *links = [NSArray arrayWithArray:[collection objectForKey:@"links"]];
    NSMutableDictionary *tempLinks = [[NSMutableDictionary alloc] init];
    
    for (NSDictionary *link in links) {
        [tempLinks setObject:[link objectForKey:@"href"] forKey:[link objectForKey:@"rel"]];
    }
    self.links = [tempLinks copy];
    
    if ([self.data objectForKey:@"type"]) {
        self.type = [self.data objectForKey:@"type"];
    }
    
    if ([collection objectForKey:@"rel"]) {
        self.rel = [collection objectForKey:@"rel"];
    }
    
    id items = [collection objectForKey:@"items"];
    if (!items) {

    } else if ([items isKindOfClass:[NSArray class]]) {
        _collection = [[NSMutableArray alloc] init];
        for (id item in items) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                TSDKCollectionJSON *subCollection = [[TSDKCollectionJSON alloc] init];
                [subCollection parseJSON: (NSDictionary *)item];
                [_collection addObject:subCollection];
            }
        }
    }
    if ([collection objectForKey:@"template"]) {
        TSDKCollectionJSON *template = [[TSDKCollectionJSON alloc] init];
        [template parseJSON:[collection objectForKey:@"template"]];
        template.href = self.href;
        
        TSDKCollectionJSON* collectionJSON = [_collection firstObject];
        if (collectionJSON && [collectionJSON isKindOfClass:[TSDKCollectionJSON class]] && [collectionJSON type] && ![TSDKCollectionObject templateForClass:[collectionJSON type]]) {
            [TSDKCollectionObject setTemplate:template.data forClass:[collectionJSON type]];
        }
    }
    NSMutableDictionary *commandsTempDictionary = [[NSMutableDictionary alloc] init];
    if ([collection objectForKey:@"commands"]) {
        for (NSDictionary *commandDictionary in [collection objectForKey:@"commands"]) {
            TSDKCollectionCommand *command = [[TSDKCollectionCommand alloc] initWithJSONDict:commandDictionary];
            [commandsTempDictionary setObject:command forKey:command.rel];
        }
    }
    self.commands = [commandsTempDictionary copy];
    
    NSMutableDictionary *queriesTempDictionary = [[NSMutableDictionary alloc] init];
    if ([collection objectForKey:@"queries"]) {
        for (NSDictionary *queryDictionary in [collection objectForKey:@"queries"]) {
            TSDKCollectionQuery *query = [[TSDKCollectionQuery alloc] initWithJSONDict:queryDictionary];
            [queriesTempDictionary setObject:query forKey:query.rel];
        }
    }
    self.queries = [queriesTempDictionary copy];
    
    if ([collection objectForKey:@"error"] && [[collection objectForKey:@"error"] isKindOfClass:[NSDictionary class]]) {
        NSDictionary *errorDictionary = [collection objectForKey:@"error"];
        if ([errorDictionary objectForKey:@"title"] && [[errorDictionary objectForKey:@"title"] isKindOfClass:[NSString class]]) {
            _errorTitle = [errorDictionary objectForKey:@"title"];
        }
        if ([errorDictionary objectForKey:@"message"] && [[errorDictionary objectForKey:@"message"] isKindOfClass:[NSString class]]) {
            _errorMessage = [errorDictionary objectForKey:@"message"];
        }
        if ([errorDictionary objectForKey:@"code"] && [[errorDictionary objectForKey:@"code"] isKindOfClass:[NSString class]]) {
            _errorCode = [[errorDictionary objectForKey:@"code"] integerValue];
        }
    }
}

- (NSString *)getObjectiveCHeaderSkeleton {
    NSMutableString *mutableResult = [[NSMutableString alloc] init];
    NSString *objectType = self.type;
    if (!objectType && self.rel) {
        self.type = self.rel;
    }
    
    [mutableResult appendString:@"// Copyright (c) 2015 TeamSnap. All rights reserved.\n"];
    [mutableResult appendString:@"//\n"];
    [mutableResult appendString:@"\n"];
    [mutableResult appendString:@"#import <Foundation/Foundation.h>\n"];
    [mutableResult appendString:@"#import \"TSDKCollectionObject.h\"\n"];
    [mutableResult appendString:@"#import \"TSDKObjectsRequest.h\"\n"];
    [mutableResult appendString:@"\n"];
    
    NSString *className = [NSString stringWithFormat:@"TSDK%@", [self.type underscoresToMixedCase]];
    [mutableResult appendString:[NSString stringWithFormat:@"@interface %@ : TSDKCollectionObject\n\n", className]];
    NSMutableArray *dynamicProperties = [[NSMutableArray alloc] init];
    
    for (NSString *key in self.data) {
        if (([key isEqualToString:@"id"] == NO) && ([key isEqualToString:@"type"] == NO))  {
            NSString *camelCaseKey = [[key addClassNameToDescriptor:className] underscoresToCamelCase];
            [dynamicProperties addObject:camelCaseKey];
            
            id value = [self.data objectForKey:key];
            if ([key rangeOfString:@"_id"].location == key.length-3) {
                [mutableResult appendString:[NSString stringWithFormat:@"@property (nonatomic, strong, nullable) NSString * %@; //Example: %@ \n", camelCaseKey, value]];
            } else if (([key rangeOfString:@"is_"].location == 0) || ([key rangeOfString:@"has_"].location == 0) || ([key rangeOfString:@"show_"].location == 0) || ([key containsString:@"_show_tab"])) {
                [mutableResult appendString:[NSString stringWithFormat:@"@property (nonatomic, assign) BOOL %@; //Example: %@ \n",camelCaseKey, value]];
            } else if ([key rangeOfString:@"_at"].location == key.length-3) {
                [mutableResult appendString:[NSString stringWithFormat:@"@property (nonatomic, strong, nullable) NSDate * %@; //Example: %@ \n", camelCaseKey, value]];
            } else if ([value isKindOfClass:[NSArray class]]) {
                [mutableResult appendString:[NSString stringWithFormat:@"@property (nonatomic, strong, nullable) NSArray * %@;\n",camelCaseKey]];
            } else if ([value isKindOfClass:[NSNumber class]]) {
                [mutableResult appendString:[NSString stringWithFormat:@"@property (nonatomic, assign) NSInteger %@; //Example: %@ \n",camelCaseKey, value]];
            } else if ([value isKindOfClass:[NSNull class]]) {
                [mutableResult appendString:[NSString stringWithFormat:@"@property (nonatomic, strong, nullable) NSString * %@; //Example: %@ \n", camelCaseKey, @"**NULL**"]];
            } else if ([(NSString *)value dateFromRCF3339DateTimeString]) {
                [mutableResult appendString:[NSString stringWithFormat:@"@property (nonatomic, strong, nullable) NSDate * %@; //Example: %@ \n", camelCaseKey, value]];
            } else {
                [mutableResult appendString:[NSString stringWithFormat:@"@property (nonatomic, strong, nullable) NSString * %@; //Example: %@ \n", camelCaseKey, value]];
            }
        }
    }
    
    NSMutableString *linkGettersString = [[NSMutableString alloc] init];
    
    for (NSString *key in self.links) {
        NSString *linkKey = [NSString stringWithFormat:@"link_%@",key];
        NSString *camelCaseKey = [linkKey underscoresToCamelCase];
        NSString *getKey = [NSString stringWithFormat:@"get_%@",key];
        
        [dynamicProperties addObject:camelCaseKey];
        [mutableResult appendString:[NSString stringWithFormat:@"@property (nonatomic, strong, nullable) NSURL * %@;\n", camelCaseKey]];
        
        NSString *typeString = [TSDKObjectsRequest typeForRel:key];
        if (!typeString) {
            typeString = key;
        }
        
        NSString *completionBlockName = [NSString stringWithFormat:@"TSDK%@ArrayCompletionBlock", [typeString underscoresToMixedCase]];
        if ([[TSDKObjectsRequest knownCompletionTypes] indexOfObject:completionBlockName] == NSNotFound) {
            completionBlockName = @"TSDKArrayCompletionBlock";
        }
        
        [linkGettersString appendFormat:@"-(void)%@WithConfiguration:(TSDKRequestConfiguration *_Nullable)configuration completion:(%@ _Nonnull)completion;\n", [getKey underscoresToCamelCase], completionBlockName];
    }
    
    NSString *actionsString = [TSDKCollectionJSON getObjectiveCHeaderForCommandsForTypeName:self.type];

    NSMutableString *queryString = [[NSMutableString alloc] init];
    for (NSString *key in [TSDKCollectionObject queriesForClass:self.type]) {
        NSString *queryKey = [NSString stringWithFormat:@"query_%@", key];
        NSString *camelCaseKey = [queryKey underscoresToCamelCase];
        TSDKCollectionQuery *queryDictionary = [TSDKCollectionObject queryForClass:self.type forKey:key];
        
        NSMutableString *paramaters = [[NSMutableString alloc] init];
        for (NSString *key in queryDictionary.data) {
            if (paramaters.length == 0) {
                [paramaters appendFormat:@"%@:(NSString *_Nonnull)%@ ", [[key underscoresToCamelCase] capitalizedString], [key underscoresToCamelCase]];
            } else {
                [paramaters appendFormat:@"%@:(NSString *_Nonnull)%@ ", [key underscoresToCamelCase], [key underscoresToCamelCase]];
            }
        }
        
        if (queryDictionary.prompt.length>0) {
            [queryString appendFormat:@"//%@\n", queryDictionary.prompt];
        }
        
        [queryString appendFormat:@"//+(void)%@%@WithCompletion:(TSDKCompletionBlock _Nullable)completion;\n\n", camelCaseKey, paramaters];
    }

    
    
    NSMutableString *dynamicString = [NSMutableString stringWithString:@"@dynamic "];
    NSString *commaSeperated = [[dynamicProperties valueForKey:@"description"] componentsJoinedByString:@", "];
    [dynamicString appendString:commaSeperated];
    [dynamicString appendString:@";"];
    
    NSString *SDKName = [NSString stringWithFormat:@"+ (NSString *)SDKType {\n  return @\"%@\";\n}\n", self.type];
    
    [mutableResult appendFormat:@"\n\n%@", actionsString];

    [mutableResult appendFormat:@"\n\n%@", queryString];
    
    [mutableResult appendString:@"\n\n@end\n\n"];
    [mutableResult appendString:[NSString stringWithFormat:@"@interface %@ (ForwardedMethods)\n\n", className]];

    [mutableResult appendFormat:@"%@\n", linkGettersString];
    [mutableResult appendString:@"\n@end\n\n"];
    
    [mutableResult appendFormat:@"\n\n/*\n%@\n\n%@\n*/", dynamicString, SDKName];
    
    return [NSString stringWithString:mutableResult];
}

- (void)printObjectiveCHeaderSkeleton {
    DLog(@"%@", [self getObjectiveCHeaderSkeleton]);
}

+ (NSString *_Nonnull)getObjectiveCHeaderForCommandsForTypeName:(NSString *_Nonnull)typeName {
    NSMutableString *actionsString = [[NSMutableString alloc] init];
    for (NSString *key in [TSDKCollectionObject commandsForClass:typeName]) {
        NSString *commandKey = [NSString stringWithFormat:@"action_%@", key];
        NSString *camelCaseKey = [commandKey underscoresToCamelCase];
        TSDKCollectionCommand *commandDictionary = [TSDKCollectionObject commandForClass:typeName forKey:key];
        
        NSMutableString *paramaters = [[NSMutableString alloc] init];
        for (NSString *key in commandDictionary.data) {
            if (paramaters.length == 0) {
                [paramaters appendFormat:@"%@:(NSString *_Nonnull)%@ ", [[key underscoresToCamelCase] capitalizedString], [key underscoresToCamelCase]];
            } else {
                [paramaters appendFormat:@"%@:(NSString *_Nonnull)%@ ", [key underscoresToCamelCase], [key underscoresToCamelCase]];
            }
        }
        
        if (commandDictionary.prompt.length>0) {
            [actionsString appendFormat:@"//%@\n", commandDictionary.prompt];
        }
        
        [actionsString appendFormat:@"//+(void)%@%@WithCompletion:(TSDKCompletionBlock _Nullable)completion;\n\n", camelCaseKey, paramaters];
    }
    return [NSString stringWithString:actionsString];
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:_href forKey:@"href"];
    [coder encodeObject:_rel forKey:@"rel"];
    [coder encodeObject:_type forKey:@"type"];
    [coder encodeObject:_version forKey:@"version"];
    [coder encodeObject:_links forKey:@"links"];
    [coder encodeObject:_data forKey:@"data"];
    [coder encodeObject:_collection forKey:@"collection"];
    [coder encodeObject:_commands forKey:@"commands"];
    [coder encodeObject:_queries forKey:@"queries"];
}

@end
