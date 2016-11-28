//
// Created by Jason Rahaim on 1/29/15.
// Copyright (c) 2015 TeamSnap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSDKDataRequest.h"
#import "TSDKLogging.h"

#if TARGET_OS_IPHONE
#import <SafariServices/SafariServices.h>
#endif

@class TSDKRequestConfiguration, TSDKUser, TSDKTeam, TSDKRootLinks, TSDKPublicFeatures, TSDKTslPhotos, TSDKPlan, SFSafariViewController;

@interface TSDKTeamSnap : NSObject

@property (nonatomic, strong, nullable) TSDKUser *teamSnapUser;
@property (nonatomic, copy, nullable) NSString *clientId;
@property (nonatomic, copy, nullable) NSString *clientSecret;
@property (nonatomic, copy, nullable) NSString *OAuthToken;
@property (strong, nonatomic, nullable) TSDKRootLinks *rootLinks;

+ (instancetype _Nonnull)sharedInstance;
+ (NSURL * _Nonnull)baseURL;
+ (void)setBaseURL:(NSURL * _Nonnull)url;

- (void)loginWithOAuthToken:(NSString * _Nonnull)OAuthToken completion:(nullable void (^)(BOOL success, NSString *  _Nullable message))completion;
- (void)logout;

#if TARGET_OS_IPHONE
- (SFSafariViewController * _Nonnull)presentLoginInViewController:(UIViewController * _Nonnull)viewController animated:(BOOL)animated clientId:(NSString * _Nonnull)clientId scope:(NSString * _Nonnull)scope redirectURL:(NSString * _Nonnull)redirectURL completion:(nullable void (^)(void))completion;
- (BOOL)processLoginCallback:(NSURL * _Nonnull)url completion:(nullable void (^)(BOOL success, NSString *  _Nullable message))completion;
#endif

- (void)publicFeaturesWithConfiguration:(TSDKRequestConfiguration * _Nullable)configuration completion:(nullable void (^)(TSDKPublicFeatures * _Nullable publicFeatures))completion;
- (void)rootLinksWithConfiguration:(TSDKRequestConfiguration * _Nullable)configuration completion:(TSDKRootLinkCompletionBlock _Nullable)completion;
- (void)invitationStatusForEmailAddress:(NSString * _Nonnull)emailAddress withConfiguration:(TSDKRequestConfiguration * _Nullable)configuration completion:(TSDKInviteStatusCompletionBlock _Nullable)completionBlock;
- (void)sendPendingInvitesForEmailAddress:(NSString * _Nonnull)emailAddress withConfiguration:(TSDKRequestConfiguration * _Nullable)configuration completion:(TSDKCompletionBlock _Nullable)completionBlock;
- (void)tslPhotoUploadURLWithConfiguration:(TSDKRequestConfiguration * _Nullable)configuration completion:(nullable void (^)(TSDKTslPhotos * _Nullable TSDKTslPhotos))completion;
- (void)getPlansWithConfiguration:(TSDKRequestConfiguration * _Nullable)configuration completion:(TSDKPlanArrayCompletionBlock _Nullable)completion;
- (void)addPlan:(TSDKPlan * _Nonnull)plan;
- (TSDKPlan * _Nullable)planWithId:(NSInteger)planId;
- (void)planForPlanId:(NSInteger)planId withConfiguration:(TSDKRequestConfiguration * _Nullable)configuration completion:(nullable void (^)(TSDKPlan * _Nullable plan))completion;
- (void)setCachePathURL:(NSURL * _Nonnull)cachePath;
- (void)setCacheTimeoutMinutes:(NSUInteger)timeoutMinutes;
- (void)clearCache;

@end
