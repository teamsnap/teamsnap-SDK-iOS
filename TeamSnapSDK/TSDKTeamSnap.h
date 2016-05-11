//
// Created by Jason Rahaim on 1/29/15.
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKDataRequest.h"

#if TARGET_OS_IPHONE
#import <SafariServices/SafariServices.h>
#endif

@class TSDKRequestConfiguration, TSDKUser, TSDKTeam, TSDKRootLinks, TSDKPublicFeatures, TSDKTslPhotos, TSDKPlan, SFSafariViewController;

@interface TSDKTeamSnap : NSObject

@property (nonatomic, strong) TSDKUser *teamSnapUser;
@property (nonatomic, copy) NSString *clientId;
@property (nonatomic, copy) NSString *clientSecret;
@property (nonatomic, copy) NSString *OAuthToken;
@property (strong, nonatomic) TSDKRootLinks *rootLinks;

+ (instancetype)sharedInstance;
+ (NSURL *)baseURL;
+ (void)setBaseURL:(NSURL *)url;

- (void)loginWithOAuthToken:(NSString *)OAuthToken completion:(void (^)(BOOL success, NSString *message))completion;

#if TARGET_OS_IPHONE
- (SFSafariViewController *)presentLoginInViewController:(UIViewController *)viewController animated:(BOOL)animated clientId:(NSString *)clientId scope:(NSString *)scope redirectURL:(NSString *)redirectURL completion:(void (^)(void))completion;
- (BOOL)processLoginCallback:(NSURL *)url completion:(void (^)(BOOL success, NSString *message))completion;
// OAuth doesn't require logfout, but this handles logging out of the OAuth web view. Otherwise even if you forget the OAuth token, when you present the OAuth login view it will remember the users cookies and log them in automatically.  
- (void)logoutWithCompletion:(TSDKSimpleCompletionBlock)completion;
#endif

- (void)publicFeaturesWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(void (^)(TSDKPublicFeatures *publicFeatures))completion;
- (void)rootLinksWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKRootLinkCompletionBlock)completion;
- (void)invitationStatusForEmailAddress:(NSString *)emailAddress withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKInviteStatusCompletionBlock)completionBlock;
- (void)sendPendingInvitesForEmailAddress:(NSString *)emailAddress withConfiguration:(TSDKRequestConfiguration *)configuration completion:(TSDKCompletionBlock)completionBlock;
- (void)tslPhotoUploadURLWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(void (^)(TSDKTslPhotos *TSDKTslPhotos))completion;
- (void)getPlansWithConfiguration:(TSDKRequestConfiguration *)configuration completion:(void (^)(BOOL success, NSString *message))completion;
- (void)addPlan:(TSDKPlan *)plan;
- (TSDKPlan *)planWithId:(NSInteger)planId;
- (void)planForPlanId:(NSInteger)planId withConfiguration:(TSDKRequestConfiguration *)configuration completion:(void (^)(TSDKPlan *plan))completion;
- (void)setCachePathURL:(NSURL *)cachePath;
- (void)setCacheTimeoutMinutes:(NSUInteger)timeoutMinutes;
- (void)clearCache;

@end