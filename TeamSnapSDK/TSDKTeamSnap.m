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


@interface TSDKTeamSnap()

@property (nonatomic, strong) TSDKPublicFeatures *publicFeatures;
@property (nonatomic, strong) NSMutableDictionary *plans;

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
            [TSDKDataRequest requestJSONObjectsForPath:[[TSDKDataRequest baseURL] URLByAppendingPathComponent:@"public_features"]  sendDataDictionary:nil method:nil withCompletion:^(BOOL success, BOOL complete, id objects, NSError *error) {
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
            
            [[[TSDKTeamSnap sharedInstance] teamSnapUser] myMembersOnTeamsWithCompletion:^(BOOL success, BOOL complete, NSArray *objects, NSError *error) {
                NSString *message = nil;
                
                if (completion) {
                    completion(success, message);
                }
            }];
        }];
        
        [TSDKDataRequest requestObjectsForPath:rootLinks.linkPlans withCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
            if (success) {
                NSArray *plans = [TSDKObjectsRequest SDKObjectsFromCollection:objects];
                for (TSDKPlan *plan in plans) {
                    [weakSelf addPlan:plan];
                }
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

- (void)planForPlanID:(NSInteger)planId WithCompletion:(void (^)(TSDKPlan *plan))completion {
    if (_plans && [_plans objectForIntegerKey:planId]) {
        if (completion) {
            completion([_plans objectForIntegerKey:planId]);
        }
    } else {
        [TSDKDataRequest requestObjectsForPath:self.rootLinks.linkPlans withCompletion:^(BOOL success, BOOL complete, TSDKCollectionJSON *objects, NSError *error) {
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
    [TSPCache setCacheRootPath:cachePath];
}

- (void)setCacheTimeoutMinutes:(NSUInteger)timeoutMinutes {
    [TSPCache setCacheMaxAgeInMinutes:timeoutMinutes];
}

- (void)clearCache {
    [TSPCache invalidateAll];
}

@end