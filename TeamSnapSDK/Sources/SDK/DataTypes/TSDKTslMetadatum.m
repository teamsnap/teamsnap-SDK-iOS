//
//  TSDKTslMetadatum.m
//  Pods
//
//  Created by Skyler Seamans on 11/30/16.
//
//

#import "TSDKTslMetadatum.h"

@implementation TSDKTslMetadatum

@dynamic metadata, userId, updatedAt, createdAt, linkUser;

+ (NSString *)SDKType {
    return @"tsl_metadatum";
}

@end
