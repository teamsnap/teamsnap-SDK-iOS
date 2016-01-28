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
#import <SafariServices/SafariServices.h>

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

- (void)logout {
    self.teamSnapUser = nil;
    self.OAuthToken = nil;
    self.rootLinks = nil;
}

- (SFSafariViewController *)presentLoginInViewController:(UIViewController *)viewController animated:(BOOL)animated clientId:(NSString *)clientId scope:(NSString *)scope redirectURL:(NSString *)redirectURL completion:(void (^)(void))completion {
    
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

- (BOOL)processLoginCallback:(NSURL *)url completion:(void (^)(bool success, NSString *message))completion {
    NSMutableDictionary *queryDictionary = [self queryDictionaryForReturnURL:url];
    if ([queryDictionary objectForKey:@"access_token"]) {
        if (self.loginView) {
            [self.loginView dismissViewControllerAnimated:NO completion:nil];
        }
        [[TSDKTeamSnap sharedInstance] loginWithOAuthToken:[queryDictionary objectForKey:@"access_token"] completion:^(bool success, NSString *message) {
            if (completion) {
                completion(success, message);
            }
        }];
        return YES;
    } else {
        return NO;
    }
}

- (void)publicFeaturesWithCompletion:(void (^)(TSDKPublicFeatures *publicFeatures))completion {
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

- (void)rootLinksWithCompletion:(TSDKRootLinkCompletionBlock)completion {
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
        [self.rootLinks getSchemasWithCompletion:schemaCompletionBlock];
    } else {
        TSDKTeamSnap __weak *weakSelf = self;
        
        [TSDKDataRequest requestObjectsForPath:[TSDKDataRequest baseURL] withCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
            if (success) {
                weakSelf.rootLinks = [[TSDKRootLinks alloc] initWithCollection:objects];
            
                if (self.OAuthToken) {
                    [TSPCache saveObject:weakSelf.rootLinks];
                }
            
                [self.rootLinks getSchemasWithCompletion:schemaCompletionBlock];
            } else {
                if (completion) {
                    completion(weakSelf.rootLinks);
                }
            }
        }];
    }
}

- (void)processInitialConnectionWithCompletion:(void (^)(bool success, NSString *message))completion {
    TSDKTeamSnap __weak *weakSelf = self;
    self.rootLinks = nil;
    
    [self rootLinksWithCompletion:^(TSDKRootLinks *rootLinks) {
        [TSDKDataRequest requestObjectsForPath:rootLinks.linkMe withCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
            if (success) {
                weakSelf.teamSnapUser = [TSDKObjectsRequest processLoginCollectionJSON:objects];
                success = (BOOL)weakSelf.teamSnapUser;
                
                [[[TSDKTeamSnap sharedInstance] teamSnapUser] myMembersOnTeamsWithCompletion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
                    NSString *message = nil;
                    
                    if (completion) {
                        completion(success, message);
                    }
                }];
            } else {
                completion(success, error.description);
            }
        }];
        
        [self getPlansWithCompletion:^(bool success, NSString *message) {
            
        }];
    }];
}

- (void)getPlansWithCompletion:(void (^)(bool success, NSString *message))completion {
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
            [self rootLinksWithCompletion:^(TSDKRootLinks *rootLinks) {
                [TSDKDataRequest requestObjectsForPath:rootLinks.linkPlansAll withCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
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

- (void)invitationStatusForEmailAddress:(NSString *)emailAddress withCompletion:(TSDKInviteStatusCompletionBlock)completionBlock {
    [TSDKObjectsRequest invitationStatusForEmailAddress:emailAddress withCompletion:completionBlock];
}

- (void)sendPendingInvitesForEmailAddress:(NSString *)emailAddress withCompletion:(TSDKCompletionBlock)completionBlock {
    [TSDKRootLinks actionSendInvitationsToEmailaddress:emailAddress WithCompletion:completionBlock];
}

- (void)sendNewUserWelcomeToEmail:(NSString *)email callbackURL:(NSURL *)URL withCompletion:(TSDKCompletionBlock)completionBlock {
    [self rootLinksWithCompletion:^(TSDKRootLinks *rootLinks) {
        
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

- (void)planForPlanId:(NSInteger)planId withCompletion:(void (^)(TSDKPlan *plan))completion {
    if (_plans && [_plans objectForIntegerKey:planId]) {
        if (completion) {
            completion([_plans objectForIntegerKey:planId]);
        }
    } else {
        [TSDKDataRequest requestObjectsForPath:self.rootLinks.linkPlansAll withCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
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