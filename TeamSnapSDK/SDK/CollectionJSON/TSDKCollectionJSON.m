//
//  TSDKCollectionJSON.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 1/10/14.
//  Copyright (c) 2014 TeamSnap. All rights reserved.
//

#import "TSDKCollectionJSON.h"
#import <TeamSnapSDK/TSDKCompletionBlockTypes.h>
#import "TSDKCollectionQuery.h"
#import "TSDKCollectionCommand.h"
#import "NSString+TSDKConveniences.h"
#import "TSDKCollectionObject.h"
#import "TSDKLogging.h"

@interface TSDKCollectionJSON()

@end

@implementation TSDKCollectionJSON

+(NSDictionary *)dictionaryToCollectionJSON:(NSDictionary *)dictionary {
    NSMutableArray *tempDataToSave = [[NSMutableArray alloc] init];
    
    NSArray *allKeys = [dictionary allKeys];
    for (NSString *key in allKeys) {
        NSDictionary *itemDictionary = @{@"name" : key, @"value" : dictionary[key]};
        [tempDataToSave addObject:itemDictionary];
    }
    NSDictionary *postObject = @{@"template":@{@"data":tempDataToSave}};

    return postObject;
}


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
        _href = [aDecoder decodeObjectForKey:@"href"];
        _rel = [aDecoder decodeObjectForKey:@"rel"];
        _type = [aDecoder decodeObjectForKey:@"type"];
        _version = [aDecoder decodeObjectForKey:@"version"];
        _links = [aDecoder decodeObjectForKey:@"links"];
        _data = [aDecoder decodeObjectForKey:@"data"];
        _collection = [aDecoder decodeObjectForKey:@"collection"];
        _commands = [aDecoder decodeObjectForKey:@"commands"];
        _queries = [aDecoder decodeObjectForKey:@"queries"];
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
        copy.data = [self.data copy];
        copy.collection = [self.collection copy];
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

- (NSData *)dataEncodedForSave {
    NSData *saveData = [NSKeyedArchiver archivedDataWithRootObject:self];
    return saveData;
}

+ (instancetype)collectionJSONForEncodedData:(NSData *)objectData {
    id anObject = [NSKeyedUnarchiver unarchiveObjectWithData:objectData];
    return anObject;
}

-(void)parseJSON:(NSDictionary *)collection {
    self.href = [NSURL URLWithString:[collection objectForKey:@"href"]];
    self.version = [collection objectForKey:@"version"];
    
    NSArray *datum;
    if ([[collection objectForKey:@"data"] isKindOfClass:[NSArray class]]) {
        datum = [NSArray arrayWithArray:[collection objectForKey:@"data"]];
    } else if (![collection objectForKey:@"data"]) {
    } else if ([[collection objectForKey:@"data"] isEqual:[NSNull null]]) {
    } else {
        DLog(@"Data is %@", [[collection objectForKey:@"data"] class]);
    }
    NSMutableDictionary *tempData = [[NSMutableDictionary alloc] init];
    
    for (NSDictionary *data in datum) {
        NSString *dataType = [data objectForKey:@"type"];
        if ([data objectForKey:@"array"]) {
            [tempData setObject:[data objectForKey:@"array"] forKey:[data objectForKey:@"name"]];
        } else if ([data objectForKey:@"value"]) {
            if (dataType && [dataType isEqualToString:@"DateTime"]) {
            } else if (dataType) {
                DLog(@"DataType: %@", dataType);
            }
            [tempData setObject:[data objectForKey:@"value"] forKey:[data objectForKey:@"name"]];
        }
    }
    [self setData:[NSDictionary dictionaryWithDictionary:tempData]];
    
    NSArray *links = [NSArray arrayWithArray:[collection objectForKey:@"links"]];
    NSMutableDictionary *tempLinks = [[NSMutableDictionary alloc] init];
    
    for (NSDictionary *link in links) {
        if (![link objectForKey:@"href"] || ![link objectForKey:@"rel"]) {
            DLog(@"No Value");
        }
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
        NSMutableArray *tempCollection = [[NSMutableArray alloc] init];
        for (id item in items) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                TSDKCollectionJSON *subCollection = [[TSDKCollectionJSON alloc] init];
                [subCollection parseJSON: (NSDictionary *)item];
                [tempCollection addObject:subCollection];
            }
        }
        
        _collection = [NSArray arrayWithArray:tempCollection];
    } else if ([items isKindOfClass:[NSDictionary class]]) {
        DLog(@"Dictionary of %lu Items", (unsigned long)[(NSDictionary *)items count]);
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
                [mutableResult appendString:[NSString stringWithFormat:@"@property (nonatomic, weak) NSString *_Nullable %@; //Example: %@ \n", camelCaseKey, value]];
            } else if (([key rangeOfString:@"is_"].location == 0) || ([key rangeOfString:@"has_"].location == 0) || ([key rangeOfString:@"show_"].location == 0) || ([key containsString:@"_show_tab"])) {
                [mutableResult appendString:[NSString stringWithFormat:@"@property (nonatomic, assign) BOOL %@; //Example: %@ \n",camelCaseKey, value]];
            } else if ([key rangeOfString:@"_at"].location == key.length-3) {
                [mutableResult appendString:[NSString stringWithFormat:@"@property (nonatomic, weak) NSDate *_Nullable %@; //Example: %@ \n", camelCaseKey, value]];
            } else if ([value isKindOfClass:[NSArray class]]) {
                [mutableResult appendString:[NSString stringWithFormat:@"@property (nonatomic, weak) NSArray *_Nullable %@;\n",camelCaseKey]];
            } else if ([value isKindOfClass:[NSNumber class]]) {
                [mutableResult appendString:[NSString stringWithFormat:@"@property (nonatomic, assign) NSInteger %@; //Example: %@ \n",camelCaseKey, value]];
            } else if ([value isKindOfClass:[NSNull class]]) {
                [mutableResult appendString:[NSString stringWithFormat:@"@property (nonatomic, weak) NSString *_Nullable %@; //Example: %@ \n", camelCaseKey, @"**NULL**"]];
            } else if ([(NSString *)value dateFromRCF3339DateTimeString]) {
                [mutableResult appendString:[NSString stringWithFormat:@"@property (nonatomic, weak) NSDate *_Nullable %@; //Example: %@ \n", camelCaseKey, value]];
            } else {
                [mutableResult appendString:[NSString stringWithFormat:@"@property (nonatomic, weak) NSString *_Nullable %@; //Example: %@ \n", camelCaseKey, value]];
            }
        }
    }
    
    NSMutableString *linkGettersString = [[NSMutableString alloc] init];
    
    for (NSString *key in self.links) {
        NSString *linkKey = [NSString stringWithFormat:@"link_%@",key];
        NSString *camelCaseKey = [linkKey underscoresToCamelCase];
        NSString *getKey = [NSString stringWithFormat:@"get_%@",key];
        
        [dynamicProperties addObject:camelCaseKey];
        [mutableResult appendString:[NSString stringWithFormat:@"@property (nonatomic, weak) NSURL *_Nullable %@;\n", camelCaseKey]];
        
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
