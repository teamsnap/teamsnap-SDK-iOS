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
#import "TSDKTeam.h"
#import "TSDKEvent.h"
#import "TSDKUser.h"
#import "TSDKTeamSnap.h"
#import "TSDKBackgroundUploadProgressMonitorDelegate.h"

@implementation TSDKTslPhotos

@dynamic hostPrefix, linkRoot, linkSelf;

+ (NSString *)SDKType {
    return @"tsl_photo";
}

+(nonnull TSDKBackgroundUploadProgressMonitorDelegate *)uploadTSLImageURL:(nonnull NSURL *)photoFileURL team:(nonnull TSDKTeam *)team event:(nullable TSDKEvent *)event uploadDetailsCallback:(nullable TSLImageUploadDetailsCompletionBlock)uploadDetailsCallback progress:(nullable TSDKUploadProgressBlock)progressBlock {
    NSURL *url = [[[TSDKTeamSnap sharedInstance] rootLinks] linkTslPhotos];
    
    TSDKBackgroundUploadProgressMonitorDelegate *backgroundUploadDelegate = [[TSDKBackgroundUploadProgressMonitorDelegate alloc] initWithProgressBlock:progressBlock];
    
    [TSDKDataRequest requestJSONObjectsForPath:url sendDataDictionary:nil method:@"GET" configuration:[TSDKRequestConfiguration requestConfigurationWithForceReload:YES] withCompletion:^(BOOL success, BOOL complete, id  _Nullable objects, NSError * _Nullable error) {
        TSDKCollectionJSON *collection = [[TSDKCollectionJSON alloc] initWithJSON:objects];
        
        NSString *hostPrefix = [collection.data objectForKey:@"host_prefix"];
        TSDKCollectionCommand *collectionCommand = [collection.commands objectForKey:@"upload"];
        
        NSData *imageData = [NSData dataWithContentsOfURL:photoFileURL];
        TSDKUser * user = [[TSDKTeamSnap sharedInstance] teamSnapUser];
        
        NSString *fileName = [NSString stringWithFormat:@"%ld_%ld_%@.png", (long)team.objectIdentifier, (long)event.objectIdentifier, [[NSUUID UUID] UUIDString]];
        
        if (collectionCommand && collectionCommand.href && collectionCommand.href.length>0 && user) {
            [collectionCommand.data setObject:team.objectIdentifier forKey:@"team_id"];
            [collectionCommand.data setObject:event.objectIdentifier forKey:@"event_id"];
            [collectionCommand.data setObject:user.objectIdentifier forKey:@"user_id"];
            [collectionCommand.data setObject:imageData forKey:@"file1"];
            [collectionCommand.data setObject:fileName forKey:@"supressed_file_name"];
        }
        
        NSURL *photoPostURL = [NSURL URLWithString:collectionCommand.href];
        
        NSURL *destinatonFileURL = [NSURL URLWithString:fileName relativeToURL:[NSURL URLWithString:hostPrefix]];
        if (uploadDetailsCallback) {
            uploadDetailsCallback(success, destinatonFileURL, error);
        }
        
        [TSDKDataRequest postDictionary:collectionCommand.data toURL:photoPostURL delegate:backgroundUploadDelegate];
    }];
    
    return backgroundUploadDelegate;
}
@end
