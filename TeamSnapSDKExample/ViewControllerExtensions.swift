//
//  ViewControllerExtensions.swift
//  TeamSnapSDK
//
//  Created by James Hays on 5/4/17.
//  Copyright © 2017 teamsnap. All rights reserved.
//

import Foundation
import UIKit
import TeamSnapSDK

public extension UIViewController {
    var authenticatedUser: TSDKUser? {
        return TSDKTeamSnap.sharedInstance().teamSnapUser
    }
    
    func showAlert(_ message: String, title: String? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

        self.present(alert, animated: true, completion: nil)
    }
}
