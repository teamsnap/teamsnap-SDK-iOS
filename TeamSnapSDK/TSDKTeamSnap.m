//
// Created by Jason Rahaim on 1/29/15.
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKTeamSnap.h"
#import "TSDKUser.h"
#import "TSDKDataRequest.h"
#import "TSDKObjectsRequest.h"
#import "TSDKCollectionJSON.h"
#import "NSObject+TSDKIntegerOtNotFound.h"
#import "TSDKTeam.h"
#import "TSDKMember.h"
#import "TSDKTrackedItem.h"
#import "TSPCache.h"

@interface TSDKTeamSnap()


@end

@implementation TSDKTeamSnap


+ (instancetype)sharedInstance {
    static TSDKTeamSnap *_sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[TSDKTeamSnap alloc] init];
    });

    return _sharedInstance;
}

- (void)setClientId:(NSString *)clientId {
    [TSDKDataRequest setClientId:clientId];
    _clientId = clientId;
}

- (void)setClientSecret:(NSString *)clientSecret {
    [TSDKDataRequest setClientSecret:clientSecret];
    _clientSecret = clientSecret;
}

- (void)setOAuthToken:(NSString *)OAuthToken {
    [TSDKDataRequest setOAuthToken:OAuthToken];
    _OAuthToken = OAuthToken;
}

- (void)connectWithCompletion:(void (^)(bool success, NSString *message))completion {
    if (self.teamSnapUser) {
        if (completion) {
            completion(YES, nil);
        }
    } else {
        TSDKTeamSnap __weak *weakSelf = self;
        [TSDKDataRequest requestObjectsForPath:[TSDKDataRequest appendPathToBaseURL:@"me"] withCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
            if (success) {
                weakSelf.teamSnapUser = [TSDKObjectsRequest processLoginCollectionJSON:objects];
                success = (BOOL)weakSelf.teamSnapUser;
            }
            NSString *message = nil;
            if (completion) {
                completion(success, message);
            }
        }];
    }
}

- (void)loginWithUserName:(NSString *)userName andPassword:(NSString *)password completion:(void (^)(bool success, NSString *message))completion {
    TSDKTeamSnap __weak *weakSelf = self;
    [TSDKDataRequest loginWithUser:userName password:password onCompletion:^(BOOL success, NSString *OAuthToken, NSError *error) {
        _OAuthToken = OAuthToken;
        
        [TSDKDataRequest requestObjectsForPath:[TSDKDataRequest appendPathToBaseURL:@"me"] withCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
            if (success) {
                weakSelf.teamSnapUser = [TSDKObjectsRequest processLoginCollectionJSON:objects];
                success = (BOOL)weakSelf.teamSnapUser;
            }
            NSString *message = nil;
            if (completion) {
                completion(success, message);
            }
        }];

    }];
}

#pragma mark - Cache
- (void)setCachePathURL:(NSURL *)cachePath {
    [TSPCache setCacheRootPath:cachePath];
}

- (void)setCacheTimeoutMinutes:(NSUInteger)timeoutMinutes {
    [TSPCache setCacheMaxAgeInMinutes:timeoutMinutes];
}

- (void)clearCache {
    [TSPCache invalidateAll];
}

@end