//
//  Authentication.swift
//  TeamSnapSDK
//
//  Created by James Hays on 5/4/17.
//  Copyright © 2017 teamsnap. All rights reserved.
//

import Foundation
import TeamSnapSDK

fileprivate let apiv3clientId = "99e4c2942cdafa8e93c6bddf1f2912c026157088f972d0cf3f236e6d88042f96";
fileprivate let apiv3scope = "read";
fileprivate let apiv3redirectURL = "teamsnapsdk://oauth-callback/teamsnap";

public extension UIViewController {
    var authenticatedUser: TSDKUser? {
        return TSDKTeamSnap.sharedInstance().teamSnapUser
    }
    
    func presentAuthentication(animated: Bool = true, completion: @escaping (() -> Void)) {
        let safariVC = TSDKTeamSnap.sharedInstance().presentLogin(in: self, animated: animated, clientId: apiv3scope, scope: apiv3scope, redirectURL: apiv3redirectURL, completion: completion)
        safariVC.navigationController?.setToolbarHidden(true, animated: false)
        safariVC.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
