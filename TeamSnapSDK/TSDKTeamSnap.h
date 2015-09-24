//
// Created by Jason Rahaim on 1/29/15.
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TSDKUser, TSDKTeam, TSDKRootLinks, TSDKPublicFeatures, TSDKTslPhotos;

@interface TSDKTeamSnap : NSObject

@property (nonatomic, strong) TSDKUser *teamSnapUser;
@property (nonatomic, strong) NSArray *teams;
@property (nonatomic, strong) NSString *clientId;
@property (nonatomic, strong) NSString *clientSecret;
@property (nonatomic, strong) NSString *OAuthToken;
@property (strong, nonatomic) TSDKRootLinks *rootLinks;

+ (instancetype)sharedInstance;

- (void)loginWithOAuthToken:(NSString *)OAuthToken completion:(void (^)(bool success, NSString *message))completion;
- (void)loginWithUserName:(NSString *)userName andPassword:(NSString *)password completion:(void (^)(bool success, NSString *message))completion;
- (void)logout;
- (void)publicFeaturesWithCompletion:(void (^)(TSDKPublicFeatures *publicFeatures))completion;
- (void)tslPhotoUploadURLWithCompletion:(void (^)(TSDKTslPhotos *TSDKTslPhotos))completion;
@end