//
//  TSDKCollectionJSON.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 1/10/14.
//  Copyright (c) 2014 TeamSnap. All rights reserved.
//

#import "TSDKCollectionJSON.h"
#import "TSDKCollectionCommand.h"
#import "NSString+TSDKConveniences.h"
#import "TSDKCollectionObject.h"

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
        self.href = nil;
        self.version = nil;
        self.links = [[NSMutableDictionary alloc] init];
        self.data = [[NSMutableDictionary alloc] init];
        self.commands = [[NSMutableDictionary alloc] init];
        _collection = nil;
        _errorCode = NSNotFound;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [self init];
    if (self) {
        _href = [aDecoder decodeObjectForKey:@"href"];
        _type = [aDecoder decodeObjectForKey:@"type"];
        _version = [aDecoder decodeObjectForKey:@"version"];
        _links = [aDecoder decodeObjectForKey:@"links"];
        _data = [aDecoder decodeObjectForKey:@"data"];
        _collection = [aDecoder decodeObjectForKey:@"collection"];
        _commands = [aDecoder decodeObjectForKey:@"commands"];
    }
    return self;
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
        NSLog(@"Data is %@", [[collection objectForKey:@"data"] class]);
    }
    for (NSDictionary *data in datum) {
        NSString *dataType = [data objectForKey:@"type"];
        if ([data objectForKey:@"array"]) {
            [self.data setObject:[data objectForKey:@"array"] forKey:[data objectForKey:@"name"]];
        } else if ([data objectForKey:@"value"]) {
            if (dataType && [dataType isEqualToString:@"DateTime"]) {
            } else if (dataType) {
                NSLog(@"DataType: %@", dataType);
            }
            [self.data setObject:[data objectForKey:@"value"] forKey:[data objectForKey:@"name"]];
        }
    }
    
    NSArray *links = [NSArray arrayWithArray:[collection objectForKey:@"links"]];
    for (NSDictionary *link in links) {
        [self.links setObject:[link objectForKey:@"href"] forKey:[link objectForKey:@"rel"]];
    }
    
    if ([self.data objectForKey:@"type"]) {
        self.type = [self.data objectForKey:@"type"];
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
    } else if ([items isKindOfClass:[NSDictionary class]]) {
        NSLog(@"Dictionary of %lu Items", (unsigned long)[(NSDictionary *)items count]);
    }
    if ([collection objectForKey:@"template"]) {
        TSDKCollectionJSON *template = [[TSDKCollectionJSON alloc] init];
        [template parseJSON:[collection objectForKey:@"template"]];
        template.href = self.href;
        if (_collection && [[_collection objectAtIndex:0] isKindOfClass:[TSDKCollectionJSON class]] && [[_collection objectAtIndex:0] type] && ![TSDKCollectionObject templateForClass:[[_collection objectAtIndex:0] type]]) {
            [TSDKCollectionObject setTemplate:template.data forClass:[[_collection objectAtIndex:0] type]];
        }
    }
    
    if ([collection objectForKey:@"commands"]) {
        for (NSDictionary *commandDictionary in [collection objectForKey:@"commands"]) {
            TSDKCollectionCommand *command = [[TSDKCollectionCommand alloc] initWithJSONDict:commandDictionary];
            [_commands setObject:command forKey:command.rel];
        }
    }
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
            if (([key rangeOfString:@"is_"].location == 0) || ([key rangeOfString:@"has_"].location == 0) || ([key rangeOfString:@"show_"].location == 0) || ([key containsString:@"_show_tab"])) {
                [mutableResult appendString:[NSString stringWithFormat:@"@property (nonatomic, assign) BOOL %@; //Example: %@ \n",camelCaseKey, value]];
            } else if ([value isKindOfClass:[NSArray class]]) {
                [mutableResult appendString:[NSString stringWithFormat:@"@property (nonatomic, weak) NSArray *%@;\n",camelCaseKey]];
            } else if ([value isKindOfClass:[NSNumber class]]) {
                [mutableResult appendString:[NSString stringWithFormat:@"@property (nonatomic, assign) NSInteger %@; //Example: %@ \n",camelCaseKey, value]];
            } else if ([value isKindOfClass:[NSNull class]]) {
                [mutableResult appendString:[NSString stringWithFormat:@"@property (nonatomic, weak) NSString *%@; //Example: %@ \n", camelCaseKey, @"**NULL**"]];
            } else if ([(NSString *)value dateFromRCF3339DateTimeString]) {
                [mutableResult appendString:[NSString stringWithFormat:@"@property (nonatomic, weak) NSDate *%@; //Example: %@ \n", camelCaseKey, value]];
            } else {
                [mutableResult appendString:[NSString stringWithFormat:@"@property (nonatomic, weak) NSString *%@; //Example: %@ \n", camelCaseKey, value]];
            }
        }
    }
    
    NSMutableString *linkGettersString = [[NSMutableString alloc] init];
    
    for (NSString *key in self.links) {
        NSString *linkKey = [NSString stringWithFormat:@"link_%@",key];
        NSString *camelCaseKey = [linkKey underscoresToCamelCase];
        NSString *getKey = [NSString stringWithFormat:@"get_%@",key];
        
        [dynamicProperties addObject:camelCaseKey];
        [mutableResult appendString:[NSString stringWithFormat:@"@property (nonatomic, weak) NSURL *%@;\n", camelCaseKey]];
        [linkGettersString appendFormat:@"-(void)%@WithCompletion:(TSDKArrayCompletionBlock)completion;\n", [getKey underscoresToCamelCase]];
    }
    
    NSMutableString *actionsString = [[NSMutableString alloc] init];

    for (NSString *key in self.commands) {
        NSString *commandKey = [NSString stringWithFormat:@"action_%@", key];
        NSString *camelCaseKey = [commandKey underscoresToCamelCase];
        TSDKCollectionCommand *commandDictionary = [self.commands objectForKey:key];
        
        NSMutableString *paramaters = [[NSMutableString alloc] init];
        for (NSString *key in commandDictionary.data) {
            if (paramaters.length == 0) {
                [paramaters appendFormat:@"%@:(NSString *)%@ ", [[key underscoresToCamelCase] capitalizedString], [key underscoresToCamelCase]];
            } else {
                [paramaters appendFormat:@"%@:(NSString *)%@ ", [key underscoresToCamelCase], [key underscoresToCamelCase]];
            }
        }
        [actionsString appendFormat:@"-(void)%@%@WithCompletion:(TSDKCompletionBlock)completion; //%@\n", camelCaseKey, paramaters, commandDictionary.prompt];
    }
    
    NSMutableString *dynamicString = [NSMutableString stringWithString:@"@dynamic "];
    NSString *commaSeperated = [[dynamicProperties valueForKey:@"description"] componentsJoinedByString:@", "];
    [dynamicString appendString:commaSeperated];
    [dynamicString appendString:@";"];
    
    NSString *SDKName = [NSString stringWithFormat:@"+ (NSString *)SDKType {\n  return @\"%@\";\n}\n", self.type];
    
    [mutableResult appendFormat:@"\n\n%@", linkGettersString];
    [mutableResult appendFormat:@"\n\n%@", actionsString];
    
    [mutableResult appendFormat:@"\n\n/*\n%@\n\n%@\n*/", dynamicString, SDKName];
    
    return [NSString stringWithString:mutableResult];
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:_href forKey:@"href"];
    [coder encodeObject:_type forKey:@"type"];
    [coder encodeObject:_version forKey:@"version"];
    [coder encodeObject:_links forKey:@"links"];
    [coder encodeObject:_data forKey:@"data"];
    [coder encodeObject:_commands forKey:@"commands"];
    [coder encodeObject:_collection forKey:@"collection"];
}

@end
