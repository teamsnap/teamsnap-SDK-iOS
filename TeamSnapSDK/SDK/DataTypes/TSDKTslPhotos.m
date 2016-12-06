//
//  TSDKTslPhotos.m
//  SDKDeveloperTools
//
//  Created by Jason Rahaim on 9/23/15.
//  Copyright © 2015 jasonr. All rights reserved.
//

#import "TSDKTslPhotos.h"
#import "TSDKTeamSnap.h"
#import "TSDKRootLinks.h"

@implementation TSDKTslPhotos

@dynamic hostPrefix, linkRoot, linkSelf;

+ (NSString *)SDKType {
    return @"tsl_photo";
}
+(void)uploadTSLImageURL:(nonnull NSURL *)photoFileURL fileName:(nullable NSString *)fileName size:(NSNumber *)size team:(TSDKTeam *)team event:(nullable TSDKEvent *)event progress:(nullable TSDKUploadProgressBlock)progressBlock {
    NSURL *url = [[[TSDKTeamSnap sharedInstance] rootLinks] linkTslPhotos];
    [TSDKDataRequest requestJSONObjectsForPath:url sendDataDictionary:nil method:@"GET" configuration:[TSDKRequestConfiguration requestConfigurationWithForceReload:YES] withCompletion:^(BOOL success, BOOL complete, id  _Nullable objects, NSError * _Nullable error) {
        TSDKCollectionJSON *collection = [[TSDKCollectionJSON alloc] initWithJSON:objects];
        
        // upload code here
    }];
    
}
//    request.completionBlock = ^void(BOOL success, TeamsnapRequest *request) {
//        [self.activeRequests removeObject:request];
//        TSDKCollectionJSON *collection = [[TSDKCollectionJSON alloc] initWithJSON:request.responseDictionary];
//        NSString *hostPrefix = [collection.data objectForKey:@"host_prefix"];
//        TSDKCollectionCommand *collectionCommand = [collection.commands objectForKey:@"upload"];
//
//        NSData *imageData = [NSData dataWithContentsOfURL:photoFileURL];
//
//        if (collectionCommand) {
//            [collectionCommand.data setObject:@(team.objectIdentifier) forKey:@"team_id"];
//            [collectionCommand.data setObject:@(event.objectIdentifier) forKey:@"event_id"];
//            [collectionCommand.data setObject:@(user.userId) forKey:@"user_id"];
//            [collectionCommand.data setObject:imageData forKey:@"file1"];
//            [collectionCommand.data setObject:fileName forKey:@"supressed_file_name"];
//        }
//
//        if(collectionCommand.href) {
//            NSURL *destinationURL = [NSURL URLWithString:collectionCommand.href];
//
//            TeamsnapRequest *postRequest = [TeamsnapRequest requestWithURL:destinationURL];
//            [postRequest setRequestMethod:@"POST"];
//
//            [postRequest.postDataDictionary addEntriesFromDictionary:collectionCommand.data];
//            __typeof__(postRequest) __weak weakPostRequest = postRequest;
//
//            if (completion) {
//                postRequest.completionBlock = ^void(BOOL success, TeamsnapRequest *request) {
//                    if (completion) {
//                        NSString *urlString = [[NSURL URLWithString:fileName relativeToURL:[NSURL URLWithString:hostPrefix]] absoluteString];
//
//                        completion(success, urlString, nil);
//                    }
//                    weakPostRequest.completionBlock = nil;
//                };
//            }
//
//            if (uploadProgressBlock) {
//                postRequest.uploadProgressBlock = ^void(NSInteger totalBytesSent, NSInteger totalBytesToSend) {
//                    if (uploadProgressBlock) {
//                        uploadProgressBlock(totalBytesSent, totalBytesToSend);
//                    }
//                };
//            }
//
//            [postRequest startAsynchronousMultiPartDataWithFileType:@"image/png"];
//        } else {
//            completion(NO, nil, nil);
//        }
//    };


@end
