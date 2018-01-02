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

- (void)loginWithOAuthToken:(NSString * _Nonnull)OAuthToken completion:(nullable void (^)(BOOL success, NSError  * _Nullable error, TSDKUser * _Nullable user))completion;
- (void)logout;


/**
 Combined Contacts is a version breaking feature that will be used in a future version of the SDK. It deprecates member_email_address (except for POST in the 1st version), and makes TSDKContact the primary way a user is associated to a Team.
 */
- (void)configureForCombinedContactFeature;
- (BOOL)combinedContactFeatureIsActive;

#if TARGET_OS_IPHONE
- (SFSafariViewController * _Nonnull)presentLoginInViewController:(UIViewController * _Nonnull)viewController animated:(BOOL)animated clientId:(NSString * _Nonnull)clientId scope:(NSString * _Nonnull)scope redirectURL:(NSString * _Nonnull)redirectURL completion:(nullable void (^)(void))completion;
- (BOOL)processLoginCallback:(NSURL * _Nonnull)url completion:(nullable void (^)(BOOL success, NSError *  _Nullable error))completion;
#endif

- (void)publicFeaturesWithConfiguration:(TSDKRequestConfiguration * _Nullable)configuration completion:(nullable void (^)(TSDKPublicFeatures * _Nullable publicFeatures))completion;
- (void)rootLinksWithConfiguration:(TSDKRequestConfiguration * _Nullable)configuration completion:(TSDKRootLinkCompletionBlock _Nullable)completion;
- (void)invitationStatusForEmailAddress:(NSString * _Nonnull)emailAddress withConfiguration:(TSDKRequestConfiguration * _Nullable)configuration completion:(TSDKInviteStatusCompletionBlock _Nullable)completionBlock;
- (void)sendPendingInvitesForEmailAddress:(NSString * _Nonnull)emailAddress withConfiguration:(TSDKRequestConfiguration * _Nullable)configuration completion:(TSDKCompletionBlock _Nullable)completionBlock;
- (void)tslPhotoUploadURLWithConfiguration:(TSDKRequestConfiguration * _Nullable)configuration completion:(nullable void (^)(TSDKTslPhotos * _Nullable TSDKTslPhotos))completion;
- (void)setCachePathURL:(NSURL * _Nonnull)cachePath;
- (void)setCacheTimeoutMinutes:(NSUInteger)timeoutMinutes;
- (void)clearCache;
- (NSURL *_Nonnull)cachePath;

@end
