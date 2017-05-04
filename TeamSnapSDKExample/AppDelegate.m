//
//  AppDelegate.m
//  TeamSnapSDKExample
//
//  Created by Marquez Gallegos on 3/14/17.
//  Copyright © 2017 teamsnap. All rights reserved.
//

#import "AppDelegate.h"
#import "AuthenticationViewController.h"
#import "TeamsViewController.h"
#import <TeamSnapSDK/TeamSnapSDK.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    AuthenticationViewController *viewController = [[AuthenticationViewController alloc] initWithNibName:nil bundle:nil];
    self.window.rootViewController = viewController;
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options {
    if ([[TSDKTeamSnap sharedInstance] processLoginCallback:url completion:^(bool success, NSError *error) {
        if (success) {
            UINavigationController *navVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateInitialViewController];
            
            self.window.rootViewController = navVC;
        } else {
            NSLog(@"Login Failed");
        }
    }]) {
        return YES;
    } else {
        NSLog(@"Not Processed");
        return NO;
    }
}
@end
