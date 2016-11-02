//
//  TSDKTeamMedium.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 2/23/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKTeamMedium.h"
#import "NSURL+TSDKConveniences.h"

@implementation TSDKTeamMedium

@dynamic teamMediumDescription, originalFileSize, position, mediumUrl, createdAt, teamMediaGroupId, mediaFormat, updatedAt, isPrivate, teamId, memberId, linkMember, linkMedium, linkMediumThumbnail, linkTeamMediumPhotoFile, linkTeamMediumComments, linkImageUrl, linkMediumMidsizeThumbnail, linkTeam, linkMediumSmallThumbnail, linkTeamMediaGroup, linkMediumMidsize;

+ (NSString *)SDKType {
    return @"team_medium";
}

+ (NSString *)SDKREL {
    return @"team_media";
}

- (NSURL *)linkForImageWithHeight:(NSInteger)height width:(NSInteger)width {
    return [[[[self linkTeamMediumPhotoFile] URLByAppendingQueryParameter:[NSString stringWithFormat:@"height=%ld",(long)height]] URLByAppendingQueryParameter:[NSString stringWithFormat:@"width=%ld",(long)width]] URLByAppendingQueryParameter:@"crop=fill"] ;
}

- (NSURL *)linkForImageWithHeight:(NSInteger)height {
        return [[[self linkTeamMediumPhotoFile] URLByAppendingQueryParameter:[NSString stringWithFormat:@"height=%ld",(long)height]] URLByAppendingQueryParameter:@"crop=proportional"] ;
}

- (NSURL *)linkForImageWithWidth:(NSInteger)height width:(NSInteger)width {
    return [[[self linkTeamMediumPhotoFile] URLByAppendingQueryParameter:[NSString stringWithFormat:@"width=%ld",(long)width]] URLByAppendingQueryParameter:@"crop=proportional"] ;
}


- (TeamMediaGroupFormatType)mediaType {
    return [TSDKTeamMediaGroup mediaFormatForString:self.mediaFormat];
}

- (void)setMediaType:(TeamMediaGroupFormatType)mediaType {
    self.mediaFormat = [TSDKTeamMediaGroup mediaFormatStringForMediaFormat:mediaType];
}


@end
