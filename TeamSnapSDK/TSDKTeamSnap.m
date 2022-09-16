//
// Created by Jason Rahaim on 1/29/15.
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKTeamSnap.h"
#import "NSObject+TSDKIntegerOtNotFound.h"
#import "TSDKUser.h"
#import "TSDKDataRequest.h"
#import "TSDKObjectsRequest.h"
#import "TSDKCollectionJSON.h"
#import "TSDKTeam.h"
#import "TSDKMember.h"
#import "TSDKTrackedItem.h"
#import "TSPCache.h"
#import "TSDKRootLinks.h"
#import "TSDKPublicFeatures.h"
#import "TSDKTslPhotos.h"
#import "TSDKPlan.h"
#import "TSDKCompletionBlockTypes.h"
#if TARGET_OS_IPHONE
#import <SafariServices/SafariServices.h>
#endif

@interface TSDKTeamSnap()

@property (nonatomic, strong) TSDKPublicFeatures *publicFeatures;
@property (nonatomic, strong) SFSafariViewController *loginView API_AVAILABLE(ios(9.0));
@property (nonatomic, assign) BOOL useCombinedContactCard;
@property (nonatomic, strong, nonnull) NSOperationQueue *loginCompletionQueue;

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

+ (NSURL *)baseURL {
    return [TSDKDataRequest baseURL];
}

+ (void)setBaseURL:(NSURL *)url {
    [TSDKDataRequest setBaseURL:url];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _loginCompletionQueue = [[NSOperationQueue alloc] init];
    }
    
    return self;
}

- (void)setClientId:(NSString *)clientId {
    [TSDKDataRequest setClientId:clientId];
    _clientId = clientId;
    NSLog(@"+++ set clientId %@", clientId);
}

- (void)setClientSecret:(NSString *)clientSecret {
    [TSDKDataRequest setClientSecret:clientSecret];
    _clientSecret = clientSecret;
    NSLog(@"+++ set clientSecret %@", clientSecret);
}

- (void)setOAuthToken:(NSString *)OAuthToken {
    [TSDKDataRequest setOAuthToken:OAuthToken];
    _OAuthToken = OAuthToken;
    NSLog(@"+++ set OAuthToken %@", OAuthToken);
}

- (void)connectWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(void (^)(BOOL success, TSDKUser *user, NSError *error))completion {
    
    NSError *__block loginError = nil;
    BOOL __block loginSuccess = YES;
    if (completion != nil) {
        BOOL allowAuth = (self.loginCompletionQueue.operationCount == 0);
        if (allowAuth) {
            // Initial
            [self.loginCompletionQueue setSuspended:YES];
        }
        
        [self.loginCompletionQueue addOperationWithBlock:^{
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(loginSuccess, self.teamSnapUser, loginError);
            });
        }];
        
        if (allowAuth) {
            if (self.teamSnapUser) {
                [self rootLinksWithConfiguration:configuration completion:^(TSDKRootLinks *rootLinks, NSError * _Nullable error) {
                    loginSuccess = (rootLinks != nil);
                    loginError = error;
                    [self.loginCompletionQueue setSuspended:NO];
                }];
            } else {
                [self processInitialConnectionWithConfiguration:configuration completion:^(BOOL success, TSDKUser *user, NSError *error) {
                    loginSuccess = success;
                    loginError = error;
                    [self.loginCompletionQueue setSuspended:NO];
                }];
            }
        }
    } else {
        if (self.teamSnapUser) {
            [self rootLinksWithConfiguration:configuration completion:nil];
        } else {
            [self processInitialConnectionWithConfiguration:configuration completion:nil];
        }
    }
}

- (void)loginWithOAuthToken:(NSString *)OAuthToken completion:(void (^)(BOOL success, TSDKUser *user, NSError *error))completion {
    [self setOAuthToken:OAuthToken];
    [self connectWithConfiguration:[TSDKRequestConfiguration requestConfigurationWithForceReload:YES] completion:completion];
}

- (void)logout {
    self.teamSnapUser = nil;
    self.OAuthToken = nil;
    [self.loginCompletionQueue cancelAllOperations];
    self.loginCompletionQueue = [[NSOperationQueue alloc] init];
}

- (void)configureForCombinedContactFeature {
    self.useCombinedContactCard = YES;
}

- (BOOL)combinedContactFeatureIsActive {
    return self.useCombinedContactCard;
}

#if TARGET_OS_IPHONE
- (SFSafariViewController *)presentLoginInViewController:(UIViewController *)viewController animated:(BOOL)animated clientId:(NSString *)clientId scope:(NSString *)scope redirectURL:(NSString *)redirectURL completion:(void (^)(void))completion API_AVAILABLE(ios(9.0)) {
    
    NSString *OAuthURLString = [NSString stringWithFormat:@"https://auth.teamsnap.com/oauth/authorize?client_id=%@&redirect_uri=%@&scope=%@&response_type=token", clientId, redirectURL, scope];
    
    NSURL *OAuthURL = [NSURL URLWithString:OAuthURLString];
    
    self.loginView = [[SFSafariViewController alloc] initWithURL:OAuthURL];
    
    [viewController presentViewController:self.loginView animated:YES completion:^{
        if (completion) {
            completion();
        }
    }];

    return self.loginView;
}

- (NSDictionary *)queryDictionaryForReturnURL:(NSURL *)URL {
    NSString *query = URL.fragment;
    NSArray *queryComponents = [query componentsSeparatedByString:@"&"];
    NSMutableDictionary *queryDictionary = [[NSMutableDictionary alloc] init];
    for (NSString *part in queryComponents) {
        NSArray *param = [part componentsSeparatedByString:@"="];
        if (param.count == 2) {
            [queryDictionary setObject:param[1] forKey:param[0]];
        }
    }
    return [queryDictionary copy];
}

