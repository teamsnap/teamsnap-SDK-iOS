//
// Created by Jason Rahaim on 1/29/15.
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import "TSDKTeamSnap.h"
#import "NSObject+TSDKIntegerOtNotFound.h"
#import "NSMutableDictionary+integerKey.h"
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
#if TARGET_OS_IPHONE
#import <SafariServices/SafariServices.h>
#endif

@interface TSDKTeamSnap()

@property (nonatomic, strong) TSDKPublicFeatures *publicFeatures;
@property (nonatomic, strong) NSMutableDictionary *plans;
@property (nonatomic, strong) SFSafariViewController *loginView;

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

- (void)connectWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(void (^)(BOOL success, NSString *message))completion {
    if (self.teamSnapUser) {
        if (completion) {
            completion(YES, nil);
        }
    } else {
        [self processInitialConnectionWithConfiguration:nil completion:completion];
    }
}

- (void)loginWithOAuthToken:(NSString *)OAuthToken completion:(void (^)(BOOL success, NSString *message))completion {
    [self setOAuthToken:OAuthToken];
    [self connectWithConfiguration:nil completion:completion];
}

- (void)clearCacheInformation {
    self.teamSnapUser = nil;
    self.rootLinks = nil;
}

#if TARGET_OS_IPHONE
- (SFSafariViewController *)presentLoginInViewController:(UIViewController *)viewController animated:(BOOL)animated clientId:(NSString *)clientId scope:(NSString *)scope redirectURL:(NSString *)redirectURL completion:(void (^)(void))completion {
    
    NSString *OAuthURLString = [NSString stringWithFormat:@"%@/oauth/authorize?client_id=%@&redirect_uri=%@&scope=%@&response_type=token", OAuthURL, clientId, redirectURL, scope];
    
    NSURL *OAuthURL = [NSURL URLWithString:OAuthURLString];
    
    self.loginView = [[SFSafariViewController alloc] initWithURL:OAuthURL];
    
    [viewController presentViewController:self.loginView animated:YES completion:^{
        if (completion) {
            completion();
        }
    }];

    return self.loginView;
}

- (NSMutableDictionary *)queryDictionaryForReturnURL:(NSURL *)URL {
    NSString *query = URL.fragment;
    NSArray *queryComponents = [query componentsSeparatedByString:@"&"];
    NSMutableDictionary *queryDictionary = [[NSMutableDictionary alloc] init];
    for (NSString *part in queryComponents) {
        NSArray *param = [part componentsSeparatedByString:@"="];
        if (param.count == 2) {
            [queryDictionary setObject:param[1] forKey:param[0]];
        }
    }
    return queryDictionary;
}

- (BOOL)processLoginCallback:(NSURL *)url completion:(void (^)(BOOL success, NSString *message))completion {
    NSMutableDictionary *queryDictionary = [self queryDictionaryForReturnURL:url];
    if ([queryDictionary objectForKey:@"access_token"]) {
        if (self.loginView) {
            [self.loginView dismissViewControllerAnimated:NO completion:nil];
        }
        [[TSDKTeamSnap sharedInstance] loginWithOAuthToken:[queryDictionary objectForKey:@"access_token"] completion:^(BOOL success, NSString *message) {
            if (completion) {
                completion(success, message);
            }
        }];
        return YES;
    } else {
        return NO;
    }
}

- (void)logoutWithCompletion:(TSDKSimpleCompletionBlock)completion {
    NSString *logoutURL = [NSString stringWithFormat:@"%@/logout", OAuthURL];
    
    [self clearCacheInformation];
    
    SFSafariViewController *webController = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:logoutURL]];
    UIWindow __block *logoutWindow = [[UIWindow alloc] initWithFrame:CGRectMake(-1, -1, 1, 1)];
    logoutWindow.rootViewController = webController;
    
    logoutWindow.hidden = NO;
    
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        //code to be executed on the main queue after delay
        logoutWindow.hidden = YES;
        logoutWindow = nil;
    });
    
    TSDKTeamSnap __weak *weakSelf = self;
    
    [TSDKDataRequest invalidateToken:self.OAuthToken completion:^(BOOL success, NSError * _Nullable error) {
        weakSelf.OAuthToken = nil;
        if (completion) {
            completion(YES, nil);
        }
    }];
}

- (void)dismissVewController:(UIViewController *)viewController {
    [viewController dismissViewControllerAnimated:NO completion:nil];
}

#endif

- (void)publicFeaturesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(void (^)(TSDKPublicFeatures *publicFeatures))completion {
    if (self.publicFeatures) {
        if (completion) {
            completion(self.publicFeatures);
        }
    } else {
        TSDKTeamSnap __weak *weakSelf = self;
        
        //        [self rootLinksWithCompletion:^(TSDKRootLinks *rootLinks) { //self.rootLinks.linkPublicFeatures
        [TSDKDataRequest requestJSONObjectsForPath:[[TSDKDataRequest baseURL] URLByAppendingPathComponent:@"public_features"]  sendDataDictionary:nil method:nil withCompletion:^(BOOL success, BOOL complete, id objects, NSError *error) {
            self.publicFeatures = [[TSDKPublicFeatures alloc] initWithCollection:objects];
            if (completion) {
                completion(weakSelf.publicFeatures);
            }
        }];
        //        }];
    }
}

