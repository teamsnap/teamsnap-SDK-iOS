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
#import "TSDKRootLinks.h"
#import "TSDKPublicFeatures.h"
#import "TSDKTslPhotos.h"

@interface TSDKTeamSnap()

@property (nonatomic, strong) TSDKPublicFeatures *publicFeatures;

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
        [self processInitialConnectionWithCompletion:completion];
    }
}

- (void)loginWithOAuthToken:(NSString *)OAuthToken completion:(void (^)(bool success, NSString *message))completion {
    [self setOAuthToken:OAuthToken];
    [self connectWithCompletion:completion];
}

- (void)loginWithUserName:(NSString *)userName andPassword:(NSString *)password completion:(void (^)(bool success, NSString *message))completion {
    TSDKTeamSnap __weak *weakSelf = self;
    [TSDKDataRequest loginWithUser:userName password:password onCompletion:^(BOOL success, NSString *OAuthToken, NSError *error) {
        _OAuthToken = OAuthToken;
        
        [weakSelf processInitialConnectionWithCompletion:completion];
    }];
}

- (void)logout {
    self.teamSnapUser = nil;
    self.OAuthToken = nil;
    self.rootLinks = nil;
}

- (void)publicFeaturesWithCompletion:(void (^)(TSDKPublicFeatures *publicFeatures))completion {
    if (self.publicFeatures) {
        if (completion) {
            completion(self.publicFeatures);
        }
    } else {
        TSDKTeamSnap __weak *weakSelf = self;
        
//        [self rootLinksWithCompletion:^(TSDKRootLinks *rootLinks) { //self.rootLinks.linkPublicFeatures
            [TSDKDataRequest requestJSONObjectsForPath:[[TSDKDataRequest baseURL] URLByAppendingPathComponent:@"/public_features"]  sendDataDictionary:nil method:nil withCompletion:^(BOOL success, BOOL complete, id objects, NSError *error) {
                self.publicFeatures = [[TSDKPublicFeatures alloc] initWithCollection:objects];
                if (completion) {
                    completion(weakSelf.publicFeatures);
                }
            }];
//        }];
    }
}

- (void)rootLinksWithCompletion:(void (^)(TSDKRootLinks *rootLinks))completion {
    if (self.rootLinks) {
        if (completion) {
            completion(self.rootLinks);
        }
    } else {
        TSDKTeamSnap __weak *weakSelf = self;
        
        [TSDKDataRequest requestObjectsForPath:[TSDKDataRequest baseURL] withCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
            if (success) {
                weakSelf.rootLinks = [[TSDKRootLinks alloc] initWithCollection:objects];
            }
            if (completion) {
                completion(weakSelf.rootLinks);
            }
        }];
    }
}

- (void)processInitialConnectionWithCompletion:(void (^)(bool success, NSString *message))completion {
    TSDKTeamSnap __weak *weakSelf = self;
    [self rootLinksWithCompletion:^(TSDKRootLinks *rootLinks) {
        [TSDKDataRequest requestObjectsForPath:rootLinks.linkMe withCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
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

- (void)tslPhotoUploadURLWithCompletion:(void (^)(TSDKTslPhotos *TSDKTslPhotos))completion {
    [self rootLinksWithCompletion:^(TSDKRootLinks *rootLinks) {
        [TSDKDataRequest requestObjectsForPath:rootLinks.linkTslPhotos withCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
            TSDKTslPhotos *tslPhoto = nil;
            if (success) {
                tslPhoto = [[TSDKTslPhotos alloc] initWithCollection:objects];
            }
            if (completion) {
                completion(tslPhoto);
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