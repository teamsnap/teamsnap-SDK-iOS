//
//  StringExtensions.swift
//  TeamSnapSDK
//
//  Created by James Hays on 5/4/17.
//  Copyright © 2017 teamsnap. All rights reserved.
//

import Foundation

extension String {
    var nullifiedEmptyString: String? {
        var result: String? = self
        
        switch result {
        case .some(""):
            result = nil
        default:
            break
        }
        return result
    }
}
