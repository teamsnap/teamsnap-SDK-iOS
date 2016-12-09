//
//  TSDKTeamMedium.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 2/23/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKTeamMedium.h"
#import "TSDKDataRequest.h"
#import "NSURL+TSDKConveniences.h"
#import "TSDKBackgroundUploadProgressMonitorDelegate.h"

@implementation TSDKTeamMedium

@dynamic teamMediumDescription, originalFileSize, position, mediumUrl, createdAt, teamMediaGroupId, mediaFormat, updatedAt, isPrivate, teamId, memberId, linkMember, linkMedium, linkMediumThumbnail, linkTeamMediumPhotoFile, linkTeamMediumComments, linkImageUrl, linkMediumMidsizeThumbnail, linkTeam, linkMediumSmallThumbnail, linkTeamMediaGroup, linkMediumMidsize;

+ (NSString *)SDKType {
    return @"team_medium";
}

+ (NSString *)SDKREL {
    return @"team_media";
}

- (NSURL *)linkForImageWithHeight:(NSInteger)height width:(NSInteger)width {
    NSURL *url = [[self linkTeamMediumPhotoFile] URLByAppendingQuery:@"height" value:[NSString stringWithFormat:@"%ld",(long)height]];
    
    url = [url URLByAppendingQuery:@"width" value:[NSString stringWithFormat:@"%ld",(long)width]];
    
    url = [url URLByAppendingQuery:@"crop" value:@"fill"];
    return url;
}

- (NSURL *)linkForImageWithHeight:(NSInteger)height {
    
    NSURL *url = [[self linkTeamMediumPhotoFile] URLByAppendingQuery:@"height" value:[NSString stringWithFormat:@"%ld",(long)height]];
    
    url = [url URLByAppendingQuery:@"crop" value:@"proportional"];
    return url;
}

- (NSURL *)linkForImageWithWidth:(NSInteger)width {
    NSURL *url = [[self linkTeamMediumPhotoFile] URLByAppendingQuery:@"width" value:[NSString stringWithFormat:@"%ld",(long)width]];
    
    url = [url URLByAppendingQuery:@"crop" value:@"proportional"];
    return url;
}


- (TeamMediaGroupFormatType)mediaType {
    return [TSDKTeamMediaGroup mediaFormatForString:self.mediaFormat];
}

- (void)setMediaType:(TeamMediaGroupFormatType)mediaType {
    self.mediaFormat = [TSDKTeamMediaGroup mediaFormatStringForMediaFormat:mediaType];
}

#if TARGET_OS_IPHONE
+(nonnull TSDKBackgroundUploadProgressMonitorDelegate *)uploadPhotoFileURL:(nonnull NSURL *)photoFileURL  groupid:(NSString *_Nonnull)teamMediaGroupId position:(NSInteger)position memberId:(NSString *_Nonnull)memberId teamId:(NSString *_Nonnull)teamId description:(NSString *_Nonnull)description progress:(TSDKUploadProgressBlock _Nullable)progressBlock {
    
    TSDKBackgroundUploadProgressMonitorDelegate *backgroundUploadDelegate = [[TSDKBackgroundUploadProgressMonitorDelegate alloc] initWithProgressBlock:progressBlock];
    
    TSDKCollectionCommand *uploadCommand = [self commandForKey:@"upload_team_medium"];
    uploadCommand.data[@"team_id"] = teamId;
    uploadCommand.data[@"member_id"] = memberId;
    uploadCommand.data[@"team_media_group_id"] = teamMediaGroupId;
    uploadCommand.data[@"media_format"] = TSDKTeamMediaGroupImageFormatString;
    uploadCommand.data[@"description"] = description;
    
    uploadCommand.data[@"file_name"] = @"photo.jpg";
    NSData *imageData = [NSData dataWithContentsOfURL:photoFileURL];
    
    uploadCommand.data[@"file"] = imageData;
    NSURL *url = [NSURL URLWithString:uploadCommand.href];
    
    [TSDKDataRequest postDictionary:uploadCommand.data toURL:url delegate:backgroundUploadDelegate];
    
    return backgroundUploadDelegate;
}

-(nonnull TSDKBackgroundUploadProgressMonitorDelegate *)uploadPhotoFileURL:(nonnull NSURL *)photoFileURL position:(NSInteger)position progress:(TSDKUploadProgressBlock _Nullable)progressBlock {
    return [TSDKTeamMedium uploadPhotoFileURL:photoFileURL groupid:self.teamMediaGroupId position:0 memberId:self.memberId teamId:self.teamId description:self.teamMediumDescription progress:progressBlock];
}

#endif

@end