- (void)rootLinksWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKRootLinkCompletionBlock)completion {
    TSDKSimpleCompletionBlock schemaCompletionBlock  = ^(BOOL success, NSError *error) {
        if (success) {
            if (completion) {
                completion(self.rootLinks);
            }
        } else {
            completion(nil);
        }
    };
    
    if (self.rootLinks) {
        [self.rootLinks getSchemasWithConfiguration:configuration completion:schemaCompletionBlock];
    } else {
        TSDKTeamSnap __weak *weakSelf = self;
        
        [TSDKDataRequest requestObjectsForPath:[TSDKDataRequest baseURL] withConfiguration:configuration completion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
            if (success) {
                weakSelf.rootLinks = [[TSDKRootLinks alloc] initWithCollection:objects];
            
                if (self.OAuthToken) {
                    [TSPCache saveObject:weakSelf.rootLinks];
                }
            
                [self.rootLinks getSchemasWithConfiguration:configuration completion:schemaCompletionBlock];
            } else {
                if (completion) {
                    completion(weakSelf.rootLinks);
                }
            }
        }];
    }
}

- (void)processInitialConnectionWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(void (^)(BOOL success, NSString *message))completion {
    TSDKTeamSnap __weak *weakSelf = self;
    self.rootLinks = nil;
    
    [self rootLinksWithConfiguration:configuration completion:^(TSDKRootLinks *rootLinks) {
        [TSDKDataRequest requestObjectsForPath:rootLinks.linkMe withConfiguration:configuration completion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
            if (success) {
                weakSelf.teamSnapUser = [TSDKObjectsRequest processLoginCollectionJSON:objects];
                success = (BOOL)weakSelf.teamSnapUser;
                
                [[[TSDKTeamSnap sharedInstance] teamSnapUser] myMembersOnTeamsWithConfiguration:configuration completion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
                    NSString *message = nil;
                    
                    if (completion) {
                        completion(success, message);
                    }
                }];
            } else {
                completion(success, error.description);
            }
        }];
        
        [self getPlansWithConfiguration:configuration completion:^(BOOL success, NSString *message) {
            
        }];
    }];
}

- (void)getPlansWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(void (^)(BOOL success, NSString *message))completion {
    if (_plans) {
        if (completion) {
            completion(YES, nil);
        }
    } else {
        NSDictionary *cachedPlans = [TSPCache loadDictionaryOfObjectsOfType:[TSDKPlan class]];
        if (cachedPlans) {
            _plans = [NSMutableDictionary dictionaryWithDictionary:cachedPlans];
            if (completion) {
                completion(YES, nil);
            }
        } else {
            [self rootLinksWithConfiguration:configuration completion:^(TSDKRootLinks *rootLinks) {
                [TSDKDataRequest requestObjectsForPath:rootLinks.linkPlansAll withConfiguration:configuration completion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
                    if (success) {
                        NSArray *plans = [TSDKObjectsRequest SDKObjectsFromCollection:objects];
                        NSMutableDictionary *tempPlanDictionary = [[NSMutableDictionary alloc] init];
                        for (TSDKPlan *plan in plans) {
                            [tempPlanDictionary setObject:plan forIntegerKey:plan.objectIdentifier];
                        }
                        _plans = tempPlanDictionary;
                        [TSPCache saveDictionaryOfObjects:_plans ofType:[TSDKPlan class]];
                    }
                    if (completion) {
                        completion(success, error.localizedDescription);
                    }
                }];
            }];
        }
    }
}

- (void)invitationStatusForEmailAddress:(NSString *)emailAddress withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKInviteStatusCompletionBlock)completionBlock {
    [TSDKObjectsRequest invitationStatusForEmailAddress:emailAddress withCompletion:completionBlock];
}

- (void)sendPendingInvitesForEmailAddress:(NSString *)emailAddress withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKCompletionBlock)completionBlock {
    [TSDKRootLinks actionSendInvitationsToEmailaddress:emailAddress WithCompletion:completionBlock];
}

- (void)sendNewUserWelcomeToEmail:(NSString *)email callbackURL:(NSURL *)URL withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKCompletionBlock)completionBlock {
    [self rootLinksWithConfiguration:configuration completion:^(TSDKRootLinks *rootLinks) {
        
    }];
}


- (void)tslPhotoUploadURLWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(void (^)(TSDKTslPhotos *TSDKTslPhotos))completion {
    [self rootLinksWithConfiguration:configuration completion:^(TSDKRootLinks *rootLinks) {
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

- (NSMutableDictionary *)plans {
    if (!_plans) {
        _plans = [[NSMutableDictionary alloc] init];
    }
    return _plans;
}

- (void)addPlan:(TSDKPlan *)plan {
    [self.plans setObject:plan forIntegerKey:plan.objectIdentifier];
}

- (TSDKPlan *)planWithId:(NSInteger)planId {
    return [_plans objectForIntegerKey:planId];
}

- (void)planForPlanId:(NSInteger)planId withConfiguration:(TSDKRequestConfiguration *)configuration completion:(void (^)(TSDKPlan *plan))completion {
    if (_plans && [_plans objectForIntegerKey:planId]) {
        if (completion) {
            completion([_plans objectForIntegerKey:planId]);
        }
    } else {
        [TSDKDataRequest requestObjectsForPath:self.rootLinks.linkPlansAll withConfiguration:configuration completion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
            NSArray *planObjcts = [TSDKObjectsRequest SDKObjectsFromCollection:objects];
            for (TSDKPlan *plan in planObjcts) {
                [self addPlan:plan];
            }
            if (completion) {
                completion([_plans objectForIntegerKey:planId]);
            }
        }];
    }
}

#pragma mark - Cache
- (void)setCachePathURL:(NSURL *)cachePath {
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

@end