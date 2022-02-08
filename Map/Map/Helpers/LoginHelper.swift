//
//  LoginHelper.swift
//  Map
//
//  Created by Nikita on 27.01.2022.
//

import Foundation

class LoginHelper {
    
    func isValidLogin(_ login: String) -> Bool {
        let loginRegEx = "^[a-zA-Z-]+ ?.* [a-zA-Z-]+$"
        let loginPred = NSPredicate(format:"SELF MATCHES %@", loginRegEx)
        return loginPred.evaluate(with: login)
    }
}
