//
//  TSDKTeamMediaGroup.m
//  TeamSnapSDK
//
//  Created by Jason Rahaim on 2/23/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

#import "TSDKTeamMediaGroup.h"

NSString * _Nonnull const TSDKTeamMediaGroupImageFormatString = @"image";
NSString * _Nonnull const TSDKTeamMediaGroupFileFormatString = @"file";

@implementation TSDKTeamMediaGroup

@dynamic position, lastTeamMediumPosition, isPrivate, mediaFormat, teamId, countTeamMedia, name, linkTeamMedia, linkPreviewMedium, linkTeam, linkPreviewMediumThumbnail;

+ (NSString *)SDKType {
    return @"team_media_group";
}

+ (TeamMediaGroupFormatType)mediaFormatForString:(NSString *_Nullable)mediaFormat {
    if ([mediaFormat isEqualToString:TSDKTeamMediaGroupImageFormatString]) {
        return TSDKTeamMediaGroupImageFormat;
    } else if ([mediaFormat isEqualToString:TSDKTeamMediaGroupFileFormatString]) {
        return TSDKTeamMediaGroupFileFormat;
    } else {
        return TSDKTeamMediaGroupUnknownFormat;
    }
}

+ (NSString *_Nullable)mediaFormatStringForMediaFormat:(TeamMediaGroupFormatType)fieldType {
    switch (fieldType) {
        case TSDKTeamMediaGroupImageFormat:
            return TSDKTeamMediaGroupImageFormatString;
            break;
        case TSDKTeamMediaGroupFileFormat:
            return TSDKTeamMediaGroupFileFormatString;
            break;
        default:
            return TSDKTeamMediaGroupFileFormatString;
            break;
    }
}

- (TeamMediaGroupFormatType)mediaType {
    return [TSDKTeamMediaGroup mediaFormatForString:self.mediaFormat];
}

- (void)setMediaType:(TeamMediaGroupFormatType)mediaType {
    self.mediaFormat = [TSDKTeamMediaGroup mediaFormatStringForMediaFormat:mediaType];
}

@end