- (BOOL)processLoginCallback:(NSURL *)url completion:(void (^)(BOOL success, NSError *error))completion API_AVAILABLE(ios(9.0)) {
    NSDictionary *queryDictionary = [self queryDictionaryForReturnURL:url];
    if ([queryDictionary objectForKey:@"access_token"]) {
        if (self.loginView) {
            [self.loginView dismissViewControllerAnimated:NO completion:nil];
        }
        [[TSDKTeamSnap sharedInstance] loginWithOAuthToken:[queryDictionary objectForKey:@"access_token"] completion:^(BOOL success, TSDKUser *user, NSError *error) {
            if (completion) {
                completion(success, error);
            }
        }];
        return YES;
    } else {
        return NO;
    }
}
#endif

- (void)publicFeaturesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(void (^)(TSDKPublicFeatures *publicFeatures))completion {
    if (self.publicFeatures) {
        if (completion) {
            completion(self.publicFeatures);
        }
    } else {
        TSDKTeamSnap __weak *weakSelf = self;
        
        [TSDKDataRequest requestJSONObjectsForPath:[[TSDKDataRequest baseURL] URLByAppendingPathComponent:@"public_features"]  sendDataDictionary:nil method:nil configuration:configuration withCompletion:^(BOOL success, BOOL complete, id objects, NSError *error) {
            self.publicFeatures = [[TSDKPublicFeatures alloc] initWithCollection:objects];
            if (completion) {
                completion(weakSelf.publicFeatures);
            }
        }];
    }
}

- (void)rootLinksWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKRootLinkCompletionBlock)completion {
    TSDKSimpleCompletionBlock schemaCompletionBlock  = ^(BOOL success, NSError *error) {
        if (success) {
            if (completion) {
                completion(self.rootLinks, error);
            }
        } else {
            completion(nil, error);
        }
    };
    
    if (self.rootLinks && configuration.forceReload == NO) {
        [self.rootLinks getSchemasWithConfiguration:configuration completion:schemaCompletionBlock];
    } else {
        TSDKTeamSnap __weak *weakSelf = self;
        
        [TSDKDataRequest requestObjectsForPath:[TSDKDataRequest baseURL] withConfiguration:configuration completion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
            if (success) {
                TSDKRootLinks *rootLinks = [[TSDKRootLinks alloc] initWithCollection:objects];
                [TSPCache saveObject:rootLinks];
                weakSelf.rootLinks = rootLinks;
            
                [rootLinks getSchemasWithConfiguration:configuration completion:schemaCompletionBlock];
            } else {
                TSDKCollectionObject *cachedRootLinks = [TSPCache objectOfClass:[TSDKRootLinks class] withId:@""];
                if([cachedRootLinks isKindOfClass:[TSDKRootLinks class]]) {
                    weakSelf.rootLinks = (TSDKRootLinks *)cachedRootLinks;
                }
                
                if (completion) {
                    completion(weakSelf.rootLinks, error);
                }
            }
        }];
    }
}

- (void)processInitialConnectionWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(void (^)(BOOL success, TSDKUser *user, NSError *error))completion {
    TSDKTeamSnap __weak *weakSelf = self;
    
    [self rootLinksWithConfiguration:configuration completion:^(TSDKRootLinks *rootLinks, NSError * _Nullable error) {
        [TSDKDataRequest requestObjectsForPath:rootLinks.linkMe withConfiguration:configuration completion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
            if (success) {
                TSDKUser *user = [TSDKObjectsRequest processLoginCollectionJSON:objects];
                weakSelf.teamSnapUser = user;
                if (completion) {
                    completion((user != nil), user, error);
                }
            } else {
                completion(success, nil, error);
            }
        }];
    }];
}

- (void)invitationStatusForEmailAddress:(NSString *)emailAddress withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKInviteStatusCompletionBlock)completionBlock {
    [TSDKObjectsRequest invitationStatusForEmailAddress:emailAddress withCompletion:completionBlock];
}

- (void)sendPendingInvitesForEmailAddress:(NSString *)emailAddress withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKCompletionBlock)completionBlock {
    [TSDKRootLinks actionSendInvitationsToEmailaddress:emailAddress WithCompletion:completionBlock];
}

- (void)sendNewUserWelcomeToEmail:(NSString *)email callbackURL:(NSURL *)URL withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKCompletionBlock)completionBlock {
    [self rootLinksWithConfiguration:configuration completion:^(TSDKRootLinks *rootLinks, NSError * _Nullable error) {
        
    }];
}


- (void)tslPhotoUploadURLWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(void (^)(TSDKTslPhotos *TSDKTslPhotos))completion {
    [self rootLinksWithConfiguration:configuration completion:^(TSDKRootLinks *rootLinks, NSError * _Nullable error) {
        [TSDKDataRequest requestObjectsForPath:rootLinks.linkTslPhotos withConfiguration:configuration completion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
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
    NSLog(@"+++ setCachePathURL %@", cachePath);
    if (cachePath) {
        [TSPCache setCacheRootPath:cachePath];
    } else {
        [TSPCache setCacheRootPath:[TSPCache cacheRootPath]];
    }
}

- (void)setCacheTimeoutMinutes:(NSUInteger)timeoutMinutes {
    [TSPCache setCacheMaxAgeInMinutes:timeoutMinutes];
}

- (void)clearCache {
    [TSPCache invalidateAll];
}

- (NSURL *_Nonnull)cachePath {
    return [TSPCache cacheRootPath];
}

@end
