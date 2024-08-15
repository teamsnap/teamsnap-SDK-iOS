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

+ (TSDKTeamMediaGroupFormatType)mediaFormatForString:(NSString *_Nullable)mediaFormat {
    if ([mediaFormat isEqualToString:TSDKTeamMediaGroupImageFormatString]) {
        return TSDKTeamMediaGroupFormatTypeImage;
    } else if ([mediaFormat isEqualToString:TSDKTeamMediaGroupFileFormatString]) {
        return TSDKTeamMediaGroupFormatTypeFile;
    } else {
        return TSDKTeamMediaGroupFormatTypeUnknown;
    }
}

+ (NSString *_Nullable)mediaFormatStringForMediaFormat:(TSDKTeamMediaGroupFormatType)fieldType {
    switch (fieldType) {
        case TSDKTeamMediaGroupFormatTypeImage:
            return TSDKTeamMediaGroupImageFormatString;
            break;
        case TSDKTeamMediaGroupFormatTypeFile:
            return TSDKTeamMediaGroupFileFormatString;
            break;
        default:
            return TSDKTeamMediaGroupFileFormatString;
            break;
    }
}

- (TSDKTeamMediaGroupFormatType)mediaType {
    return [TSDKTeamMediaGroup mediaFormatForString:self.mediaFormat];
}

- (void)setMediaType:(TSDKTeamMediaGroupFormatType)mediaType {
    self.mediaFormat = [TSDKTeamMediaGroup mediaFormatStringForMediaFormat:mediaType];
}

@end
