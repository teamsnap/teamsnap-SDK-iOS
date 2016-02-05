//
// Created by Jason Rahaim on 1/29/15.
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKDataRequest.h"

#if TARGET_OS_IPHONE
#import <SafariServices/SafariServices.h>
#endif

@class TSDKUser, TSDKTeam, TSDKRootLinks, TSDKPublicFeatures, TSDKTslPhotos, TSDKPlan, SFSafariViewController;

@interface TSDKTeamSnap : NSObject

@property (nonatomic, strong) TSDKUser *teamSnapUser;
@property (nonatomic, copy) NSString *clientId;
@property (nonatomic, copy) NSString *clientSecret;
@property (nonatomic, copy) NSString *OAuthToken;
@property (strong, nonatomic) TSDKRootLinks *rootLinks;

+ (instancetype)sharedInstance;
+ (NSURL *)baseURL;
+ (void)setBaseURL:(NSURL *)url;

- (void)loginWithOAuthToken:(NSString *)OAuthToken completion:(void (^)(bool success, NSString *message))completion;
- (void)logout;

#if TARGET_OS_IPHONE
- (SFSafariViewController *)presentLoginInViewController:(UIViewController *)viewController animated:(BOOL)animated clientId:(NSString *)clientId scope:(NSString *)scope redirectURL:(NSString *)redirectURL completion:(void (^)(void))completion;
- (BOOL)processLoginCallback:(NSURL *)url completion:(void (^)(bool success, NSString *message))completion;
#endif

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