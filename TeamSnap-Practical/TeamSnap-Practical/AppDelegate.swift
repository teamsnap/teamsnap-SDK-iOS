//
//  AppDelegate.swift
//  TeamSnap-Practical
//
//  Created by Lars Anderson on 10/15/20.
//

import UIKit
import TeamSnapSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        TSDKTeamSnap.sharedInstance().login(withOAuthToken: Constants.SNAPI.authToken) { (success, user, error) in
            NotificationCenter.default.post(name: TSNotifications.DidLogin, object: user)
        }
        return true
    }
}

