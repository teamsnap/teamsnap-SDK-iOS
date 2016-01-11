//
// Created by Jason Rahaim on 1/29/15.
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKDataRequest.h"

@class TSDKUser, TSDKTeam, TSDKRootLinks, TSDKPublicFeatures, TSDKTslPhotos, TSDKPlan;

extern NSString * const TSDKTeamSnapSDKErrorDomainKey;

@interface TSDKTeamSnap : NSObject

@property (nonatomic, strong) TSDKUser *teamSnapUser;
@property (nonatomic, strong) NSString *clientId;
@property (nonatomic, strong) NSString *clientSecret;
@property (nonatomic, strong) NSString *OAuthToken;
@property (strong, nonatomic) TSDKRootLinks *rootLinks;

+ (instancetype)sharedInstance;
+ (NSURL *)baseURL;
+ (void)setBaseURL:(NSURL *)url;

- (void)loginWithOAuthToken:(NSString *)OAuthToken completion:(void (^)(bool success, NSString *message))completion;
- (void)loginWithUserName:(NSString *)userName andPassword:(NSString *)password completion:(void (^)(bool success, NSString *message))completion;
- (void)logout;
- (void)publicFeaturesWithCompletion:(void (^)(TSDKPublicFeatures *publicFeatures))completion;
- (void)rootLinksWithCompletion:(TSDKRootLinkCompletionBlock)completion;
- (void)invitationStatusForEmailAddress:(NSString *)emailAddress withCompletion:(TSDKInviteStatusCompletionBlock)completionBlock;
- (void)sendPendingInvitesForEmailAddress:(NSString *)emailAddress withCompletion:(TSDKCompletionBlock)completionBlock;
- (void)tslPhotoUploadURLWithCompletion:(void (^)(TSDKTslPhotos *TSDKTslPhotos))completion;
- (void)getPlansWithCompletion:(void (^)(bool success, NSString *message))completion;
- (void)addPlan:(TSDKPlan *)plan;
- (TSDKPlan *)planWithId:(NSInteger)planId;
- (void)planForPlanId:(NSInteger)planId withCompletion:(void (^)(TSDKPlan *plan))completion;
- (void)setCachePathURL:(NSURL *)cachePath;
- (void)setCacheTimeoutMinutes:(NSUInteger)timeoutMinutes;
- (void)clearCache;

@end