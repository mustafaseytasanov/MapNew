//
//  PasswordHelper.swift
//  Map
//
//  Created by Nikita on 27.01.2022.
//

import Foundation

class PasswordHelper {
    
    func isValidPassword(_ password: String) -> Bool {
        let passwordRegEx = "[A-Za-z0-9 !$%&?._-]{8,}"
        let passwordPred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordPred.evaluate(with: password)
    }
}
