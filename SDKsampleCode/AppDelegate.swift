//
//  AppDelegate.swift
//  SDKsampleCode
//
//  Created by Jason Rahaim on 10/23/16.
//  Copyright © 2016 teamsnap. All rights reserved.
//

import UIKit
import TeamSnapSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?
    public var TeamSnapSDKClientId : String?
    public var TeamSnapSDKCallbackURL : String?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        if let infoPlist = Bundle.main.infoDictionary {
            if let clientId = infoPlist["TeamSnapSDK-clientId"] as? String, let callBackURL = infoPlist["TeamSnapSDK-callBack"] as? String {
                TeamSnapSDKClientId = clientId
                TSDKTeamSnap.sharedInstance().clientId = TeamSnapSDKClientId
                TeamSnapSDKCallbackURL = callBackURL
            } else if let path = Bundle.main.path(forResource: "sampleConfig", ofType: "plist"), let configPlist = NSDictionary(contentsOfFile: path) as? Dictionary<String,AnyObject>, let clientId = configPlist["TeamSnapSDK-clientId"] as? String, let callBackURL = configPlist["TeamSnapSDK-callBack"] as? String {
                // Read from alternate config file
                TeamSnapSDKClientId = clientId
                TSDKTeamSnap.sharedInstance().clientId = TeamSnapSDKClientId
                TeamSnapSDKCallbackURL = callBackURL
            }
        }
        let splitViewController = self.window!.rootViewController as! UISplitViewController
        let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count-1] as! UINavigationController
        navigationController.topViewController!.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
        splitViewController.delegate = self
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        if TSDKTeamSnap.sharedInstance().processLoginCallback(url, completion: { (loginSuccess : Bool, error: String?) in
            if loginSuccess {
                let defaults = UserDefaults.standard
                defaults.set(TSDKTeamSnap.sharedInstance().oAuthToken, forKey: "teamSnapUserToken")
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "TeamSnapLoggedIn"), object: nil)
            } else {
                print("Login failed")
            }
        }) {
            return true
        } else {
            return false
        }
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // MARK: - Split view

    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
        guard let topAsDetailController = secondaryAsNavController.topViewController as? DetailViewController else { return false }
        if topAsDetailController.detailItem == nil {
            // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
            return true
        }
        return false
    }

}

